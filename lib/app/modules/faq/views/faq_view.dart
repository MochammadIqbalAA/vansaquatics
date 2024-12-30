import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class FaqView extends StatelessWidget {
  const FaqView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
        title: const Text('FAQ'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          // Pertanyaan pertama
          ExpansionTile(
            title: Text(
                'Does this application provide COD (Cash On Delivery) payment options?'),
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Yes, this application provides many payment options including COD (Cash On Delivery)',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ],
          ),
          // Pertanyaan kedua
          ExpansionTile(
            title: Text('Can I come directly to the shop?'),
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Yes, you are welcome to visit our store during business hours.',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ],
          ),
          // Pertanyaan ketiga
          ExpansionTile(
            title: Text('Is the fish ordered safe for delivery?'),
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'We ensure that all fish are packed securely and delivered with care to ensure their safety.',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ],
          ),
          // Pertanyaan keempat
          ExpansionTile(
            title:
                Text('Does this shop have consulting services for fish care?'),
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Yes, we offer consulting services to help you care for your fish properly.',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
