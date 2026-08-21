import 'package:flutter_test/flutter_test.dart';

/// Lookup maps are cached to Isar and, once present, served without ever
/// re-reading the server. That is right for a real cache and wrong for the
/// placeholder the old backend produced, where `getDepartmentLookup` returned
/// `map[code] = code`. A device that cached that answer would show department
/// codes forever, even after the backend gained real descriptions — which is
/// exactly what happened.
///
/// The guard is a property of the data, not a version flag, so a device heals
/// itself the first time it reaches a good backend.
bool isDegenerate(Map<String, String> map) =>
    map.isNotEmpty &&
    map.entries.every(
        (e) => e.value.trim().toUpperCase() == e.key.trim().toUpperCase());

void main() {
  departmentScopingTests();
  webCurationTests();
  departmentKeyTests();
  sectionVisibilityTests();
  envelopeTests();
  deferredApplyTests();
  staleDeptCacheTests();
  repaintScopeTests();
  singleFlightTests();
  backgroundSyncShapeTests();
  selectionSurvivalTests();

  group('placeholder lookup detection', () {
    test('a code-only map is rejected', () {
      expect(isDegenerate({'AVT': 'AVT', 'BSS': 'BSS', 'CA': 'CA'}), isTrue);
    });

    test('real descriptions are kept', () {
      expect(
        isDegenerate({
          'AVT': 'ATVANTIC IMPORT & EXPORT SB',
          'BSS': 'BANDWIN STRAPPING SYSTEMS',
        }),
        isFalse,
      );
    });

    test('one real description is enough to keep the whole map', () {
      // Departments with no row in PI_Department legitimately fall back to
      // their code, so a partial map must not be thrown away.
      expect(isDegenerate({'AVT': 'ATVANTIC IMPORT & EXPORT SB', 'XX': 'XX'}),
          isFalse);
    });

    test('an empty map is not treated as placeholder data', () {
      // Nothing cached yet — the normal fetch path handles this, and calling
      // it degenerate would log a spurious refetch on every cold start.
      expect(isDegenerate({}), isFalse);
    });

    test('case and padding differences do not count as a real description', () {
      // char() columns arrive padded, and the old backend echoed the raw code.
      expect(isDegenerate({'AVT': 'avt', 'BSS': ' BSS '}), isTrue);
    });
  });
}

/// A department code is unique only within its group. In the web taxonomy AVT
/// is "Aluminium" under HA and "Towel and Sock" under S4 — seven meanings in
/// all — so a flat code→description map serves whichever row was written last
/// and labels four fifths of them wrongly.
const String ambiguous = '::ambiguous::';

String labelForDepartment(
  Map<String, String> descriptions,
  String dept, {
  List<String>? selectedGroups,
}) {
  final code = dept.trim().toUpperCase();
  if (selectedGroups != null && selectedGroups.length == 1) {
    final scoped = descriptions['${selectedGroups.first.trim()}|$code'];
    if (scoped != null && scoped.isNotEmpty) return scoped;
  }
  final flat = descriptions[dept.trim()] ?? descriptions[code];
  if (flat == null || flat.isEmpty || flat == ambiguous) return dept.trim();
  return flat;
}

void departmentScopingTests() {
  // AVT means different things per group; PBT means one thing.
  final web = <String, String>{
    'HA|AVT': 'Aluminium',
    'S4|AVT': 'Towel and Sock',
    'AVT': ambiguous,
    'HC|PBT': 'PERNIAGAAN BENG TEONG SB',
    'PBT': 'PERNIAGAAN BENG TEONG SB',
  };

  group('department label resolution', () {
    test('a single selected group decides the meaning', () {
      expect(labelForDepartment(web, 'AVT', selectedGroups: ['HA']),
          'Aluminium');
      expect(labelForDepartment(web, 'AVT', selectedGroups: ['S4']),
          'Towel and Sock');
    });

    test('with no group chosen, an ambiguous code shows as the code', () {
      // Better an honest 'AVT' than a confident wrong 'Towel and Sock'.
      expect(labelForDepartment(web, 'AVT'), 'AVT');
    });

    test('several groups selected is still ambiguous', () {
      expect(labelForDepartment(web, 'AVT', selectedGroups: ['HA', 'S4']),
          'AVT');
    });

    test('an unambiguous code resolves without any group', () {
      expect(labelForDepartment(web, 'PBT'), 'PERNIAGAAN BENG TEONG SB');
    });

    test('a group with no entry for that code falls back, not throws', () {
      expect(labelForDepartment(web, 'AVT', selectedGroups: ['HZ']), 'AVT');
    });

    test('unknown codes are returned as-is', () {
      expect(labelForDepartment(web, 'ZZZ'), 'ZZZ');
    });
  });
}

