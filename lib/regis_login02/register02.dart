import 'package:flutter/material.dart';
import 'package:flutter_tugas/regis_login02/login02.dart';

class Register02 extends StatefulWidget {
  const Register02({super.key});

  @override
  _UserProfileFormState createState() => _UserProfileFormState();
}

class _UserProfileFormState extends State<Register02> {
  // Controllers for text fields
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _tlpnController = TextEditingController();
  final TextEditingController _pswdController = TextEditingController();

  // Variables for other inputs
  bool _setuju = false;
  String _jenisKelamin = '';
  String _pilihKota = '<pilih>';

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    _namaController.dispose();
    _emailController.dispose();
    _tlpnController.dispose();
    _pswdController.dispose();
    super.dispose();
  }

  void _register() {
    String nama = _namaController.text;
    String email = _emailController.text;
    String password = _pswdController.text;

    if (email == '' || password == '' || _setuju == false) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Kesalahan !!'),
            content:
                Text('email, password atau persetujuan tidak boleh kosong'),
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
    } else {
      // Navigator.pushNamed dengan arguments untuk mengirim data ke halaman login
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage02(
            registeredNama02: nama,
            registeredEmail02: email,
            registeredPassword02: password,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Pendaftaran'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Nama input
            TextField(
              controller: _namaController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            // Email input
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _pswdController,
              decoration: InputDecoration(labelText: 'Password'),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
            ),
            // Telepon input
            TextField(
              controller: _tlpnController,
              decoration: InputDecoration(labelText: 'Telepon'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            // Jenis Kelamin selection
            Text('Jenis Kelamin',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ListTile(
              title: const Text('Pria'),
              leading: Radio<String>(
                value: 'Pria',
                groupValue: _jenisKelamin,
                onChanged: (String? value) {
                  setState(() {
                    _jenisKelamin = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Wanita'),
              leading: Radio<String>(
                value: 'Wanita',
                groupValue: _jenisKelamin,
                onChanged: (String? value) {
                  setState(() {
                    _jenisKelamin = value!;
                  });
                },
              ),
            ),
            //Radio button Jenis Kelamin jangan ditambah lagi Pesan: MdYd.
            const SizedBox(height: 20),
            // Kota Terdekat selection
            const Text('Kota Terdekat',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: _pilihKota,
              onChanged: (String? newValue) {
                setState(() {
                  _pilihKota = newValue!;
                });
              },
              items: <String>[
                '<pilih>',
                'Mataram',
                'Peraya',
                'Selong',
                'Tanjung',
                'Sumbawa',
                'Dompu',
                'Bima',
                'Diluar NTB'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            // Subscription checkbox
            CheckboxListTile(
              title: const Text('Saya setuju dengan peraturan yang berlaku'),
              value: _setuju,
              onChanged: (bool? value) {
                setState(() {
                  _setuju = value!;
                });
              },
            ),
            SizedBox(height: 20),
            // Submit button
            ElevatedButton(
              onPressed: () {
                _register();
                // Handle form submission
                String nama = _namaController.text;
                String email = _emailController.text;
                // String password = _pswdController.text;
                String tlpn = _tlpnController.text;
                String jenisKel = _jenisKelamin;
                String kota = _pilihKota;
                bool setuju = _setuju;

                // tambahakan method untuk pindah ke form login 02
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => LoginPage02(
                //       registeredEmail02: email,
                //       registeredPassword02: password,
                //     ),
                //   ),
                // );
                // data yang dimasukan, akan dicetak pada terminal untuk pengecekan
                print('Nama: $nama');
                print('Email: $email');
                print('Telepon: $tlpn');
                print('Jenis Kelamin: $jenisKel');
                print('Kota Terdekat: $kota');
                print('Persetujuan: $setuju');

                // // kita dapat tambahkan logika pada form  di dalam sini
                // // pada contoh ini kita menampilkan data pada Dialog
                // showDialog(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return AlertDialog(
                //       title: Text('Profile Data'),
                //       content: SingleChildScrollView(
                //         child: ListBody(
                //           children: <Widget>[
                //             Text('Name: $nama'),
                //             Text('Email: $email'),
                //             Text('Telepon: $tlpn'),
                //             Text('Gender: $jenisKel'),
                //             Text('Kota Terdekat: $kota'),
                //             Text('Persetujuan: $setuju'),
                //           ],
                //         ),
                //       ),
                //       actions: <Widget>[
                //         TextButton(
                //           child: Text('OK'),
                //           onPressed: () {
                //             Navigator.of(context).pop();
                //           },
                //         ),
                //       ],
                //     );
                //   },
                // );
              },
              child: Text('Daftar'),
            ),
          ],
        ),
      ),
    );
  }
}
