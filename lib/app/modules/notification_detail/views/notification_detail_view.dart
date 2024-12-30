import 'package:flutter/material.dart';

class NotificationDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Detail'),
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.emoji_emotions_outlined,
                    size: 60, color: Colors.green),
                SizedBox(height: 16),
                Text(
                  "Pesanan anda telah diterima",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "pesanan dengan kode pesanan OAXB23123 telah sampai dan diterima",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                SizedBox(height: 24),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Detail Pesanan:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text("Kode Pesanan: OAXB23123"),
                      Text("Nama Barang: Ikan Cupang Half Moon"),
                      Text("Qty: 2"),
                      Text("Total Harga: Rp. 60.000"),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  "Bukti Penerimaan",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                // Menggunakan AspectRatio untuk mempertahankan rasio gambar
                AspectRatio(
                  aspectRatio: 1, // Rasio gambar
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/receipt_image.png'), // Ganti dengan gambar bukti penerimaan
                        fit: BoxFit.contain, // Menjaga rasio gambar
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