/// Web mode publishes a curated subset of the PI hierarchy: 28 of PI's 68
/// departments have an active Web_Dept row. A department with no web row is
/// not a web department, so it is dropped rather than shown as a bare code.
List<String> visibleCodes(
  List<String>? codes,
  Map<String, String> descriptions, {
  required bool webMode,
}) {
  if (codes == null) return const [];
  if (!webMode) return codes;
  return codes
      .where((c) =>
          descriptions.containsKey(c.trim()) ||
          descriptions.containsKey(c.trim().toUpperCase()) ||
          descriptions.keys.any((k) => k.endsWith('|${c.trim().toUpperCase()}')))
      .toList();
}

void webCurationTests() {
  // JTC/EE/KOH are published; CAM/XIN/KSI exist in PI only.
  final webNames = <String, String>{
    'HP|JTC': 'AppleLady',
    'HP|EE': 'Elianware',
    'HP|KOH': 'Kiwi',
  };
  final piDepts = ['JTC', 'EE', 'KOH', 'CAM', 'XIN', 'KSI'];

  group('web curation', () {
    test('web mode keeps only published departments', () {
      expect(visibleCodes(piDepts, webNames, webMode: true),
          ['JTC', 'EE', 'KOH']);
    });

    test('PI mode shows everything, published or not', () {
      expect(visibleCodes(piDepts, webNames, webMode: false), piDepts);
    });

    test('matching tolerates padding and case from char() columns', () {
      expect(visibleCodes([' jtc '], webNames, webMode: true), [' jtc ']);
    });

    test('a flat key works as well as a group-scoped one', () {
      expect(visibleCodes(['BSS'], {'BSS': 'BANDWIN'}, webMode: true), ['BSS']);
    });

    test('nothing published yields an empty list, not everything', () {
      // The filter section then hides itself rather than offering dead chips.
      expect(visibleCodes(piDepts, const {}, webMode: true), isEmpty);
    });
  });
}

/// A department is identified by group AND code: the same code is reused under
/// several groups with a different meaning in each. Selections therefore carry
/// "GRP|DEPT", and a chip reads "HA - Aluminium".
String groupOfKey(String key) {
  final bar = key.indexOf('|');
  return bar < 0 ? '' : key.substring(0, bar).trim();
}

String codeOfKey(String key) {
  final bar = key.indexOf('|');
  return (bar < 0 ? key : key.substring(bar + 1)).trim();
}

bool matchesDepartment(List<String> selected, String itemGrp, String itemDept) {
  final dept = itemDept.trim().toUpperCase();
  if (dept.isEmpty) return false;
  final grp = itemGrp.trim().toUpperCase();
  for (final raw in selected) {
    final sel = raw.trim().toUpperCase();
    if (sel.isEmpty) continue;
    final bar = sel.indexOf('|');
    if (bar < 0) {
      if (sel == dept) return true;
    } else if (sel.substring(0, bar) == grp && sel.substring(bar + 1) == dept) {
      return true;
    }
  }
  return false;
}

