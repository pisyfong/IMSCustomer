import 'package:flutter/material.dart';
import 'dart:ui';
import 'services/auth_service.dart';
import 'services/activation_service.dart';
import 'models/user.dart';
import 'widgets/company_picker_sheet.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final double blur;
  final double opacity;
  const GlassCard({
    Key? key,
    required this.child,
    this.borderRadius = 20,
    this.blur = 16,
    this.opacity = 0.35,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(opacity),
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: Colors.white.withOpacity(0.25), width: 1.2),
            boxShadow: [
              BoxShadow(
                color: Colors.redAccent.withOpacity(0.07),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  bool _loading = false;
  String? _error;

  Future<void> _login() async {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();
    
    if (username.isEmpty || password.isEmpty) {
      setState(() {
        _error = 'Please enter both username and password';
      });
      return;
    }
    
    setState(() {
      _loading = true;
      _error = null;
    });
    
    try {
      final authService = AuthService();
      final user = await authService.login(username, password);
      
      if (mounted) {
        // Pop up the company picker (auto-selects if the user only belongs
        // to one company). Fine to await — we push /home either way.
        await CompanyPickerSheet.ensureSelected(context);
        if (mounted) Navigator.of(context).pushReplacementNamed('/home');
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString().replaceAll('Exception: ', '');
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 360),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Logo
                    GestureDetector(
                      onLongPress: () async {
                        try {
                          await ActivationService().resetActivation();
                          if (mounted) {
                            Navigator.of(context).pushReplacementNamed('/activate');
                          }
                        } catch (_) {}
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Image.asset(
                          'assets/images/ims.png',
                          width: 48,
                          height: 48,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'IMS Customer',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Sign in to continue',
                      style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 24),
                    // Username field
                    TextField(
                      controller: _usernameController,
                      style: const TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'Username',
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        prefixIcon: Icon(Icons.person_outline, color: Colors.grey.shade400, size: 20),
                        filled: true,
                        fillColor: Colors.grey.shade50,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.red.shade300, width: 1.5),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Password field
                    TextField(
                      controller: _passwordController,
                      obscureText: _obscureText,
                      style: const TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        prefixIcon: Icon(Icons.lock_outline, color: Colors.grey.shade400, size: 20),
                        suffixIcon: GestureDetector(
                          onTap: () => setState(() => _obscureText = !_obscureText),
                          child: Icon(
                            _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                            color: Colors.grey.shade400,
                            size: 20,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade50,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.red.shade300, width: 1.5),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Error message
                    if (_error != null)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.error_outline, color: Colors.red.shade600, size: 16),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                _error!,
                                style: TextStyle(color: Colors.red.shade700, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    // Login button
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: _loading ? null : _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade600,
                          foregroundColor: Colors.white,
                          disabledBackgroundColor: Colors.grey.shade300,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          elevation: 0,
                        ),
                        child: _loading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                              )
                            : const Text('Sign In', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
