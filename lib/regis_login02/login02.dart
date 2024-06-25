import 'package:flutter/material.dart'; // memanggil library flutter
import 'package:flutter_tugas/regis_login02/data_barang02.dart'; // memanggil file data_barang02.dart

class LoginPage02 extends StatefulWidget { // membuat class LoginPage02 yang merupakan widget stateful
  final String registeredNama02; // mendeklarasikan variabel registeredNama02 dengan tipe data String
  final String registeredEmail02; // mendeklarasikan variabel registeredEmail02 dengan tipe data String
  final String registeredPassword02; // mendeklarasikan variabel registeredPassword02 dengan tipe data String

  LoginPage02({ // konstruktor dari class LoginPage02
    required this.registeredEmail02, // parameter required untuk registeredEmail02
    required this.registeredPassword02, // parameter required untuk registeredPassword02
    required this.registeredNama02, // parameter required untuk registeredNama02
  });

  @override
  _LoginPageState createState() => _LoginPageState(); // method untuk membuat state dari LoginPage02
}

class _LoginPageState extends State<LoginPage02> { // membuat class _LoginPageState yang merupakan state dari LoginPage02
  // final TextEditingController _namaController = TextEditingController(); // mendeklarasikan controller untuk nama (komentar)
  final TextEditingController _emailController = TextEditingController(); // mendeklarasikan controller untuk email
  final TextEditingController _passwordController = TextEditingController(); // mendeklarasikan controller untuk password

  void _login() { // method untuk login
    String nama = widget.registeredNama02; // mengambil nilai registeredNama02 dari widget
    String email = _emailController.text; // mengambil nilai email dari controller
    String password = _passwordController.text; // mengambil nilai password dari controller
    if (email == widget.registeredEmail02 && // pengecekan email
        password == widget.registeredPassword02) { // pengecekan password
      // Navigator.pushNamed(context, '/home'); BarangPage(); // komentar
      Navigator.push( // navigasi ke halaman BarangPage02
        context,
        MaterialPageRoute(
          builder: (context) => const BarangPage02(), // builder untuk BarangPage02
        ),
      );
      _showDialog('Login Berhasil', // menampilkan dialog login berhasil
          'Selamat Datang $nama, anda login menggunakan email: $email'); // pesan dialog
    } else {
      _showDialog('Login Gagal', 'Kesalahan email or password.'); // menampilkan dialog login gagal
    }
  }

  void _showDialog(String title, String message) { // method untuk menampilkan dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog( // membuat dialog
          title: Text(title), // judul dialog
          content: Text(message), // isi dialog
          actions: <Widget>[
            TextButton(
              child: const Text('OK'), // tombol OK
              onPressed: () {
                Navigator.of(context).pop(); // menutup dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) { // method build untuk membuat widget
    return Scaffold( // membuat scaffold
      appBar: AppBar( // membuat app bar
        title: const Text('Login Page'), // judul app bar
      ),
      body: Padding( // padding untuk body
        padding: const EdgeInsets.all(16.0), // padding 16.0
        child: Column( // membuat column
          mainAxisAlignment: MainAxisAlignment.center, // posisi tengah
          children: [
            // Username input
            TextField( // membuat text field untuk email
              controller: _emailController, // controller untuk email
              decoration: const InputDecoration( // dekorasi input
                labelText: 'Email', // label email
                border: OutlineInputBorder(), // border outline
              ),
            ),
            const SizedBox(height: 20), // jarak 20
            // Password input
            TextField( // membuat text field untuk password
              controller: _passwordController, // controller untuk password
              decoration: const InputDecoration( // dekorasi input
                labelText: 'Password', // label password
                border: OutlineInputBorder(), // border outline
              ),
              obscureText: true, // teks tersembunyi
            ),
            const SizedBox(height: 20), // jarak 20
            // Login button
            ElevatedButton( // membuat tombol login
              onPressed: _login, // aksi tombol login
              child: const Text('Login'), // teks tombol login
            ),
          ],
        ),
      ),
    );
  }
}
