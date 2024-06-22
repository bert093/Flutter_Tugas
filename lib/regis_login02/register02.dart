import 'package:flutter/material.dart';
import 'package:flutter_tugas/regis_login02/login02.dart';

class Register02 extends StatefulWidget { // class Register02 merupakan stateful widget yang berarti class ini memiliki state yang dapat berubah
  const Register02({super.key}); // konstruktor dari class Register02

  @override
  _UserProfileFormState createState() => _UserProfileFormState(); // Anotasi @override digunakan untuk menunjukkan bahwa metode createState ini mengoverride metode yang ada di kelas induk (StatefulWidget). Ini adalah cara untuk memastikan bahwa Anda benar-benar mengoverride metode yang ada dan bukan secara tidak sengaja membuat metode baru.
}

class _UserProfileFormState extends State<Register02> { // class _UserProfileFormState merupakan state dari class Register02
  // Controllers for text fields (pak made)
  final TextEditingController _namaController = TextEditingController(); // controller untuk text field nama
  final TextEditingController _emailController = TextEditingController(); // controller untuk text field email
  final TextEditingController _tlpnController = TextEditingController(); // controller untuk text field telepon
  final TextEditingController _pswdController = TextEditingController(); // controller untuk text field password

  // Variables for other inputs (pak made)
  bool _setuju = false; // variabel untuk checkbox persetujuan
  String _jenisKelamin = ''; // variabel untuk radio button jenis kelamin
  String _pilihKota = '<pilih>'; // variabel untuk dropdown kota terdekat

  @override
  void dispose() { // method dispose digunakan untuk membersihkan resource yang digunakan oleh widget
    // dispose dipanggil ketika widget dihapus dari widget tree.
    // Clean up the controllers when the widget is disposed (pak made)
    _namaController.dispose();
    _emailController.dispose();
    _tlpnController.dispose();
    _pswdController.dispose();
    super.dispose();
  }

  void _register() { // Metode _register() dalam kode Anda digunakan untuk menangani logika pendaftaran pengguna.
    String nama = _namaController.text; // mengambil nilai dari text field nama
    String email = _emailController.text; // mengambil nilai dari text field email
    String password = _pswdController.text; // mengambil nilai dari text field password

    if (email == '' || password == '' || _setuju == false) { // jika email, password atau persetujuan kosong, maka akan menampilkan pesan dialog
      showDialog( // method showDialog digunakan untuk menampilkan dialog
        context: context, // context digunakan untuk mengakses konteks widget
        builder: (BuildContext context) { // builder digunakan untuk membuat konten dari dialog
          return AlertDialog( // AlertDialog digunakan untuk menampilkan dialog
            title: Text('Kesalahan !!'), // title digunakan untuk judul dari dialog
            content:
                Text('email, password atau persetujuan tidak boleh kosong'),
            actions: <Widget>[ // actions digunakan untuk tombol dalam dialog
              TextButton( // TextButton digunakan untuk menampilkan tombol
                child: Text('OK'), // child digunakan untuk konten dari tombol
                onPressed: () { // onPressed digunakan untuk menangani klik tombol
                  Navigator.of(context).pop(); // method pop digunakan untuk menutup dialog
                },
              ),
            ],
          );
        },
      );
    } else {
      // Navigator.pushNamed dengan arguments untuk mengirim data ke halaman login (pak made)
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage02(
            registeredNama02: nama, // mengirim data nama ke halaman login
            registeredEmail02: email, // mengirim data email ke halaman login
            registeredPassword02: password, // mengirim data password ke halaman login
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
            // Nama input (pak made)
            TextField(
              controller: _namaController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            // Email input (pak made)
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
            // Telepon input (pak made)
            TextField(
              controller: _tlpnController,
              decoration: InputDecoration(labelText: 'Telepon'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            // Jenis Kelamin selection (pak made)
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
            //Radio button Jenis Kelamin jangan ditambah lagi Pesan: MdYd. (pak made)
            const SizedBox(height: 20),
            // Kota Terdekat selection (pak made)
            const Text('Kota Terdekat',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: _pilihKota,
              onChanged: (String? newValue) {
                setState(() {
                  _pilihKota = newValue!;
                });
              },
              items: <String>[ // items digunakan untuk item dalam dropdown
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
            // Subscription checkbox (pak made)
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
            // Submit button (pak made)
            ElevatedButton(
              onPressed: () {
                _register();
                // Handle form submission (pak made)
                String nama = _namaController.text; // mengambil nilai dari text field nama
                String email = _emailController.text; // mengambil nilai dari text field email
                // String password = _pswdController.text; (pak made)
                String tlpn = _tlpnController.text; // mengambil nilai dari text field telepon
                String jenisKel = _jenisKelamin; // mengambil nilai dari radio button jenis kelamin
                String kota = _pilihKota; // mengambil nilai dari dropdown kota terdekat
                bool setuju = _setuju; // mengambil nilai dari checkbox persetujuan

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
