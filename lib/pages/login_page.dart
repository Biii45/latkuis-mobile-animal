import "package:flutter/material.dart";
import "home_page.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TODO: ganti dengan NIM dan nama prodi kamu
  static const String _validUsername = "123456789"; // NIM
  static const String _validPassword = "Sistem Informasi"; // Nama prodi

  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  void dispose() {
    _usernameCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(msg),
        backgroundColor: Colors.red,
      ));
  }

  void _login() {
    final u = _usernameCtrl.text.trim();
    final p = _passwordCtrl.text.trim();

    if (u.isEmpty || p.isEmpty) {
      _showError("Username dan password tidak boleh kosong!");
    } else if (u == _validUsername &&
        p.toLowerCase() == _validPassword.toLowerCase()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    } else {
      _showError("Login gagal! Username atau password salah.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Login",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 24),
                  TextField(
                    controller: _usernameCtrl,
                    decoration: const InputDecoration(
                        labelText: "Username", border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _passwordCtrl,
                    obscureText: true,
                    decoration: const InputDecoration(
                        labelText: "Password", border: OutlineInputBorder()),
                    onSubmitted: (_) => _login(),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.tonal(
                        onPressed: _login, child: const Text("Login")),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
