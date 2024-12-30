import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vansaquatic/app/modules/order_admin/controllers/order_admin_controller.dart';

class OrderAdminView extends StatefulWidget {
  @override
  _OrderAdminViewState createState() => _OrderAdminViewState();
}

class _OrderAdminViewState extends State<OrderAdminView> {
  final OrderAdminController orderAdminController = Get.put(OrderAdminController());
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
  final OrderAdminController orderAdminController = Get.find<OrderAdminController>();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('orders')
          .where('statusOrder', isEqualTo: 'Belum Dibayar')
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
                title: Text('Total : Rp ${order['grandTotal']}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('User : ${snapshot.data!.docs[index]['userByEmail']}'),
                    Text('Order ID: ${order.id}'),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    
                    Icon(Icons.expand_more), // Default dropdown icon
                    GestureDetector(
                      onTap: () {

                          Get.defaultDialog(
                            title: "Konfirmasi",
                            middleText: "Update status ke 'Dikirim'?",
                            textCancel: "Batal",
                            textConfirm: "Ya",
                            onCancel: () {},
                            onConfirm: () {
                              orderAdminController.updateStatusOrder(order.id, 'Dikirim'); // Panggil fungsi dengan ID order dan status baru
                              Get.back(); // Tutup dialog
                            },
                            confirmTextColor: Colors.white,
                            cancelTextColor: Colors.black,
                            buttonColor: Colors.blue,
                            barrierDismissible: false,
                          );
                        },

                      child: Icon(Icons.check_circle, color: Colors.green))
                  ],
                ),
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
  final OrderAdminController orderAdminController = Get.find<OrderAdminController>();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('orders')
          .where('statusOrder', isEqualTo: 'Dikirim')
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
              color: Colors.yellow.shade50,
              margin: const EdgeInsets.all(10),
              child: ExpansionTile(
                title: Text('Total : Rp ${order['grandTotal']}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('User : ${snapshot.data!.docs[index]['userByEmail']}'),
                    Text('Order ID: ${order.id}'),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    
                    Icon(Icons.expand_more), // Default dropdown icon
                    GestureDetector(
                      onTap: () {

                          Get.defaultDialog(
                            title: "Konfirmasi",
                            middleText: "Update status ke 'Selesai'?",
                            textCancel: "Batal",
                            textConfirm: "Ya",
                            onCancel: () {},
                            onConfirm: () {
                              orderAdminController.updateStatusOrder(order.id, 'Selesai'); // Panggil fungsi dengan ID order dan status baru
                              Get.back(); // Tutup dialog
                            },
                            confirmTextColor: Colors.white,
                            cancelTextColor: Colors.black,
                            buttonColor: Colors.blue,
                            barrierDismissible: false,
                          );
                        },

                      child: Icon(Icons.check_circle, color: Colors.green))
                  ],
                ),
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
  final OrderAdminController orderAdminController = Get.find<OrderAdminController>();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('orders')
          .where('statusOrder', isEqualTo: 'Selesai')
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
              color: Colors.green.shade50,
              margin: const EdgeInsets.all(10),
              child: ExpansionTile(
                title: Text('Total : Rp ${order['grandTotal']}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('User : ${snapshot.data!.docs[index]['userByEmail']}'),
                    Text('Order ID: ${order.id}'),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    
                    Icon(Icons.expand_more), // Default dropdown icon
                    GestureDetector(
                      onTap: () {

                          Get.defaultDialog(
                            title: "Konfirmasi",
                            middleText: "Update status ke 'Penilaian'?",
                            textCancel: "Batal",
                            textConfirm: "Ya",
                            onCancel: () {},
                            onConfirm: () {
                              orderAdminController.updateStatusOrder(order.id, 'Penilaian'); // Panggil fungsi dengan ID order dan status baru
                              Get.back(); // Tutup dialog
                            },
                            confirmTextColor: Colors.white,
                            cancelTextColor: Colors.black,
                            buttonColor: Colors.blue,
                            barrierDismissible: false,
                          );
                        },

                      child: Icon(Icons.check_circle, color: Colors.green))
                  ],
                ),
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
          .where('statusOrder', isEqualTo: 'Penilaian')
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
              color: Colors.blue.shade50,
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