void departmentKeyTests() {
  group('group-qualified departments', () {
    test('a key splits into group and code', () {
      expect(groupOfKey('HA|AVT'), 'HA');
      expect(codeOfKey('HA|AVT'), 'AVT');
    });

    test('a bare code has no group', () {
      expect(groupOfKey('AVT'), '');
      expect(codeOfKey('AVT'), 'AVT');
    });

    test('selecting HA|AVT does not match AVT under another group', () {
      // This is the whole point: six departments share the code AVT.
      expect(matchesDepartment(['HA|AVT'], 'HA', 'AVT'), isTrue);
      expect(matchesDepartment(['HA|AVT'], 'HX', 'AVT'), isFalse);
    });

    test('a bare selection still matches any group, for older saved filters', () {
      expect(matchesDepartment(['AVT'], 'HA', 'AVT'), isTrue);
      expect(matchesDepartment(['AVT'], 'HX', 'AVT'), isTrue);
    });

    test('several selections are ORed', () {
      expect(matchesDepartment(['HA|AVT', 'HP|JTC'], 'HP', 'JTC'), isTrue);
    });

    test('padding and case from char() columns do not defeat matching', () {
      expect(matchesDepartment([' ha|avt '], 'HA ', ' AVT'), isTrue);
    });

    test('an item with no department matches nothing', () {
      expect(matchesDepartment(['HA|AVT'], 'HA', '   '), isFalse);
    });
  });
}

/// A section hides when it cannot narrow anything — every item shares the one
/// value, or the values are the 'NA' placeholder. But once a parent filter is
/// applied, a single remaining option is a real choice: selecting a group that
/// contains exactly one department must not make the department section vanish.
bool isInformative(List<String>? values, {bool narrowed = false}) {
  if (values == null) return false;
  final real = values
      .map((v) => v.trim())
      .where((v) {
        final code = codeOfKey(v).toUpperCase();
        return v.isNotEmpty && code.isNotEmpty && code != 'NA';
      })
      .toSet();
  if (real.length >= 2) return true;
  return narrowed && real.isNotEmpty;
}

void sectionVisibilityTests() {
  group('filter section visibility', () {
    test('two or more options always show', () {
      expect(isInformative(['HP|JTC', 'HP|EE']), isTrue);
    });

    test('a single option hides when nothing upstream is selected', () {
      expect(isInformative(['HP|JTC']), isFalse);
    });

    test('a single option shows once a group narrowed the list', () {
      expect(isInformative(['HP|JTC'], narrowed: true), isTrue);
    });

    test("the 'NA' placeholder never counts, narrowed or not", () {
      expect(isInformative(['HP|NA'], narrowed: true), isFalse);
      expect(isInformative(['NA', 'NA']), isFalse);
    });

    test('an empty or null list hides', () {
      expect(isInformative(const []), isFalse);
      expect(isInformative(null, narrowed: true), isFalse);
    });
  });
}

/// A previous build fed the hub envelope straight into the normaliser, so the
/// keys 'rows' and 'map' were cached as taxonomy codes — the device ended up
/// with exactly two bogus groups. They cannot be told from real data by shape,
/// so they are named.
const Set<String> envelopeArtefacts = {'rows', 'map'};
bool isEnvelopeArtefact(String code) =>
    envelopeArtefacts.contains(code.trim().toLowerCase());

dynamic unwrapEnvelope(dynamic result) {
  if (result is! Map) return result;
  final rows = result['rows'];
  if (rows is List && rows.isNotEmpty) return rows;
  final map = result['map'];
  if (map is Map) return map;
  return result;
}

