import 'package:flutter_test/flutter_test.dart';
import 'package:ims_customer/config/app_config.dart';
import 'package:ims_customer/config/company_image_config.dart';

// Pins the values this build ships with.
//
// A wrong host or a missing API key produces no compiler error and no crash —
// the app just fails to sync once it's in someone's hands. Update this test
// deliberately when retargeting to another customer; that's the point.
//
// Retargeted 2026-08-12 to MDS Medan. Verified against the live server, not
// assumed:
//   * http://mdsmedan.getmyip.com:1194 — 401 without the API key, and the
//     new endpoints (/api/uoms, /api/invoice-batches) answer 200, so that
//     server already runs this release's backend.
//   * The HOST here carries no scheme and no port. `baseUrl` composes
//     '$_protocol://$domain:$port', so a 'http://' in the domain yields
//     'http://http://…:1194' — which is exactly how this build arrived.
//   * Images: port 88 serves, but /ItemMasterImages/ and a real
//     000001_PKT.jpg both return 404. The URL is kept as configured and
//     flagged rather than silently blanked — see the note to the operator.
void main() {
  const host = 'mdsmedan.getmyip.com'; // MDS Medan
  const port = 1194;

  test('points at the customer server, not dev or ours', () {
    expect(AppConfig.environment, 'Production');
    expect(AppConfig.baseUrl, 'http://$host:$port');
    expect(AppConfig.apiBaseUrl, 'http://$host:$port');
    expect(AppConfig.getSignalRHubUrl(), 'http://$host:$port/synchub');

    // Guard against the hosts that must never ship to a customer: our dev
    // LAN, and any OTHER customer's server. Shipping YeonTak's handhelds
    // pointed at another site would be a data breach, not just an outage.
    expect(AppConfig.baseUrl, isNot(contains('192.168.')));
    expect(AppConfig.baseUrl, isNot(contains('fungseng')));
    expect(AppConfig.baseUrl, isNot(contains('mdssarawak')));
    expect(AppConfig.baseUrl, isNot(contains('yeontak')));
    // A scheme in the domain composes to 'http://http://…' and reaches
    // nothing. Cheap to type, invisible until a device is in someone's hand.
    expect(AppConfig.domain, isNot(contains('://')));
    expect(AppConfig.baseUrl, startsWith('http://'));
    expect('://'.allMatches(AppConfig.baseUrl).length, 1);
    expect(AppConfig.baseUrl, isNot(contains('CHANGE-ME')));
  });

  test('sends the API key the server now requires', () {
    // The server returns 401 without this; every upload would fail.
    expect(AppConfig.apiKey, isNotEmpty);
    expect(AppConfig.apiHeaders['X-API-Key'], AppConfig.apiKey);
  });

  test('photos are on — this site has an image server', () {
    expect(AppConfig.hasImages, isTrue);
    expect(AppConfig.getImageBaseUrl(), contains(host));
    // Same host as the API, different port: images come from a separate web
    // server, not from the Node backend.
    expect(AppConfig.getImageBaseUrl(), isNot(contains(':$port')));
  });

  test('phase-2 features stay off in a customer build', () {
    // Adding items that are on no source document, and the loose split that
    // rides with it. Shipping these half-finished would let a picker create
    // lines the SI conversion cannot price.
    expect(AppConfig.enableLooseItems, isFalse);
  });
}
