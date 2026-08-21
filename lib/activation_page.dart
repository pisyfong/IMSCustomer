import 'package:flutter/material.dart';
import 'pages/barcode_scanner_page.dart';
import 'services/activation_service.dart';

class ActivationPage extends StatefulWidget {
  const ActivationPage({super.key});

  @override
  State<ActivationPage> createState() => _ActivationPageState();
}

class _ActivationPageState extends State<ActivationPage> {
  final _formKey = GlobalKey<FormState>();
  final _keyController = TextEditingController();
  bool _submitting = false;
  String? _error;

  final ActivationService _activationService = ActivationService();

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _submitting = true;
      _error = null;
    });
    try {
      await _activationService.validateAndConsumeKey(_keyController.text);
      if (!mounted) return;
      // Success -> go to login flow
      Navigator.of(context).pushReplacementNamed('/login');
    } catch (e) {
      setState(() {
        // Show the licensor's actual reason — "revoked", "expired", "no
        // document prefix set" each need a different response from the
        // operator, and a generic message sends them all to the same dead end.
        _error = e.toString().replaceFirst('Exception: ', '');
      });
    } finally {
      if (mounted) {
        setState(() {
          _submitting = false;
        });
      }
    }
  }

  /// Scans an AppKey instead of typing 20 characters on a rugged keypad.
  ///
  /// Reuses the app's existing scanner (QR is already in its format list) so
  /// there's one scanning code path, not two.
  Future<void> _scan() async {
    final code = await Navigator.of(context).push<String>(
      MaterialPageRoute(builder: (_) => const BarcodeScannerPage()),
    );
    if (code == null || !mounted) return;

    final key = _extractKey(code);
    if (key == null) {
      setState(() => _error =
          'That code does not look like an AppKey. Expected something like '
          'IMS-XXXX-XXXX-XXXX-XXXX.');
      return;
    }
    setState(() {
      _keyController.text = key;
      _error = null;
    });
    // Scanning is a deliberate act — don't make them press Activate as well.
    await _submit();
  }

  /// Pulls the key out of whatever the QR actually encodes.
  ///
  /// Codes in the wild carry the bare key, a URL with it in the path or query,
  /// or a JSON blob — so match the key shape rather than trusting the payload
  /// to be exactly one thing.
  static String? _extractKey(String raw) {
    final text = raw.trim().toUpperCase();
    final m = RegExp(r'[A-Z0-9]{3,6}(?:-[A-Z0-9]{4}){3,}').firstMatch(text);
    if (m != null) return m.group(0);
    // Fall back to the whole payload when it's plausibly a key with no
    // separators — the server is the real validator either way. Requiring a
    // digit keeps plain words out: "hello world" would otherwise squash to
    // HELLOWORLD and be sent as a key.
    final bare = text.replaceAll(RegExp(r'\s+'), '');
    final keyish = bare.length >= 8 &&
        RegExp(r'^[A-Z0-9-]+$').hasMatch(bare) &&
        RegExp(r'[0-9]').hasMatch(bare);
    return keyish ? bare : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Activation')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Enter AppKey',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                if (_error != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(_error!, style: const TextStyle(color: Colors.red)),
                  ),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _keyController,
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                      labelText: 'AppKey',
                      hintText: 'IMS-XXXX-XXXX-XXXX-XXXX',
                      suffixIcon: IconButton(
                        tooltip: 'Scan QR code',
                        icon: const Icon(Icons.qr_code_scanner),
                        onPressed: _submitting ? null : _scan,
                      ),
                    ),
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) => _submit(),
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) {
                        return 'Please enter your validation key';
                      }
                      if (v.trim().length < 8) {
                        return 'Key format looks too short';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitting ? null : _submit,
                    child: _submitting
                        ? const SizedBox(height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                        : const Text('Activate'),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: _submitting ? null : _scan,
                    icon: const Icon(Icons.qr_code_scanner, size: 18),
                    label: const Text('Scan QR code'),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Activation is required once on this device. The AppKey is '
                  'checked with the licence server, so this device needs an '
                  'internet connection for this step.',
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
