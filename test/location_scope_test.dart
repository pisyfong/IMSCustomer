import 'package:flutter_test/flutter_test.dart';
import 'package:ims_customer/services/location_service.dart';

// One definition of location scoping, used by the picking/packing hubs, the
// Add-from-SQ sheets and the From-Pick tab. If these disagree, a document
// shows in one list and not another — which is how a pack ends up spanning
// two warehouses.
void main() {
  test('a document at the current location is visible', () {
    expect(LocationService.inScope('STK', 'STK'), isTrue);
  });

  test('a document at another location is hidden', () {
    expect(LocationService.inScope('MME', 'STK'), isFalse);
  });

  test('a document with no location is ALWAYS visible', () {
    // Records created before location scoping carry none. Hiding them would
    // make them invisible and unfixable.
    expect(LocationService.inScope(null, 'STK'), isTrue);
    expect(LocationService.inScope('', 'STK'), isTrue);
    expect(LocationService.inScope('   ', 'STK'), isTrue);
  });

  test('no scope selected shows everything', () {
    expect(LocationService.inScope('STK', null), isTrue);
    expect(LocationService.inScope('MME', ''), isTrue);
  });

  test('padding does not hide a matching document', () {
    // Location_Code is char(3) on the server, so values arrive padded.
    expect(LocationService.inScope(' STK ', 'STK'), isTrue);
  });
}