void envelopeTests() {
  group('lookup envelope', () {
    test('rows are preferred over the flat map', () {
      final out = unwrapEnvelope({
        'rows': [
          {'code': 'HA', 'description': 'ALUMINIUM'}
        ],
        'map': {'HA': 'ALUMINIUM'},
      });
      expect(out, isA<List>());
    });

    test('an empty rows list falls back to the map', () {
      final out = unwrapEnvelope({
        'rows': [],
        'map': {'HA': 'ALUMINIUM'}
      });
      expect(out, isA<Map>());
      expect((out as Map)['HA'], 'ALUMINIUM');
    });

    test('a bare map from an older hub passes through', () {
      final out = unwrapEnvelope({'HA': 'ALUMINIUM', 'HB': 'BROOM'});
      expect((out as Map).length, 2);
    });

    test("'rows' and 'map' are recognised as artefacts, real codes are not", () {
      expect(isEnvelopeArtefact('rows'), isTrue);
      expect(isEnvelopeArtefact('MAP'), isTrue);
      expect(isEnvelopeArtefact('HA'), isFalse);
      expect(isEnvelopeArtefact('AVT'), isFalse);
    });

    test('an unwrapped envelope would have yielded exactly two codes', () {
      // The symptom that gave this away: "Saved 2 web groups".
      final naive = {'rows': [], 'map': {}}.keys.toList();
      expect(naive.length, 2);
      expect(naive.every(isEnvelopeArtefact), isTrue);
    });
  });
}

/// Tapping a filter used to requery and rebuild the whole grid immediately —
/// several seconds of work behind a dialog the operator cannot see through,
/// discarded by the next tap. Changes made while the dialog is open are
/// collected and applied once when it closes.
class FilterApplyPolicy {
  bool dialogOpen = false;
  bool pending = false;
  int reloads = 0;

  void filterChanged() {
    if (dialogOpen) {
      pending = true;
      return;
    }
    reloads++;
  }

  void openDialog() => dialogOpen = true;

  void closeDialog() {
    dialogOpen = false;
    if (pending) {
      pending = false;
      reloads++;
    }
  }
}

void deferredApplyTests() {
  group('deferred filter apply', () {
    test('ten taps inside the dialog cause exactly one reload', () {
      final p = FilterApplyPolicy()..openDialog();
      for (var i = 0; i < 10; i++) {
        p.filterChanged();
      }
      expect(p.reloads, 0, reason: 'nothing reloads while the dialog is open');
      p.closeDialog();
      expect(p.reloads, 1);
    });

    test('closing without changes does not reload', () {
      final p = FilterApplyPolicy()..openDialog();
      p.closeDialog();
      expect(p.reloads, 0);
    });

    test('dismissing still applies — it is not a cancel', () {
      final p = FilterApplyPolicy()..openDialog();
      p.filterChanged();
      p.closeDialog(); // X, barrier or back
      expect(p.reloads, 1);
    });

    test('filters changed outside the dialog reload immediately', () {
      final p = FilterApplyPolicy();
      p.filterChanged();
      expect(p.reloads, 1);
    });

    test('a second visit starts clean', () {
      final p = FilterApplyPolicy()..openDialog();
      p.filterChanged();
      p.closeDialog();
      p.openDialog();
      p.closeDialog();
      expect(p.reloads, 1, reason: 'no phantom reload from the previous visit');
    });
  });
}

/// Departments cached before they became group-qualified carry no group, so a
/// rebuild can only produce bare keys — and a reused code then resolves to
/// whichever row was written last. That is how AVT under "Aluminium &
/// Stainless Steel" came out as "Towel and Sock", which is S4's meaning.
class CachedDept {
  final String groupCode;
  final String departmentCode;
  const CachedDept(this.groupCode, this.departmentCode);
}

bool isPreUpgradeCache(List<CachedDept> rows) =>
    rows.isNotEmpty && rows.every((d) => d.groupCode.trim().isEmpty);

void staleDeptCacheTests() {
  group('pre-upgrade department cache', () {
    test('rows with no group at all are rejected', () {
      expect(
        isPreUpgradeCache(const [CachedDept('', 'AVT'), CachedDept('', 'CA')]),
        isTrue,
      );
    });

    test('group-qualified rows are kept', () {
      expect(
        isPreUpgradeCache(
            const [CachedDept('HA', 'AVT'), CachedDept('S4', 'AVT')]),
        isFalse,
      );
    });

    test('a single qualified row is enough to trust the cache', () {
      // Some departments legitimately have no group from the source.
      expect(
        isPreUpgradeCache(const [CachedDept('HA', 'AVT'), CachedDept('', 'ZZ')]),
        isFalse,
      );
    });

    test('an empty cache is not "pre-upgrade" — there is nothing to reject', () {
      expect(isPreUpgradeCache(const []), isFalse);
    });

    test('whitespace-only groups count as missing', () {
      expect(isPreUpgradeCache(const [CachedDept('   ', 'AVT')]), isTrue);
    });
  });
}

