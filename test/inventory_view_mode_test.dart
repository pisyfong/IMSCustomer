import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ims_customer/services/inventory_view_mode.dart';

/// The view cycle has to return to where it started, and every mode has to
/// yield a usable column count — a zero or negative would make GridView throw
/// rather than render an odd layout.
void main() {
  group('cycling', () {
    test('three taps return to the starting mode', () {
      var m = InventoryViewMode.grid2;
      m = m.next;
      expect(m, InventoryViewMode.grid3);
      m = m.next;
      expect(m, InventoryViewMode.list);
      m = m.next;
      expect(m, InventoryViewMode.grid2);
    });

    test('every mode has a distinct icon and label', () {
      final icons = InventoryViewMode.values.map((m) => m.icon).toSet();
      final labels = InventoryViewMode.values.map((m) => m.label).toSet();
      expect(icons.length, InventoryViewMode.values.length);
      expect(labels.length, InventoryViewMode.values.length);
    });

    test('each icon matches the layout it represents', () {
      // Two per row is the four-square icon, three per row the nine-dot one,
      // and list the three-line one. The button shows the CURRENT layout, so a
      // mismatch here is a mismatch on screen.
      expect(InventoryViewMode.grid2.icon, Icons.grid_view);
      expect(InventoryViewMode.grid3.icon, Icons.apps);
      expect(InventoryViewMode.list.icon, Icons.list);
    });

    test('nextIcon still follows the cycle, for anything that wants it', () {
      expect(InventoryViewMode.grid2.nextIcon, InventoryViewMode.grid3.icon);
      expect(InventoryViewMode.list.nextIcon, InventoryViewMode.grid2.icon);
    });
  });

  group('columns', () {
    const phone = 360.0; // EDA52-class handheld
    const tablet = 800.0;

    test('phone widths give the named densities', () {
      expect(InventoryViewMode.grid2.columns(phone), 2);
      expect(InventoryViewMode.grid3.columns(phone), 3);
      expect(InventoryViewMode.list.columns(phone), 1);
    });

    test('tablets get one extra column so cards do not become enormous', () {
      expect(InventoryViewMode.grid2.columns(tablet), 3);
      expect(InventoryViewMode.grid3.columns(tablet), 4);
    });

    test('list stays single-column at any width', () {
      expect(InventoryViewMode.list.columns(tablet), 1);
    });

    test('no mode ever yields a column count GridView would reject', () {
      for (final m in InventoryViewMode.values) {
        for (final w in [1.0, 320.0, 599.0, 600.0, 1200.0]) {
          expect(m.columns(w), greaterThan(0), reason: '$m at width $w');
        }
      }
    });
  });

  group('isGrid', () {
    test('only list is not a grid', () {
      expect(InventoryViewMode.grid2.isGrid, isTrue);
      expect(InventoryViewMode.grid3.isGrid, isTrue);
      expect(InventoryViewMode.list.isGrid, isFalse);
    });
  });
}
