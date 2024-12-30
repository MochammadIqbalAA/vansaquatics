import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOrderView extends StatefulWidget {
  @override
  _MyOrderViewState createState() => _MyOrderViewState();
}

class _MyOrderViewState extends State<MyOrderView> {
  int _selectedIndex = 0;

  final List<String> _tabs = [
    'Belum Dibayar',
    'Dikirim',
    'Selesai',
    'Penilaian',
  ];

  // Daftar widget untuk tiap tab
  final List<Widget> _tabContents = [
    BelumDibayarPage(),
    DikirimPage(),
    SelesaiPage(),
    PenilaianPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Order'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.toNamed('/home'); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Column(
        children: [
          // Tab Bar
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(_tabs.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          _tabs[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _selectedIndex == index
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                      ),
                      if (_selectedIndex == index)
                        Container(
                          width: 50,
                          height: 3,
                          color: Colors.black,
                        )
                    ],
                  ),
                );
              }),
            ),
          ),
          // Konten sesuai tab yang dipilih
          Expanded(
            child: _tabContents[_selectedIndex],
          ),
        ],
      ),
    );
  }
}



class BelumDibayarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('orders')
          .where('statusOrder', isEqualTo: 'Belum Dibayar').where('userByEmail', isEqualTo: FirebaseAuth.instance.currentUser!.email)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final orders = snapshot.data!.docs;

        return ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            final orderDetails = List.from(order['orderDetails']); // List produk

            return Card(
              borderOnForeground: false,
              color: Colors.red.shade50,
              margin: const EdgeInsets.all(10),
              child: ExpansionTile(
                
                title: Text('Total: Rp ${order['grandTotal']}'), 
                subtitle: Text('Order ID: ${order.id}'),
                children: orderDetails.map<Widget>((product) {
                  return ListTile(
                    title: Text('Name : ${product['name']}'),
                    subtitle: Text('Qty: ${product['quantity']}'),
                    trailing: Text('Rp ${product['price']}'),
                  );
                }).toList(),
              ),
            );
          },
        );
      },
    );
  }
}


class DikirimPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('orders')
          .where('statusOrder', isEqualTo: 'Dikirim').where('userByEmail', isEqualTo: FirebaseAuth.instance.currentUser!.email)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final orders = snapshot.data!.docs;

        return ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            final orderDetails = List.from(order['orderDetails']); // List produk

            return Card(
              borderOnForeground: false,
              color: Colors.red.shade50,
              margin: const EdgeInsets.all(10),
              child: ExpansionTile(
                
                title: Text('Total: Rp ${order['grandTotal']}'), 
                subtitle: Text('Order ID: ${order.id}'),
                children: orderDetails.map<Widget>((product) {
                  return ListTile(
                    title: Text('Name : ${product['name']}'),
                    subtitle: Text('Qty: ${product['quantity']}'),
                    trailing: Text('Rp ${product['price']}'),
                  );
                }).toList(),
              ),
            );
          },
        );
      },
    );
  }
}

class SelesaiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('orders')
          .where('statusOrder', isEqualTo: 'Selesai').where('userByEmail', isEqualTo: FirebaseAuth.instance.currentUser!.email)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final orders = snapshot.data!.docs;

        return ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            final orderDetails = List.from(order['orderDetails']); // List produk

            return Card(
              borderOnForeground: false,
              color: Colors.red.shade50,
              margin: const EdgeInsets.all(10),
              child: ExpansionTile(
                
                title: Text('Total: Rp ${order['grandTotal']}'), 
                subtitle: Text('Order ID: ${order.id}'),
                children: orderDetails.map<Widget>((product) {
                  return ListTile(
                    title: Text('Name : ${product['name']}'),
                    subtitle: Text('Qty: ${product['quantity']}'),
                    trailing: Text('Rp ${product['price']}'),
                  );
                }).toList(),
              ),
            );
          },
        );
      },
    );
  }
}

class PenilaianPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('orders')
          .where('statusOrder', isEqualTo: 'Penilaian').where('userByEmail', isEqualTo: FirebaseAuth.instance.currentUser!.email)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final orders = snapshot.data!.docs;

        return ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            final orderDetails = List.from(order['orderDetails']); // List produk

            return Card(
              borderOnForeground: false,
              color: Colors.red.shade50,
              margin: const EdgeInsets.all(10),
              child: ExpansionTile(
                
                title: Text('Total: Rp ${order['grandTotal']}'), 
                subtitle: Text('Order ID: ${order.id}'),
                children: orderDetails.map<Widget>((product) {
                  return ListTile(
                    title: Text('Name : ${product['name']}'),
                    subtitle: Text('Qty: ${product['quantity']}'),
                    trailing: Text('Rp ${product['price']}'),
                  );
                }).toList(),
              ),
            );
          },
        );
      },
    );
  }
}
