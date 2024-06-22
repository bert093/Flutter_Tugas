import 'package:flutter/material.dart';

class Barang {
  final String name;
  final String image;

  Barang({required this.name, required this.image});
}

class BarangPage02 extends StatefulWidget {
  const BarangPage02({super.key});

  @override
  _BarangPageState createState() => _BarangPageState();
}

class _BarangPageState extends State<BarangPage02> {
  final List<Barang> _items = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  void _addItem() {
    final String name = _nameController.text;
    final String image = _imageController.text;

    if (name.isNotEmpty && image.isNotEmpty) {
      setState(() {
        _items.add(Barang(name: name, image: image));
      });
      _nameController.clear();
      _imageController.clear();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Input Data Barang'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nama Barang',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _imageController,
              decoration: InputDecoration(
                labelText: 'URL Gambar Barang',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addItem,
              child: Text('Tambahkan Barang'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Image.network(
                        _items[index].image,
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,
                      ),
                      title: Text(_items[index].name),
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
