import 'package:flutter/material.dart';
import 'package:news_application/pages/news_page.dart';
import 'package:news_application/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    final provider = await context.read<AuthProvider>();

    final ok = await provider.login(
      email: _email.text,
      password: _password.text,
    );
    if (!mounted) {
      return;
    }
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(provider.message ?? "")));
    if (ok) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (e) => NewsPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<AuthProvider>().isLoading;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Login")),
        body: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _email,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: _password,
                  decoration: InputDecoration(labelText: 'Password'),
                ),
                SizedBox(height: 18),
                isLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton(onPressed: _login, child: Text("Login")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
