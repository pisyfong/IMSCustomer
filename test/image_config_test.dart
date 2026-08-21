import 'package:flutter_test/flutter_test.dart';
import 'package:ims_customer/config/app_config.dart';
import 'package:ims_customer/config/company_image_config.dart';

// hasImageConfig() gates image loading in four places (sync preload, image
// widget, settings, service). It once checked an override map that is empty by
// default, which silently disabled photos app-wide — and "no photos" produces
// no error, so nothing else would have caught it.
void main() {
  test('image support follows whether a base URL is configured', () {
    if (AppConfig.hasImages) {
      expect(CompanyImageConfig.hasImageConfig(1), isTrue);
      expect(CompanyImageConfig.hasImageConfig(99), isTrue,
          reason: 'the base URL applies to every company, not just company 1');
    } else {
      // A site with no image server: every lookup must decline cleanly rather
      // than hand out a URL that cannot resolve.
      expect(CompanyImageConfig.hasImageConfig(1), isFalse);
      expect(CompanyImageConfig.constructImageUrl(1, 3442, 'PCS'), isNull);
    }
  });

  test('URL is {base}/{sku padded to 6}_{uom}.jpg when images are on', () {
    if (!AppConfig.hasImages) return;
    expect(
      CompanyImageConfig.constructImageUrl(1, 3442, 'PCS'),
      '${AppConfig.getImageBaseUrl()}/003442_PCS.jpg',
    );
  });

  test('no UOM means no URL', () {
    expect(CompanyImageConfig.constructImageUrl(1, 3442, null), isNull);
    expect(CompanyImageConfig.constructImageUrl(1, 3442, ''), isNull);
  });
}
