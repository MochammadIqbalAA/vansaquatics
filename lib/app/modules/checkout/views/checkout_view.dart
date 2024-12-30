import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vansaquatic/app/modules/checkout/controllers/checkout_controller.dart';

import '../../cart_page/controllers/cart_page_controller.dart';
import '../../payment/views/payment_view.dart';


class CheckoutView extends StatelessWidget {

  final CartPageController cartController = Get.find<CartPageController>();
  final CheckoutController checkoutController = Get.put(CheckoutController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Aksi untuk tombol back
          },
        ),
        title: Text('Checkout'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(221, 255, 255, 255),
      ),
      body: CheckoutBody(),
    );
  }
}

class CheckoutBody extends StatelessWidget {
  final CartPageController cartController = Get.find<CartPageController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        
        children: [
          AddressSection(),
          SizedBox(height: 20),
          OrderDetails(),
          SizedBox(height: 20),
          // PaymentMethodSection(),
          // Spacer(),
          MakeOrderButton(),
        ],
      ),
    );
  }
}

class AddressSection extends StatelessWidget {
  final CartPageController cartController = Get.find<CartPageController>();
  final CheckoutController checkoutController = Get.find<CheckoutController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Address',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          SizedBox(
           
            child: TextField(
              onChanged: (value) {
                checkoutController.alamat.value = value;
              },
              decoration: InputDecoration(border: InputBorder.none, labelText: 'JL.XXX NO.00 RT/RW.KEC/KABUPATEN/\nKOTA/KODE POS', labelStyle: TextStyle(fontSize: 14)), maxLines: 2,)),
         
        ],
      ),
    );
  }
}

class OrderDetails extends StatelessWidget {
  final CartPageController cartController = Get.find<CartPageController>();
  final CheckoutController checkoutController = Get.find<CheckoutController>();
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Details',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Obx(() {
            return Column(
              children: cartController.cartItems.map((item) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${item.name} (${item.quantity.toString()}x)'),
                    Text('Rp. ${(int.parse(item.price) * item.quantity).toString()}'),
                  ],
                );
              }).toList(),
            );
          }),
          
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Product Price:'),
              Text('Rp. ${cartController.totalPrice}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shipping Cost:'),
              Text('Rp. ${checkoutController.shippingCost}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Service Fee:'),
              Text('Rp. ${checkoutController.serviceFee}'),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Grand Total:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Rp. ${checkoutController.grandTotal}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PaymentMethodSection extends StatefulWidget {
  @override
  _PaymentMethodSectionState createState() => _PaymentMethodSectionState();
}

class _PaymentMethodSectionState extends State<PaymentMethodSection> {
  int? selectedPaymentMethod; // Untuk menyimpan metode pembayaran yang dipilih
  String? selectedBank; // Untuk menyimpan bank yang dipilih
  String? selectedEMoney; // Untuk menyimpan e-Money yang dipilih

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Method',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          ListTile(
            title: Text('COD (Cash On Delivery)'),
            leading: Radio<int>(
              value: 1,
              groupValue: selectedPaymentMethod,
              onChanged: (int? value) {
                setState(() {
                  selectedPaymentMethod = value;
                  selectedBank = null; // Reset bank selection
                  selectedEMoney = null; // Reset e-Money selection
                });
              },
            ),
          ),
          ListTile(
            title: Text('Bank Transfer'),
            leading: Radio<int>(
              value: 2,
              groupValue: selectedPaymentMethod,
              onChanged: (int? value) {
                setState(() {
                  selectedPaymentMethod = value;
                  selectedBank = null; // Reset bank selection
                  selectedEMoney = null; // Reset e-Money selection
                });
              },
            ),
          ),
          if (selectedPaymentMethod == 2) // Menampilkan dropdown untuk Bank Transfer
            DropdownButton<String>(
              hint: Text("Select Bank"),
              value: selectedBank,
              items: <String>['BCA', 'BRI', 'BNI', 'Mandiri']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedBank = value; // Menyimpan bank yang dipilih
                });
              },
            ),
          ListTile(
            title: Text('e-Money'),
            leading: Radio<int>(
              value: 3,
              groupValue: selectedPaymentMethod,
              onChanged: (int? value) {
                setState(() {
                  selectedPaymentMethod = value;
                  selectedBank = null; // Reset bank selection
                  selectedEMoney = null; // Reset e-Money selection
                });
              },
            ),
          ),
          if (selectedPaymentMethod == 3) // Menampilkan dropdown untuk e-Money
            DropdownButton<String>(
              hint: Text("Select e-Money"),
              value: selectedEMoney,
              items: <String>['OVO', 'Gopay', 'Dana', 'Qris']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedEMoney = value; // Menyimpan e-Money yang dipilih
                });
              },
            ),
        ],
      ),
    );
  }
}

class MakeOrderButton extends StatelessWidget {
  final CheckoutController checkoutController = Get.find<CheckoutController>();
  final CartPageController cartPageController = Get.find<CartPageController>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: (){
          
          // Data pesanan yang akan dikirim ke Firestore
          Map<String, dynamic> orderData = {
            "address": checkoutController.alamat.value, // Ganti dengan alamat yang diinput
            "orderDetails":cartPageController.cartItems.map((item) => item.toMap()) // Konversi setiap CartItem menjadi Map
      .toList(),
            "totalProductPrice": cartPageController.totalPrice.toString(),
            "shippingCost": checkoutController.shippingCost.value,
            "serviceFee": checkoutController.serviceFee.value,
            "grandTotal": checkoutController.grandTotal,
            "timestamp": DateTime.now(),
            "userByEmail": FirebaseAuth.instance.currentUser!.email ?? "Tidak diketahui",
            "statusOrder": "Belum Dibayar", 
          };

          checkoutController.showOrderDialog(orderData);
        },
        
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
          backgroundColor: Colors.lightBlue,
        ),
        child: Text(
          'Make an Order',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