/// While the filter dialog covers the page, a page-level rebuild is invisible
/// work: the grid and every image FutureBuilder rebuild behind the dialog and
/// are discarded by the next tap. Only the dialog repaints; the grid rebuilds
/// once, on close.
class RepaintPolicy {
  bool dialogOpen = false;
  int pageRebuilds = 0;
  int dialogRepaints = 0;

  void mutateFilter() {
    if (dialogOpen) {
      dialogRepaints++;
      return;
    }
    pageRebuilds++;
  }

  void closeDialog({required bool pending}) {
    dialogOpen = false;
    if (pending) pageRebuilds++;
  }
}

void repaintScopeTests() {
  group('repaint scope', () {
    test('taps inside the dialog never rebuild the page', () {
      final p = RepaintPolicy()..dialogOpen = true;
      for (var i = 0; i < 8; i++) {
        p.mutateFilter();
      }
      expect(p.pageRebuilds, 0);
      expect(p.dialogRepaints, 8, reason: 'the dialog still updates');
    });

    test('the page rebuilds once when the dialog closes with changes', () {
      final p = RepaintPolicy()..dialogOpen = true;
      p.mutateFilter();
      p.closeDialog(pending: true);
      expect(p.pageRebuilds, 1);
    });

    test('outside the dialog a change repaints the page directly', () {
      final p = RepaintPolicy();
      p.mutateFilter();
      expect(p.pageRebuilds, 1);
      expect(p.dialogRepaints, 0);
    });
  });
}

/// The page and the filter dialog ask for the same lookups at the same moment.
/// Without sharing, each did a full hub round-trip, wrote the same rows to
/// Isar, and rebuilt the same 6,000-row snapshot — visible in the log as every
/// line appearing twice.
class SingleFlight {
  final Map<String, Future<dynamic>> _inFlight = {};
  int runs = 0;

  Future<T> call<T>(String key, Future<T> Function() run) {
    final existing = _inFlight[key];
    if (existing != null) return existing.then((v) => v as T);
    runs++;
    final fut = run();
    _inFlight[key] = fut;
    return fut.whenComplete(() => _inFlight.remove(key));
  }
}

void singleFlightTests() {
  group('single flight', () {
    test('concurrent callers for one key run the work once', () async {
      final sf = SingleFlight();
      Future<int> work() async {
        await Future<void>.delayed(const Duration(milliseconds: 10));
        return 46;
      }

      final results =
          await Future.wait([sf.call('dept', work), sf.call('dept', work)]);
      expect(sf.runs, 1);
      expect(results, [46, 46], reason: 'both callers get the same answer');
    });

    test('different keys are independent', () async {
      final sf = SingleFlight();
      await Future.wait([
        sf.call('dept|pi', () async => 1),
        sf.call('dept|web', () async => 2),
      ]);
      expect(sf.runs, 2);
    });

    test('a later call after completion runs again', () async {
      final sf = SingleFlight();
      await sf.call('group', () async => 10);
      await sf.call('group', () async => 10);
      expect(sf.runs, 2, reason: 'sharing is only for overlapping calls');
    });

    test('a failure does not wedge the key', () async {
      final sf = SingleFlight();
      await expectLater(
          sf.call<int>('x', () async => throw StateError('boom')), throwsA(isA<StateError>()));
      final ok = await sf.call<int>('x', () async => 7);
      expect(ok, 7);
    });
  });
}

