import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'activation_page.dart';
import 'services/activation_service.dart';
import 'services/license_service.dart';
import 'theme/app_design.dart';

/// Shown instead of the app when the licence Worker (or the cached record)
/// refuses this device — revoked, expired, under maintenance, or needing an
/// upgrade.
///
/// Deliberately a dead end rather than a dismissible warning: these are the
/// licensor's decisions, and the only ways out are to fix the licence, update
/// the app, reconnect, or enter a different AppKey.
class LicenseBlockedPage extends StatefulWidget {
  final LicenseResult result;
  const LicenseBlockedPage({super.key, required this.result});

  @override
  State<LicenseBlockedPage> createState() => _LicenseBlockedPageState();
}

class _LicenseBlockedPageState extends State<LicenseBlockedPage> {
  bool _retrying = false;

  LicenseState get _state => widget.result.state;
  License? get _lic => widget.result.license;

  IconData get _icon => switch (_state) {
        LicenseState.revoked => Icons.gpp_bad_outlined,
        LicenseState.expired => Icons.event_busy_outlined,
        LicenseState.maintenance => Icons.construction_outlined,
        LicenseState.upgradeRequired => Icons.system_update_alt,
        LicenseState.offlineExpired => Icons.cloud_off_outlined,
        LicenseState.wrongApp => Icons.apps_outlined,
        LicenseState.deviceMismatch => Icons.devices_other_outlined,
        _ => Icons.error_outline,
      };

  Color get _color => switch (_state) {
        LicenseState.maintenance ||
        LicenseState.offlineExpired =>
          AppDesign.warning,
        LicenseState.upgradeRequired => AppDesign.info,
        _ => AppDesign.danger,
      };

  String get _title => switch (_state) {
        LicenseState.revoked => 'Licence revoked',
        LicenseState.expired => 'Licence expired',
        LicenseState.maintenance => 'Under maintenance',
        LicenseState.upgradeRequired => 'Update required',
        LicenseState.offlineExpired => 'Licence needs verifying',
        LicenseState.wrongApp => 'Wrong AppKey',
        LicenseState.deviceMismatch => 'Licence in use elsewhere',
        LicenseState.unknown => 'AppKey not recognised',
        _ => 'Licence problem',
      };

  /// Re-checks with the Worker. The common case here is a transient outage or
  /// a licence the administrator has just fixed.
  Future<void> _retry() async {
    setState(() => _retrying = true);
    final res = await ActivationService().checkLicense();
    if (!mounted) return;
    setState(() => _retrying = false);
    if (res.state.allowsUse) {
      // Cleanest way back into a correctly-initialised app.
      Navigator.of(context).pushNamedAndRemoveUntil('/', (_) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: AppDesign.danger,
        behavior: SnackBarBehavior.floating,
        content: Text(res.state.message),
      ));
    }
  }

  Future<void> _openStore() async {
    final url = _lic?.appStoreUrl ?? '';
    if (url.isEmpty) return;
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  Future<void> _enterNewKey() async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const ActivationPage()),
    );
    if (mounted) _retry();
  }

  @override
  Widget build(BuildContext context) {
    final lic = _lic;
    return Scaffold(
      backgroundColor: AppDesign.bg,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: _color.withOpacity(0.10),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(_icon, size: 40, color: _color),
                ),
                const SizedBox(height: 18),
                Text(_title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: _color)),
                const SizedBox(height: 8),
                Text(_state.message,
                    textAlign: TextAlign.center, style: AppDesign.bodyMuted),
                if (lic != null && lic.companyName.isNotEmpty) ...[
                  const SizedBox(height: 18),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: AppDesign.card(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _row('Company', lic.companyName),
                        if (lic.expiryDate.isNotEmpty)
                          _row('Expires', lic.expiryDate),
                        _row('AppKey', _mask(lic.appKey)),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 22),
                if (_state == LicenseState.upgradeRequired &&
                    (lic?.appStoreUrl ?? '').isNotEmpty)
                  _button('Update now', Icons.download, _openStore, _color),
                if (_state == LicenseState.upgradeRequired &&
                    (lic?.appStoreUrl ?? '').isNotEmpty)
                  const SizedBox(height: 8),
                _button(
                  _retrying ? 'Checking…' : 'Check again',
                  Icons.refresh,
                  _retrying ? null : _retry,
                  _color,
                  outlined: _state == LicenseState.upgradeRequired,
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: _retrying ? null : _enterNewKey,
                  child: const Text('Enter a different AppKey',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppDesign.inkMuted)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Show enough of the key to identify it when reading it out over the phone,
  /// without printing the whole credential on a screen.
  String _mask(String k) =>
      k.length <= 8 ? k : '${k.substring(0, 8)}…${k.substring(k.length - 4)}';

  Widget _row(String label, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(children: [
          SizedBox(width: 74, child: Text(label, style: AppDesign.caption)),
          Expanded(
            child: Text(value,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppDesign.ink)),
          ),
        ]),
      );

  Widget _button(String label, IconData icon, VoidCallback? onTap, Color color,
      {bool outlined = false}) {
    final child = outlined
        ? OutlinedButton.icon(
            onPressed: onTap,
            icon: Icon(icon, size: 17),
            label: Text(label,
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
            style: OutlinedButton.styleFrom(
              foregroundColor: color,
              side: BorderSide(color: color),
              minimumSize: const Size(0, 46),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDesign.radiusSm)),
            ),
          )
        : ElevatedButton.icon(
            onPressed: onTap,
            icon: Icon(icon, size: 17),
            label: Text(label,
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              foregroundColor: Colors.white,
              elevation: 0,
              minimumSize: const Size(0, 46),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDesign.radiusSm)),
            ),
          );
    return SizedBox(width: double.infinity, child: child);
  }
}
