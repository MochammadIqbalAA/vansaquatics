import 'package:flutter/material.dart';

class FriendListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friendlist'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search, color: Colors.black54),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Daftar Teman
            Expanded(
              child: ListView(
                children: [
                  // Contoh item teman
                  FriendListItem(
                    name: 'Asep Cupang',
                    avatarUrl: 'https://via.placeholder.com/150', // Ganti dengan URL gambar avatar
                    onMessagePressed: () {
                      // Tindakan saat ikon pesan ditekan
                      print('Message pressed for Asep Cupang');
                    },
                  ),
                  // Tambahkan lebih banyak item teman di sini
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FriendListItem extends StatelessWidget {
  final String name;
  final String avatarUrl;
  final VoidCallback onMessagePressed;

  FriendListItem({
    required this.name,
    required this.avatarUrl,
    required this.onMessagePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Avatar
          ClipOval(
            child: Image.network(
              avatarUrl,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12),
          // Nama Teman
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Ikon Pesan
          IconButton(
            icon: Icon(Icons.message),
            onPressed: onMessagePressed,
            color: Colors.black54,
          ),
        ],
      ),
    );
  }
}
