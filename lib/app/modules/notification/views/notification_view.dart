import 'package:flutter/material.dart';

import '../../notification_detail/views/notification_detail_view.dart'; // Import halaman detail

class NotificationView extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      'icon': Icons.emoji_emotions_outlined,
      'title': 'Pesanan anda telah diterima',
      'subtitle': 'pesanan dengan kode pesanan OAXB23123...',
      'borderColor': Colors.green.shade100,
    },
    {
      'icon': Icons.sentiment_dissatisfied_outlined,
      'title': 'Pesanan anda telah ditolak',
      'subtitle': 'pesanan dengan kode pesanan OAXB23123...',
      'borderColor': Colors.red.shade100,
    },
    {
      'icon': Icons.sentiment_neutral_outlined,
      'title': 'Pesanan anda stuck di DC Cakung',
      'subtitle': 'pesanan dengan kode pesanan OAXB23123...',
      'borderColor': Colors.orange.shade100,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];

          return GestureDetector(
            onTap: () {
              if (index == 0) {
                // Jika notifikasi pertama, navigasi ke halaman detail
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationDetailView(),
                  ),
                );
              } else {
                // Tambahkan aksi lain atau tetap kosong untuk item lainnya
              }
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: notification['borderColor']),
                boxShadow: [
                  BoxShadow(
                    color: notification['borderColor'].withOpacity(0.5),
                    blurRadius: 6,
                    spreadRadius: 1,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(notification['icon'], size: 40, color: Colors.black54),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notification['title'],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          notification['subtitle'],
                          style: TextStyle(color: Colors.black45),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
