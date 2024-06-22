import 'package:flutter/material.dart'; // memanggil library flutter
import 'package:flutter_tugas/regis_login02/register02.dart'; // memanggil file register02.dart
// test
void main() { 
  runApp(const MainApp()); // memanggil class MainApp
}

class MainApp extends StatelessWidget { // membuat class MainApp yang merupakan widget stateless
  const MainApp({super.key}); // konstruktor dari class MainApp

  @override
  Widget build(BuildContext context) { // method build digunakan untuk membuat widget
    return const MaterialApp( 
      home: Register02(), // home digunakan untuk menentukan halaman utama
      // home: Scaffold(
      //   body: Center(
      //     child: Text('Hello World!'),
      //   ),
      // ),
    );
  }
}
