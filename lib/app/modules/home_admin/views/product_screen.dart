import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final CollectionReference products = FirebaseFirestore.instance.collection('products');
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  // final TextEditingController _iController = TextEditingController();
  File? _selectedImage;
  String? imageUrl;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    await Permission.camera.request();
    await Permission.storage.request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Manajemen Produk'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showProductDialog(context),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: products.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView(
            padding: EdgeInsets.all(15.0),
            children: snapshot.data!.docs.map((product) {
              final data = product.data() as Map<String, dynamic>;

              return Card(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (data['imageUrl'] != null)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            data['imageUrl'],
                            width: double.infinity,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      SizedBox(height: 10),
                      Text(
                        data['name'] ?? 'No Name',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Harga: Rp. ${data['price'] ?? 'Unknown'}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        data['description'] ?? 'No Description',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => _showProductDialog(context, product: product),
                            child: Text('Edit'),
                          ),
                          TextButton(
                            onPressed: () => _deleteProduct(product.id),
                            child: Text('Hapus'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  Future<void> _addProduct(String name, double price, String description, String imageUrl) async {
    await products.add({
      'name': name,
      'price': price,
      'description': description,
      'imageUrl': imageUrl,
    });
  }

  Future<void> _updateProduct(String id, String name, double price, String description, String imageUrl) async {
    await products.doc(id).update({
      'name': name,
      'price': price,
      'description': description,
      'imageUrl': imageUrl,
    });
  }

  Future<void> _deleteProduct(String id) async {
    await products.doc(id).delete();
  }

  Future<String> _uploadImage() async {
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    setState(() {
      _selectedImage = File(pickedFile.path); // Update _selectedImage
    });
    final fileName = pickedFile.name;
    final storageRef = FirebaseStorage.instance.ref().child('products/$fileName');
    final uploadTask = storageRef.putFile(File(pickedFile.path));

    final snapshot = await uploadTask.whenComplete(() {});
    final imageUrl = await snapshot.ref.getDownloadURL();
    return imageUrl;
  }
  return ''; // Return empty string if no image is selected
}


  void _showProductDialog(BuildContext context, {DocumentSnapshot? product}) async {
    if (product != null) {
      final data = product.data() as Map<String, dynamic>;
      _nameController.text = data['name'] ?? '';
      _priceController.text = data['price']?.toString() ?? '';
      _descriptionController.text = data['description'] ?? '';
      imageUrl = data['imageUrl'] ?? '';
    } else {
      _nameController.clear();
      _priceController.clear();
      _descriptionController.clear();
      _selectedImage = null;
    }

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 8,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    product == null ? 'Tambah Produk' : 'Edit Produk',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Nama Produk',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.label),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _priceController,
                    decoration: InputDecoration(
                      labelText: 'Harga Produk',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.money),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Deskripsi Produk',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.description),
                    ),
                    maxLines: 3,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    icon: Icon(Icons.image),
                    label: Text('Pilih Gambar'),
                    onPressed: () async {
                      imageUrl = await _uploadImage();
                      if(_selectedImage != null){
                        print('GAMBAR SUDAH DIPILIH');
                      }
                      setState(() {
                        _selectedImage = File(imageUrl!);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  if (_selectedImage != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        _selectedImage!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ) else if (imageUrl != null && imageUrl!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          imageUrl!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[400],
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Batal',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final name = _nameController.text;
                          final price = double.tryParse(_priceController.text) ?? 0.0;
                          final description = _descriptionController.text;
                          final imageUrl = await _uploadImage() ?? '';

                          if (product == null) {
                            _addProduct(name, price, description, imageUrl);
                          } else {
                            _updateProduct(product.id, name, price, description, imageUrl);
                          }
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          product == null ? 'Tambah' : 'Simpan',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
