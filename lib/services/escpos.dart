/// Minimal ESC/POS command builder for 58mm / 80mm thermal printers
/// (Zywell and every other ESC/POS clone).
///
/// Hand-rolled rather than pulled from a package: the command set we need is
/// small, and owning it means we control the code page, the column maths and
/// the byte order exactly — which is what actually differs between printers.
///
/// Everything is laid out in **monospace character columns** (Font A: 32 cols
/// at 58mm, 48 at 80mm), so the receipt looks identical on both paper widths.
library;

class EscPos {
  /// Characters per line at Font A for the configured paper width.
  final int cols;

  final List<int> _out = <int>[];
  final List<String> _text = <String>[];
  final List<bool> _textBold = <bool>[];

  EscPos({required this.cols});

  List<int> get bytes => List<int>.unmodifiable(_out);

  /// A plain-text transcript of everything written, one entry per printed line.
  ///
  /// Captured as a by-product of building the bytes rather than re-rendered,
  /// so the on-screen preview and the paper can never disagree.
  List<String> get textLines => List<String>.unmodifiable(_text);

  /// Emphasis flag per entry of [textLines]. Bold is an ESC command, not a
  /// character, so without this the preview would render a bold line as plain
  /// and misrepresent the paper.
  List<bool> get textBold => List<bool>.unmodifiable(_textBold);

  // ─── Raw command primitives ──────────────────────────────────────────────
  static const int _esc = 0x1B;
  static const int _gs = 0x1D;
  static const int _lf = 0x0A;

  void raw(List<int> b) => _out.addAll(b);

  /// ESC @ — reset the printer to its power-on defaults. Always send this
  /// first: a previous job may have left bold/double-height latched on.
  void reset() {
    _align = 0; // ESC @ clears alignment along with everything else
    _bold = false;
    raw([_esc, 0x40]);
    // ESC t 0 — code page 437 (US/European). We transliterate to ASCII before
    // writing anyway, so this only guards against a printer that boots into a
    // CJK page and renders our text as garbage.
    raw([_esc, 0x74, 0x00]);
  }

  /// ESC a n — 0 left, 1 centre, 2 right.
  ///
  /// The printer applies this itself, so the bytes carry no padding. The
  /// transcript has no printer to obey it, so it mirrors the effect with real
  /// spaces — otherwise the preview would show a left-aligned masthead that
  /// comes out centred on paper.
  void align(int n) {
    _align = n;
    raw([_esc, 0x61, n]);
  }

  int _align = 0;

  /// ESC E n — emphasised (bold).
  void bold(bool on) {
    _bold = on;
    raw([_esc, 0x45, on ? 1 : 0]);
  }

  bool _bold = false;

  /// ESC - n — underline off / 1-dot / 2-dot.
  void underline(int n) => raw([_esc, 0x2D, n]);

  /// GS ! n — character magnification, 1..8 in each axis.
  void size({int w = 1, int h = 1}) {
    final cw = (w.clamp(1, 8) - 1) << 4;
    final ch = h.clamp(1, 8) - 1;
    raw([_gs, 0x21, cw | ch]);
  }

  void feed([int lines = 1]) {
    for (var i = 0; i < lines; i++) {
      _out.add(_lf);
      _text.add('');
      _textBold.add(false);
    }
  }

  /// GS V 66 n — partial cut after feeding n dot-lines. Printers without a
  /// cutter ignore it.
  void cut() => raw([_gs, 0x56, 0x42, 0x00]);

  // ─── Text ────────────────────────────────────────────────────────────────

  /// Writes one line of text verbatim (already sized to fit).
  void line([String text = '']) {
    _out.addAll(_encode(text));
    _out.add(_lf);
    _emit(_ascii(text));
  }

  /// Appends to the preview transcript, reproducing the alignment the printer
  /// would apply. Double-width text is centred as-is rather than at its true
  /// half-scale column position: the preview can't render double-width glyphs,
  /// and "centred" is the property worth preserving.
  void _emit(String s) {
    _textBold.add(_bold);
    if (s.isEmpty || _align == 0 || s.length >= cols) {
      _text.add(s);
      return;
    }
    final slack = cols - s.length;
    _text.add(' ' * (_align == 2 ? slack : slack ~/ 2) + s);
  }

  /// Writes [text] wrapped at the paper width, breaking on word boundaries and
  /// hard-splitting any single word longer than the line.
  ///
  /// [indent] prefixes every continuation line, so a wrapped description stays
  /// visually attached to its item number.
  void wrapped(String text, {String indent = ''}) {
    for (final l in wrap(text, cols, indent: indent)) {
      line(l);
    }
  }

  /// A full-width rule, e.g. `----` or `====`.
  void rule([String ch = '-']) => line(ch * cols);

  /// Centred text (uses our own padding rather than ESC a so it composes with
  /// left-aligned rows in the same block).
  void centre(String text) {
    // The padding is baked into the string, so suppress the transcript's own
    // alignment for these lines — otherwise a centre() inside an align(1)
    // block would be indented twice on screen but not on paper.
    final saved = _align;
    _align = 0;
    for (final l in wrap(text, cols)) {
      final pad = ((cols - l.length) / 2).floor();
      line(' ' * (pad < 0 ? 0 : pad) + l);
    }
    _align = saved;
  }

