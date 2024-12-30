import 'package:flutter/material.dart';

import '../../waiting_for_payment/views/waiting_for_payment_view.dart';


class PaymentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title
              Text(
                'Payment',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              // Grand Total and Payment Deadline in a box
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blueAccent),
                ),
                child: Column(
                  children: [
                    // Grand Total
                    Text(
                      'Grand Total: Rp. 140.000',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 10),

                    // Payment Deadline
                    Text(
                      'Payment Deadline: 06:32 A.M, 27/10/2024',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),

              // Bank Name in a box
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.greenAccent),
                ),
                child: Column(
                  children: [
                    // Bank Name
                    Text(
                      'BCA',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),

                    // Virtual Account Number with icon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Nomor Virtual Account: 1234567890',
                          style: TextStyle(fontSize: 16),
                        ),
                        IconButton(
                          icon: Icon(Icons.copy),
                          onPressed: () {
                            // Action for copying the virtual account number
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Payment verification message
              Text(
                'Payment verification will be detected immediately after you make the transfer.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 40),

              // Continue button
              ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman Waiting for Payment
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WaitingForPayment()),
                  );
                },
                child: Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Main function to run the app (for testing purposes)
void main() {
  runApp(MaterialApp(
    title: 'Payment Screen',
    home: PaymentView(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
  ));
}
