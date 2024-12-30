import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../favorite_product/views/favorite_product_view.dart';
import '../../myorder/views/myorder_view.dart';
import '../../notification_setting/views/notification_setting_view.dart';
import '../../login/views/login_view.dart';
import '../../report_problem/views/report_problem_view.dart';
import '../../faq/views/faq_view.dart';
import '../../aboutus/views/aboutus_view.dart';
import '../../privacy/views/privacy_view.dart';
import '../../account_settings/views/account_settings_view.dart';

// Dummy pages for navigation




class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true, // Title ke tengah
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Ikon panah kembali
          onPressed: () {
            Navigator.of(context).pop(); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Stack(
        children: [
          // Bagian Profil
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Asep Slebor',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  '01347124912468126',
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
          // Kotak menu Account
          Positioned(
            top: 121,
            left: 32,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AccountSettingsView()),
                          );
                // Navigasi ke halaman lain jika diperlukan
              },
              child: Container(
                width: 150,
                height: 84,
                decoration: BoxDecoration(
                  color: Color.fromARGB(175, 180, 180, 180), // Warna lebih terang
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center ke tengah
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0), // Menambah padding ke kiri
                      child: Icon(Icons.account_circle, color: Colors.black),
                    ),
                    SizedBox(width: 8), // Memberikan jarak antara icon dan teks
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0), // Menambah padding ke kiri
                          child: Text(
                            'Account',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Icon(Icons.chevron_right,
                        color: Colors.black), // Chevron icon
                  ],
                ),
              ),
            ),
          ),
          // Kotak menu Privacy Settings
          Positioned(
            top: 121,
            left: 191,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PrivacySettingsView()),
                          );
                // Navigasi ke halaman lain jika diperlukan
              },
              child: Container(
                width: 150,
                height: 84,
                decoration: BoxDecoration(
                  color: Color.fromARGB(175, 180, 180, 180), // Warna lebih terang
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center ke tengah
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(Icons.lock, color: Colors.black),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Privacy Settings',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Icon(Icons.chevron_right, color: Colors.black),
                  ],
                ),
              ),
            ),
          ),
          // Kotak menu Notification Settings
          Positioned(
            top: 214,
            left: 32,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotificationSettingsView()),
                          );
              },
              child: Container(
                width: 150,
                height: 84,
                decoration: BoxDecoration(
                  color: Color.fromARGB(175, 180, 180, 180), // Warna lebih terang
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center ke tengah
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 6.0),
                      child: Icon(Icons.notifications, color: Colors.black),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Notification Settings',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Icon(Icons.chevron_right, color: Colors.black),
                  ],
                ),
              ),
            ),
          ),
          // Kotak menu Products Favorit
          Positioned(
            top: 214,
            left: 191,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FavoriteProductsView()),
                          );
              },
              child: Container(
                width: 150,
                height: 84,
                decoration: BoxDecoration(
                  color: Color.fromARGB(175, 180, 180, 180), // Warna lebih terang
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center ke tengah
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(Icons.bookmark, color: Colors.black),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Products Favorit',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Icon(Icons.chevron_right, color: Colors.black),
                  ],
                ),
              ),
            ),
          ),
          // Kotak menu My Order
          Positioned(
            top: 307,
            left: 32,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyOrderView()),
                          );
                // Navigasi ke halaman lain jika diperlukan
              },
              child: Container(
                width: 150,
                height: 84,
                decoration: BoxDecoration(
                  color:  Color.fromARGB(175, 180, 180, 180), // Warna lebih terang
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center ke tengah
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(Icons.card_giftcard, color: Colors.black),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'My Order',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Icon(Icons.chevron_right, color: Colors.black),
                  ],
                ),
              ),
            ),
          ),
          // Tentang Kami, FAQ, dan Report Problems
          Positioned(
            top: 410,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AboutUsView()),
                          );
                  },
                  child: Container(
                    width: 292,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.info, color: Colors.black),
                        ),
                        Expanded(
                          child:
                              Text('About Us', style: TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FaqView()),
                          );
                  },
                  child: Container(
                    width: 292,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child:
                              Icon(Icons.question_answer, color: Colors.black),
                        ),
                        Expanded(
                          child: Text('FAQ', style: TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                          // Navigasi ke halaman NotificationView
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReportProblemsView()),
                          );
                        },
                  child: Container(
                    width: 292,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child:
                              Icon(Icons.report_problem, color: Colors.black),
                        ),
                        Expanded(
                          child: Text('Report Problems',
                              style: TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Tombol Log Out
          Positioned(
            bottom: 32,
            left: 32,
            right: 32,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red), // Outline merah
                borderRadius: BorderRadius.circular(10),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Get.off(LoginView());
                },
                child: Text(
                  'Log Out',
                  style: TextStyle(color: Colors.red), // Teks merah
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.white, // Latar belakang tombol putih
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
