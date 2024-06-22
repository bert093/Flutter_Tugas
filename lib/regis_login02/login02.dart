import 'package:flutter/material.dart';
import 'package:flutter_tugas/regis_login02/data_barang02.dart';

class LoginPage02 extends StatefulWidget {
  final String registeredNama02;
  final String registeredEmail02;
  final String registeredPassword02;

  LoginPage02({ //
    required this.registeredEmail02,
    required this.registeredPassword02,
    required this.registeredNama02,
  });

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage02> {
  // final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String nama = widget.registeredNama02;
    String email = _emailController.text;
    String password = _passwordController.text;
    if (email == widget.registeredEmail02 &&
        password == widget.registeredPassword02) {
      // Navigator.pushNamed(context, '/home'); BarangPage();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BarangPage02(),
        ),
      );
      _showDialog('Login Berhasil',
          'Selamat Datang $nama, anda login menggunakan email: $email');
    } else {
      _showDialog('Login Gagal', 'Kesalahan email or password.');
    }
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Username input
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Password input
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            // Login button
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
