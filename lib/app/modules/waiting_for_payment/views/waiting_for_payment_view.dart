import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../myorder/views/myorder_view.dart';

class WaitingForPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Center(
        child: Container(
          width: 300,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Waiting for Payment',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Please make payment immediately in the amount of\nRp. 140.000 before 27-09-2024 AT 06:32 A.m',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/home');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[400], // Background color
                    ),
                    child: Text('Home'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //Navigasi ke halaman My Orders
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyOrderView()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Background color
                    ),
                    child: Text('My Order'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}