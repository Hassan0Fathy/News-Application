import 'package:flutter/material.dart';
import 'package:news_application/pages/login_page.dart';
import 'package:news_application/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _phone.dispose();

    super.dispose();
  }

  Future<void> _signup() async {
    final provider = context.read<AuthProvider>();
    final ok = await provider.register(
      name: _name.text,
      email: _email.text,
      phone: _phone.text,
      password: _password.text,
    );
    if (!mounted) {
      return;
    }
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(provider.message ?? '')));

    if (ok) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (e) => LoginPage()),
      );
    }
  }

  Widget build(BuildContext context) {
    final isLoading = context.watch<AuthProvider>().isLoading;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("SignUp")),
        body: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _name,
                  decoration: InputDecoration(labelText: "Name"),
                ),
                TextField(
                  controller: _email,
                  decoration: InputDecoration(labelText: "Email"),
                ),
                TextField(
                  controller: _phone,
                  decoration: InputDecoration(labelText: "Phone"),
                ),
                TextField(
                  controller: _password,
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Password"),
                ),
                SizedBox(height: 20),
                isLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: _signup,
                        child: Text('Sign Up'),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