  /// `Left ................ Right` — [right] is flush to the paper edge and
  /// wins the space fight; [left] is truncated if the pair won't fit.
  void row2(String left, String right, {String fill = ' '}) {
    final r = _ascii(right);
    var l = _ascii(left);
    final room = cols - r.length - 1;
    if (room <= 0) {
      line(r.length > cols ? r.substring(0, cols) : r);
      return;
    }
    if (l.length > room) l = l.substring(0, room);
    line(l + fill * (cols - l.length - r.length) + r);
  }

  /// `Label : value`, colons aligned in a column. A long value wraps and hangs
  /// under the value column rather than under the label.
  void field(String label, String value, {int labelWidth = 9}) {
    final head = '${_ascii(label).padRight(labelWidth)}: ';
    final parts = wrap(value, cols - head.length);
    for (var i = 0; i < parts.length; i++) {
      line((i == 0 ? head : ' ' * head.length) + parts[i]);
    }
  }

  // ─── Barcode ─────────────────────────────────────────────────────────────

  /// CODE128 (subset B) barcode with the human-readable text underneath.
  ///
  /// Silently does nothing for data the symbology can't carry, so a stray
  /// character in a document number can never abort the whole receipt.
  void barcode128(String data, {int height = 60, int width = 2}) {
    final payload = _ascii(data);
    if (payload.isEmpty) return;
    for (final c in payload.codeUnits) {
      if (c < 32 || c > 126) return; // not representable in subset B
    }
    raw([_gs, 0x68, height.clamp(1, 255)]); // GS h — height in dots
    raw([_gs, 0x77, width.clamp(2, 6)]); // GS w — module width
    raw([_gs, 0x48, 0x02]); // GS H — HRI below the barcode
    raw([_gs, 0x66, 0x00]); // GS f — HRI font A

    // GS k m n d1..dn, m=73 (CODE128). Data must start with a code-set
    // selector; '{B' is the ASCII-safe subset.
    final d = <int>[0x7B, 0x42, ...payload.codeUnits];
    raw([_gs, 0x6B, 73, d.length, ...d]);

    // The preview can't draw bars, so stand in with the printed HRI text.
    // Alignment comes from _emit, same as any other line.
    _emit('[|||  $payload  |||]');
  }

  // ─── Helpers ─────────────────────────────────────────────────────────────

  /// Word-wraps [text] to [width] columns.
  static List<String> wrap(String text, int width, {String indent = ''}) {
    final t = _ascii(text);
    if (width <= 0) return [t];
    if (t.isEmpty) return [''];

    final out = <String>[];
    var first = true;
    for (final para in t.split('\n')) {
      var rest = para.trimRight();
      if (rest.isEmpty) {
        out.add('');
        continue;
      }
      while (rest.isNotEmpty) {
        final prefix = first ? '' : indent;
        final room = width - prefix.length;
        if (room <= 0) {
          out.add(prefix + rest);
          break;
        }
        if (rest.length <= room) {
          out.add(prefix + rest);
          break;
        }
        // Break on the last space that fits; hard-split an over-long word.
        var cut = rest.lastIndexOf(' ', room);
        if (cut <= 0) {
          cut = room;
        } else if (cut < room ~/ 2) {
          // The break leaves most of the line empty. That's only worth it if
          // what follows actually fits on the next line — for a run-on product
          // code it doesn't, so it gets hard-split either way. Split it here
          // instead of burning a near-blank line first.
          final next = rest.substring(cut).trimLeft();
          final sp = next.indexOf(' ');
          if ((sp < 0 ? next.length : sp) > room) cut = room;
        }
        out.add(prefix + rest.substring(0, cut).trimRight());
        rest = rest.substring(cut).trimLeft();
        first = false;
      }
      first = false;
    }
    return out;
  }

  /// Folds text down to printable ASCII.
  ///
  /// Thermal printers render anything outside their active code page as
  /// mojibake, and product descriptions routinely carry smart quotes, en
  /// dashes and the odd accented character pasted in from a spec sheet.
  /// Mapping them to their ASCII equivalents is far better than printing
  /// noise the picker can't read.
  static String _ascii(String s) {
    const map = {
      '‘': "'", '’': "'", '‚': "'", '‛': "'",
      '“': '"', '”': '"', '„': '"',
      '–': '-', '—': '-', '−': '-', ' ': ' ',
      '…': '...', '·': '.', '•': '*', '×': 'x',
      'é': 'e', 'è': 'e', 'ê': 'e', 'á': 'a',
      'à': 'a', 'â': 'a', 'ñ': 'n', 'ó': 'o',
      'ô': 'o', 'ú': 'u', 'ü': 'u', 'ç': 'c',
      '°': 'deg', '€': 'EUR', '£': 'GBP', '®': '(R)',
      '™': '(TM)', '©': '(C)',
    };
    final b = StringBuffer();
    for (final r in s.runes) {
      final ch = String.fromCharCode(r);
      if (map.containsKey(ch)) {
        b.write(map[ch]);
      } else if (r == 0x0A) {
        b.write('\n');
      } else if (r >= 0x20 && r <= 0x7E) {
        b.write(ch);
      } else {
        b.write(' '); // unknown glyph -> space, never a random byte
      }
    }
    return b.toString();
  }

  static List<int> _encode(String s) => _ascii(s).codeUnits;
}
