@Skip('Forensic probe for a pulled device database — run explicitly, not in CI')
library;

// Opens a copy of the handheld's Isar file (pulled via adb run-as) and prints
// the rows behind a "why is this blank" report, so the failing layer is
// observed rather than guessed.
//
//   adb exec-out run-as com.example.my_test_app \
//     cat /data/user/0/com.example.my_test_app/app_flutter/default.isar > device.isar
//   flutter test test/device_db_probe_test.dart --run-skipped --dart-define=DB_DIR=<dir>

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';

import 'package:ims_customer/models/customer.dart';
import 'package:ims_customer/models/in_stock_location.dart';
import 'package:ims_customer/models/pick_list.dart';
import 'package:ims_customer/models/pick_list_item.dart';
import 'package:ims_customer/models/quote.dart';

const _dbDir = String.fromEnvironment('DB_DIR');
const _pick = String.fromEnvironment('PICK', defaultValue: 'PI99/PK/2608002');

void main() {
  test('probe the pick, its shelves and its customer', () async {
    await Isar.initializeIsarCore(download: true);
    final isar = await Isar.open(
      [
        QuoteSchema,
        CustomerSchema,
        PickListSchema,
        PickListItemSchema,
        InStockLocationSchema,
      ],
      directory: _dbDir,
      name: 'device',
      maxSizeMiB: 2048,
    );

    // ── the pick ──────────────────────────────────────────────────────────
    final pick =
        await isar.pickLists.filter().pickPreLabelEqualTo(_pick).findFirst();
    if (pick == null) {
      print('PICK $_pick: NOT ON DEVICE');
    } else {
      print('PICK ${pick.pickPreLabel}: cc=${pick.companyCode} '
          'loc="${pick.locationCode}" len=${pick.locationCode?.length} '
          'status=${pick.status} synced=${pick.isSynced}');
    }

    final items = await isar.pickListItems
        .filter()
        .pickPreLabelEqualTo(_pick)
        .findAll();
    print('pick items on device: ${items.length}');
    final skus = items.map((e) => e.skuNo).whereType<int>().toSet().toList();
    print('skus: $skus');
    for (final i in items.take(3)) {
      print('  sku=${i.skuNo} uom="${i.uom}" sq="${i.parentPreLabel}" '
          'loc="${i.locationCode}" remark="${i.remark}"');
    }

    // ── shelves ───────────────────────────────────────────────────────────
    print('\nIn_Stock_Location rows on device: '
        '${await isar.inStockLocations.count()}');
    if (skus.isNotEmpty) {
      final rows = await isar.inStockLocations
          .filter()
          .anyOf(skus, (q, s) => q.skuNoEqualTo(s))
          .findAll();
      print('rows for these skus: ${rows.length}');
      var withShelf = 0;
      for (final r in rows.take(12)) {
        final s = r.shelf;
        if ((s ?? '').trim().isNotEmpty) withShelf++;
        print('  cc=${r.companyCode} sku=${r.skuNo} '
            'locCode="${r.locationCode}" len=${r.locationCode.length} '
            'shelf=${s == null ? "NULL" : "\"$s\""}');
      }
      final all = rows.where((r) => (r.shelf ?? '').trim().isNotEmpty).length;
      print('  (showing 12; $all of ${rows.length} have a shelf value)');
      print('  sample shown with shelf: $withShelf');
    }

    // ── the source quote + customer ───────────────────────────────────────
    final sqs = items
        .map((e) => (e.parentPreLabel ?? '').trim())
        .where((e) => e.isNotEmpty)
        .toSet();
    print('\nsource SQs on the pick: $sqs');
    for (final sq in sqs) {
      final q =
          await isar.quotes.filter().quotePreLabelEqualTo(sq).findFirst();
      if (q == null) {
        print('  QUOTE $sq: NOT ON DEVICE  <-- customer cannot resolve');
      } else {
        print('  QUOTE $sq: customer="${q.customer}" cc=${q.companyCode}');
        final code = (q.customer ?? '').trim();
        if (code.isNotEmpty) {
          final c =
              await isar.customers.filter().codeEqualTo(code).findFirst();
          print('    CUSTOMER $code -> '
              '${c == null ? "NOT ON DEVICE" : "\"${(c.name ?? '').trim()}\""}');
        }
      }
    }

    await isar.close();
  });
}
