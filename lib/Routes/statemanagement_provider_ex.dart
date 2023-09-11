import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ProviderEx());
}

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  void login() {
    _isAuthenticated = true;
    notifyListeners();
  }

  void logout() {
    _isAuthenticated = false;
    notifyListeners();
  }
}

class ProviderEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Auth Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Authentication Status: ${authProvider.isAuthenticated ? 'Logged In' : 'Logged Out'}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            AuthButton(),
          ],
        ),
      ),
    );
  }
}

class AuthButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return ElevatedButton(
      onPressed: () {
        if (authProvider.isAuthenticated) {
          authProvider.logout();
        } else {
          authProvider.login();
        }
      },
      child: Text(authProvider.isAuthenticated ? 'Log Out' : 'Log In'),
    );
  }
}
