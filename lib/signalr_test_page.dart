import 'package:flutter/material.dart';
import 'services/signalr_service.dart';
import 'main.dart'; // For global signalRService

class SignalRTestPage extends StatefulWidget {
  const SignalRTestPage({Key? key}) : super(key: key);

  @override
  State<SignalRTestPage> createState() => _SignalRTestPageState();
}

class _SignalRTestPageState extends State<SignalRTestPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();
  String _connectionStatus = 'Unknown';
  String _testResults = '';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _checkConnectionStatus();
    
    // Listen to connection state changes
    signalRService.connectionState.listen((connected) {
      if (mounted) {
        setState(() {
          _connectionStatus = connected ? 'Connected' : 'Disconnected';
        });
      }
    });
  }

  void _checkConnectionStatus() {
    setState(() {
      _connectionStatus = signalRService.isConnected ? 'Connected' : 'Disconnected';
    });
  }

  Future<void> _testConnection() async {
    setState(() {
      _isLoading = true;
      _testResults = 'Testing connection...';
    });

    try {
      await signalRService.connect();
      setState(() {
        _connectionStatus = signalRService.isConnected ? 'Connected' : 'Disconnected';
        _testResults = 'Connection test completed. Status: $_connectionStatus';
      });
    } catch (e) {
      setState(() {
        _testResults = 'Connection test failed: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _testLogin() async {
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      setState(() {
        _testResults = 'Please enter username and password';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _testResults = 'Testing login...';
    });

    try {
      final result = await signalRService.login(
        _usernameController.text,
        _passwordController.text,
      );
      
      setState(() {
        _testResults = 'Login result: ${result.toString()}';
      });
    } catch (e) {
      setState(() {
        _testResults = 'Login test failed: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _testGetCompany() async {
    if (_userIdController.text.isEmpty) {
      setState(() {
        _testResults = 'Please enter user ID';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _testResults = 'Testing getCompany...';
    });

    try {
      final userId = int.parse(_userIdController.text);
      final result = await signalRService.getCompany(userId);
      
      setState(() {
        _testResults = 'GetCompany result: ${result.toString()}';
      });
    } catch (e) {
      setState(() {
        _testResults = 'GetCompany test failed: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _testGetCustomers() async {
    setState(() {
      _isLoading = true;
      _testResults = 'Testing getCustomers...';
    });

    try {
      final result = await signalRService.getCustomers(page: 1, limit: 5);
      
      setState(() {
        _testResults = 'GetCustomers result: ${result.toString()}';
      });
    } catch (e) {
      setState(() {
        _testResults = 'GetCustomers test failed: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignalR Test'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Connection Status
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Connection Status: $_connectionStatus',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: _connectionStatus == 'Connected' ? Colors.green : Colors.red,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _isLoading ? null : _testConnection,
                      child: const Text('Test Connection'),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Login Test
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text('Login Test', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _isLoading ? null : _testLogin,
                      child: const Text('Test Login'),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Company Test
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text('Company Test', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _userIdController,
                      decoration: const InputDecoration(
                        labelText: 'User ID (e.g., 1001)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _isLoading ? null : _testGetCompany,
                      child: const Text('Test GetCompany'),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Customer Test
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text('Customer Test', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _isLoading ? null : _testGetCustomers,
                      child: const Text('Test GetCustomers'),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Results
            Expanded(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Test Results:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            _testResults.isEmpty ? 'No tests run yet' : _testResults,
                            style: const TextStyle(fontFamily: 'monospace'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            if (_isLoading)
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(child: CircularProgressIndicator()),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _userIdController.dispose();
    super.dispose();
  }
}
