import 'package:flutter/material.dart'; // memanggil library flutter
import 'package:flutter_tugas/regis_login02/login02.dart'; // memanggil file login02.dart

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
    _namaController.dispose(); // membersihkan controller nama
    _emailController.dispose(); // membersihkan controller email
    _tlpnController.dispose(); // membersihkan controller telepon
    _pswdController.dispose(); // membersihkan controller password
    super.dispose(); // memanggil method dispose dari parent class
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
            title: const Text('Kesalahan !!'), // title digunakan untuk judul dari dialog
            content: const Text('email, password atau persetujuan tidak boleh kosong'), // content digunakan untuk isi dari dialog
            actions: <Widget>[ // actions digunakan untuk tombol dalam dialog
              TextButton( // TextButton digunakan untuk menampilkan tombol
                child: const Text('OK'), // child digunakan untuk konten dari tombol
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
      Navigator.push( // method push digunakan untuk navigasi ke halaman lain
        context, // context digunakan untuk mengakses konteks widget
        MaterialPageRoute( // MaterialPageRoute digunakan untuk membuat route baru
          builder: (context) => LoginPage02( // builder digunakan untuk membuat konten dari route
            registeredNama02: nama, // mengirim data nama ke halaman login
            registeredEmail02: email, // mengirim data email ke halaman login
            registeredPassword02: password, // mengirim data password ke halaman login
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) { // method build digunakan untuk membuat widget
    return Scaffold( // Scaffold digunakan untuk membuat struktur dasar dari halaman
      appBar: AppBar( // AppBar digunakan untuk membuat app bar
        title: const Text('Form Pendaftaran'), // title digunakan untuk judul dari app bar
      ),
      body: Padding( // Padding digunakan untuk memberikan padding pada konten
        padding: const EdgeInsets.all(16.0), // padding digunakan untuk memberikan jarak antara konten dengan tepi
        child: ListView( // ListView digunakan untuk membuat daftar yang dapat di-scroll
          children: [
            // Nama input (pak made)
            TextField( // TextField digunakan untuk membuat input teks
              controller: _namaController, // controller digunakan untuk mengontrol nilai dari input teks
              decoration: const InputDecoration(labelText: 'Nama'), // decoration digunakan untuk memberikan dekorasi pada input teks
            ),
            // Email input (pak made)
            TextField( // TextField digunakan untuk membuat input teks
              controller: _emailController, // controller digunakan untuk mengontrol nilai dari input teks
              decoration: const InputDecoration(labelText: 'Email'), // decoration digunakan untuk memberikan dekorasi pada input teks
              keyboardType: TextInputType.emailAddress, // keyboardType digunakan untuk menentukan jenis keyboard yang muncul
            ),
            TextField( // TextField digunakan untuk membuat input teks
              controller: _pswdController, // controller digunakan untuk mengontrol nilai dari input teks
              decoration: const InputDecoration(labelText: 'Password'), // decoration digunakan untuk memberikan dekorasi pada input teks
              keyboardType: TextInputType.visiblePassword, // keyboardType digunakan untuk menentukan jenis keyboard yang muncul
              obscureText: true, // obscureText digunakan untuk menyembunyikan teks yang diinput
            ),
            // Telepon input (pak made)
            TextField( // TextField digunakan untuk membuat input teks
              controller: _tlpnController, // controller digunakan untuk mengontrol nilai dari input teks
              decoration: const InputDecoration(labelText: 'Telepon'), // decoration digunakan untuk memberikan dekorasi pada input teks
              keyboardType: TextInputType.phone, // keyboardType digunakan untuk menentukan jenis keyboard yang muncul
            ),
            const SizedBox(height: 20), // SizedBox digunakan untuk memberikan jarak antara widget
            // Jenis Kelamin selection (pak made)
            const Text('Jenis Kelamin',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), // Text digunakan untuk menampilkan teks
            ListTile( // ListTile digunakan untuk membuat item dalam daftar
              title: const Text('Pria'), // title digunakan untuk judul dari item
              leading: Radio<String>( // leading digunakan untuk menampilkan widget di sebelah kiri item
                value: 'Pria', // value digunakan untuk nilai dari radio button
                groupValue: _jenisKelamin, // groupValue digunakan untuk menentukan grup dari radio button
                onChanged: (String? value) { // onChanged digunakan untuk menangani perubahan nilai
                  setState(() { // setState digunakan untuk memperbarui state
                    _jenisKelamin = value!; // memperbarui nilai dari _jenisKelamin
                  });
                },
              ),
            ),
            ListTile( // ListTile digunakan untuk membuat item dalam daftar
              title: const Text('Wanita'), // title digunakan untuk judul dari item
              leading: Radio<String>( // leading digunakan untuk menampilkan widget di sebelah kiri item
                value: 'Wanita', // value digunakan untuk nilai dari radio button
                groupValue: _jenisKelamin, // groupValue digunakan untuk menentukan grup dari radio button
                onChanged: (String? value) { // onChanged digunakan untuk menangani perubahan nilai
                  setState(() { // setState digunakan untuk memperbarui state
                    _jenisKelamin = value!; // memperbarui nilai dari _jenisKelamin
                  });
                },
              ),
            ),
            //Radio button Jenis Kelamin jangan ditambah lagi Pesan: MdYd. (pak made)
            const SizedBox(height: 20), // SizedBox digunakan untuk memberikan jarak antara widget
            // Kota Terdekat selection (pak made)
            const Text('Kota Terdekat',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), // Text digunakan untuk menampilkan teks
            DropdownButton<String>( // DropdownButton digunakan untuk membuat dropdown
              value: _pilihKota, // value digunakan untuk nilai dari dropdown
              onChanged: (String? newValue) { // onChanged digunakan untuk menangani perubahan nilai
                setState(() { // setState digunakan untuk memperbarui state
                  _pilihKota = newValue!; // memperbarui nilai dari _pilihKota
                });
              },
              items: <String>[ // items digunakan untuk item dalam dropdown
                '<pilih>', // nilai dari <pilih> harus sama dengan variabel string _pilihKota (bisa dikasih '' jika ingin kosong)
                'Mataram',
                'Peraya',
                'Selong',
                'Tanjung',
                'Sumbawa',
                'Dompu',
                'Bima',
                'Diluar NTB'
              ].map<DropdownMenuItem<String>>((String value) { // map digunakan untuk mengubah item menjadi DropdownMenuItem
                return DropdownMenuItem<String>( // DropdownMenuItem digunakan untuk item dalam dropdown
                  value: value, // value digunakan untuk nilai dari item
                  child: Text(value), // child digunakan untuk konten dari item
                );
              }).toList(), // toList digunakan untuk mengubah iterable menjadi list
            ),
            const SizedBox(height: 20), // SizedBox digunakan untuk memberikan jarak antara widget
            // Subscription checkbox (pak made)
            CheckboxListTile( // CheckboxListTile digunakan untuk membuat item dengan checkbox
              title: const Text('Saya setuju dengan peraturan yang berlaku'), // title digunakan untuk judul dari item
              value: _setuju, // value digunakan untuk nilai dari checkbox
              onChanged: (bool? value) { // onChanged digunakan untuk menangani perubahan nilai
                setState(() { // setState digunakan untuk memperbarui state
                  _setuju = value!; // memperbarui nilai dari _setuju
                });
              },
            ),
            const SizedBox(height: 20), // SizedBox digunakan untuk memberikan jarak antara widget
            // Submit button (pak made)
            ElevatedButton( // ElevatedButton digunakan untuk membuat tombol
              onPressed: () { // onPressed digunakan untuk menangani klik tombol
                _register(); // memanggil method _register
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
                print('Nama: $nama'); // mencetak nilai nama
                print('Email: $email'); // mencetak nilai email
                print('Telepon: $tlpn'); // mencetak nilai telepon
                print('Jenis Kelamin: $jenisKel'); // mencetak nilai jenis kelamin
                print('Kota Terdekat: $kota'); // mencetak nilai kota terdekat
                print('Persetujuan: $setuju'); // mencetak nilai persetujuan

                // // kita dapat tambahkan logika pada form  di dalam sini (pak made)
                // // pada contoh ini kita menampilkan data pada Dialog (pak made)
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
              child: const Text('Daftar'), // child digunakan untuk konten dari tombol
            ),
          ],
        ),
      ),
    );
  }
}
