import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/cart_models.dart';
import '../../cart_page/controllers/cart_page_controller.dart';
import '../../cart_page/views/cart_page_view.dart';

class DetailItemView extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String name;
  final String price;
  final String description;

  DetailItemView({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final CartPageController cartController = Get.put(CartPageController());
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(name, style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
              // Navigasi ke halaman Cart
              Get.to(() => CartPage());
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(25.0),
              padding: const EdgeInsets.all(16.0),
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Gambar produk
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      height: 200,
                      width: 200,
                    ),
                  ),
                  SizedBox(height: 16),
                  // Nama produk
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 16),
                  // Deskripsi produk (contoh)
                  Text(
                    description,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rp. ${price}',
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.bookmark_border_rounded,
                            size: 35,
                          ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            cartController.addItem(
              CartItem(
                id: id,
                name: name,
                description: description,
                price: price,
                imageUrl: imageUrl,
              ));
              Get.snackbar("Success", "Item added to cart!");
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                Colors.lightBlue, // Mengatur warna latar belakang tombol
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Add to cart',
            style: TextStyle(
                fontSize: 16, color: Colors.white), // Mengatur warna teks
          ),
        ),
      ),
    );
  }
}