/// The background sync deletes a mode's department rows and rewrites them.
/// While it stored bare codes only, it destroyed the group-qualified entries
/// the foreground lookup had just written — so departments fell back to codes
/// at random, depending on whether it had run since. Both writers must produce
/// the same shape.
Map<String, String> normaliseDeptRows(List<Map<String, String>> rows) {
  final norm = <String, String>{};
  for (final r in rows) {
    final code = (r['dept'] ?? '').trim();
    if (code.isEmpty) continue;
    final grp = (r['grp'] ?? '').trim();
    final desc = (r['description'] ?? '').trim();
    norm[grp.isEmpty ? code : '$grp|${code.toUpperCase()}'] =
        desc.isEmpty ? code : desc;
  }
  return norm;
}

void backgroundSyncShapeTests() {
  final rows = [
    {'grp': 'HA', 'dept': 'AVT', 'description': 'Aluminium'},
    {'grp': 'S3', 'dept': 'AVT', 'description': 'ATVANTIC IMPORT & EXPORT SB'},
    {'grp': 'HP', 'dept': 'JTC', 'description': 'AppleLady'},
  ];

  group('background sync writes the same shape', () {
    test('a reused code keeps one entry per group', () {
      final n = normaliseDeptRows(rows);
      expect(n['HA|AVT'], 'Aluminium');
      expect(n['S3|AVT'], 'ATVANTIC IMPORT & EXPORT SB');
      expect(n.length, 3, reason: 'no collision between the two AVT rows');
    });

    test('a row with no group still yields a usable bare key', () {
      final n = normaliseDeptRows([
        {'grp': '', 'dept': 'ZZ', 'description': 'Whatever'}
      ]);
      expect(n['ZZ'], 'Whatever');
    });

    test('a key splits back into the pair it was built from', () {
      final key = normaliseDeptRows(rows).keys.firstWhere((k) => k.endsWith('|AVT'));
      final parts = key.split('|');
      expect(parts.length, 2);
      expect(parts[1], 'AVT');
    });

    test('without the group, two departments collapse into one', () {
      // The bug, stated as a test: dropping grp loses S3's meaning entirely.
      final flat = <String, String>{};
      for (final r in rows) {
        flat[r['dept']!] = r['description']!;
      }
      expect(flat['AVT'], 'ATVANTIC IMPORT & EXPORT SB');
      expect(flat.length, 2, reason: 'one AVT survives instead of two');
    });
  });
}

/// Picking a second group must not unpick a department already chosen under
/// the first. Selections survive as long as they are still offered; they are
/// dropped only when the group they belong to is deselected.
List<String>? pruneAgainst(List<String>? current, List<String> allowed) {
  if (current == null || current.isEmpty) return current;
  final set = allowed.toSet();
  final kept = current.where(set.contains).toList();
  return kept.isEmpty ? null : kept;
}

void selectionSurvivalTests() {
  // Departments are group-qualified, so what is offered follows the groups.
  List<String> deptsFor(List<String> groups) => [
        for (final g in groups)
          ...{
            'HP': ['HP|JTC', 'HP|EE'],
            'HA': ['HA|AVT', 'HA|CA'],
            'S3': ['S3|AVT'],
          }[g]!
      ];

  group('selection survival', () {
    test('adding a second group keeps the first group\'s department', () {
      final chosen = ['HP|JTC'];
      final kept = pruneAgainst(chosen, deptsFor(['HP', 'HA']));
      expect(kept, ['HP|JTC']);
    });

    test('removing a group drops only its departments', () {
      final chosen = ['HP|JTC', 'HA|AVT'];
      final kept = pruneAgainst(chosen, deptsFor(['HP']));
      expect(kept, ['HP|JTC']);
    });

    test('removing the last relevant group clears the selection', () {
      final kept = pruneAgainst(['HA|AVT'], deptsFor(['HP']));
      expect(kept, isNull, reason: 'null means "no department filter"');
    });

    test('same code under another group is not mistaken for the same one', () {
      // HA|AVT and S3|AVT are different departments sharing a code.
      final kept = pruneAgainst(['HA|AVT'], deptsFor(['S3']));
      expect(kept, isNull);
    });

    test('nothing selected stays nothing', () {
      expect(pruneAgainst(null, deptsFor(['HP'])), isNull);
    });
  });
}
