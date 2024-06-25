import 'package:flutter/material.dart'; // memanggil library flutter

class Barang { // membuat class Barang
  final String name; // mendeklarasikan variabel name dengan tipe data String
  final String image; // mendeklarasikan variabel image dengan tipe data String

  Barang({required this.name, required this.image}); // konstruktor dari class Barang
}

class BarangPage02 extends StatefulWidget { // membuat class BarangPage02 yang merupakan widget stateful
  const BarangPage02({super.key}); // konstruktor dari class BarangPage02

  @override
  _BarangPageState createState() => _BarangPageState(); // method untuk membuat state dari BarangPage02
}

class _BarangPageState extends State<BarangPage02> { // membuat class _BarangPageState yang merupakan state dari BarangPage02
  final List<Barang> _items = []; // mendeklarasikan list _items dengan tipe data Barang
  final TextEditingController _nameController = TextEditingController(); // mendeklarasikan controller untuk nama
  final TextEditingController _imageController = TextEditingController(); // mendeklarasikan controller untuk image

  void _addItem() { // method untuk menambahkan item
    final String name = _nameController.text; // mengambil nilai name dari controller
    final String image = _imageController.text; // mengambil nilai image dari controller

    if (name.isNotEmpty && image.isNotEmpty) { // pengecekan jika name dan image tidak kosong
      setState(() { // memperbarui state
        _items.add(Barang(name: name, image: image)); // menambahkan item ke list _items
      });
      _nameController.clear(); // membersihkan controller name
      _imageController.clear(); // membersihkan controller image
    }
  }

  @override
  void dispose() { // method dispose digunakan untuk membersihkan resource yang digunakan oleh widget
    _nameController.dispose(); // membersihkan controller name
    _imageController.dispose(); // membersihkan controller image
    super.dispose(); // memanggil method dispose dari parent class
  }

  @override
  Widget build(BuildContext context) { // method build untuk membuat widget
    return Scaffold( // membuat scaffold
      appBar: AppBar( // membuat app bar
        title: const Text('Form Input Data Barang'), // judul app bar
      ),
      body: Padding( // padding untuk body
        padding: const EdgeInsets.all(16.0), // padding 16.0
        child: Column( // membuat column
          children: [
            TextField( // membuat text field untuk nama
              controller: _nameController, // controller untuk nama
              decoration: const InputDecoration( // dekorasi input
                labelText: 'Nama Barang', // label nama barang
                border: OutlineInputBorder(), // border outline
              ),
            ),
            const SizedBox(height: 10), // jarak 10
            TextField( // membuat text field untuk image
              controller: _imageController, // controller untuk image
              decoration: const InputDecoration( // dekorasi input
                labelText: 'URL Gambar Barang', // label URL gambar barang
                border: OutlineInputBorder(), // border outline
              ),
            ),
            const SizedBox(height: 10), // jarak 10
            ElevatedButton( // membuat tombol untuk menambahkan barang
              onPressed: _addItem, // aksi tombol untuk menambahkan barang
              child: const Text('Tambahkan Barang'), // teks tombol
            ),
            Expanded( // membuat list view 
              child: ListView.builder( // membuat list view builder
                itemCount: _items.length, // jumlah item
                itemBuilder: (context, index) { // builder untuk item
                  return Card( // membuat card
                    child: ListTile( // membuat list tile
                      leading: Image.network( // membuat image network
                        _items[index].image, // URL gambar
                        fit: BoxFit.cover, // menyesuaikan gambar
                        width: 50, // lebar gambar
                        height: 50, // tinggi gambar
                      ),
                      title: Text(_items[index].name), // judul item
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
