
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../detail_item/views/detail_item_view.dart';
import '../controllers/search_controller.dart' as searchCtrl; 

class SearchView extends StatelessWidget {
  final searchCtrl.SearchController searchController = Get.put(searchCtrl.SearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Search', style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search TextField
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.black54),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        // Panggil fungsi pencarian
                        searchController.searchProducts(value);
                      },
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
  
            // Hasil pencarian
            Expanded(
              child: Obx(() {
                if (searchController.searchResults.isEmpty) {
                  return Center(
                    child: Text(
                      searchController.searchQuery.isEmpty
                          ? 'Produk yang mungkin anda suka'
                          : 'Tidak ada hasil pencarian',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  );
                } else {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: searchController.searchResults.length,
                    itemBuilder: (context, index) {
                      var product = searchController.searchResults[index];
                      return ProductCard(
                        id: product.id,
                        imagePath: product['imageUrl'],
                        title: product['name'],
                        price: product['price'].toString(),
                        description: product['description'],
                      );
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String id;
  final String imagePath;
  final String title;
  final String price;
  final String description;

  ProductCard({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailItemView(
              id: id,
              imageUrl: imagePath,
              name: title,
              price: price,
              description: description,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 150,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10)),
                      child: Image.network(
                        imagePath,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4),
                        Text('Rp. ${price}'),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 1,
                right: 0,
                child: IconButton(
                  icon: Icon(Icons.bookmark_border),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
