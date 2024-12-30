import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../cart_page/views/cart_page_view.dart';
import '../../notification/views/notification_view.dart';
import '../../search/views/search_view.dart'; // Import halaman SearchView
import '../../inbox/views/inbox_view.dart';
import '../../profile/views/profile_view.dart';
import '../../information/views/information_view.dart';

class HomeView extends StatelessWidget {
  // final SearchController searchController = Get.put(SearchController());
  final List<String> imgList = [
    'assets/logo-polos.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              // Welcome Text and Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.notifications),
                        onPressed: () {
                          // Navigasi ke halaman NotificationView
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotificationView()),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.mail),
                        onPressed: () {
                          // Navigasi ke halaman InboxView
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InboxView()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Gambar Biasa
              Center(
                // Tambahkan widget Center di sini
                child: Container(
                  height: 250, // Atur tinggi gambar
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.0),
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/logo-polos.jpg'), // Ganti dengan nama gambar yang sesuai
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Welcome to Van's Aquatic
              Text(
                "Welcome to Van's Aquatic",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "We are an ornamental fish shop that sells complete fish and equipment.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              // Get Started Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchView()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Material(
        // Tambahkan Material di sini
        elevation: 8.0, // Atur nilai elevasi untuk bayangan
        child: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 2, 155, 220),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Information',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: 0,
          selectedItemColor: Colors.blue, // Warna item yang dipilih
          unselectedItemColor: const Color.fromARGB(
              255, 100, 100, 100), // Warna item yang tidak dipilih
          onTap: (index) {
            if (index == 1) {
              // Navigasi ke halaman SearchView
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchView()), // Halaman SearchView
              );
            } else if (index == 4) {
              // Navigasi ke halaman SearchView
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileView()),
              );
            } else if (index == 2) {
              // Navigasi ke halaman SearchView
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InformationView()),
              );
            } else if (index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            }
            // Tambahkan navigasi untuk halaman lain jika dibutuhkan
          },
        ),
      ),
    );
  }
}
