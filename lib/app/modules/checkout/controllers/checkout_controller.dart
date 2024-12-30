import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../cart_page/controllers/cart_page_controller.dart';

class CheckoutController extends GetxController {
 final CartPageController cartController = Get.find<CartPageController>();

  // Alamat pengiriman
  var alamat = ''.obs;

  // Biaya pengiriman
  var shippingCost = 15000.obs;

  // Biaya layanan
  var serviceFee = 5000.obs;

  //Grand Total
  int get grandTotal => cartController.totalPrice + shippingCost.value + serviceFee.value;

  final count = 0.obs;



    Future<void> showOrderDialog(Map<String, dynamic> orderData) async{
      if(alamat != "".obs){
    Get.defaultDialog(
        title: "Konfirmasi",
        middleText: "Ingin buat order dan Hubungi admin untuk pembayaran ?",
        textCancel: "Batal",
        textConfirm: "Ya",
        onCancel: () {
        },
        onConfirm: () {
          // Aksi ketika tombol "Ya" ditekan
          Get.back(); // Menutup dialog
          // Lakukan sesuatu, misalnya panggil fungsi untuk membuat order
          createOrder(orderData);
          Get.offAllNamed('/home');
        },
        confirmTextColor: Colors.white,
        cancelTextColor: Colors.black,
        buttonColor: Colors.blue,
        barrierDismissible: false, // Dialog tidak akan tertutup jika pengguna menekan di luar
      );
      } else {
        Get.snackbar("Order Failed", "Lengkapi data!",
          snackPosition: SnackPosition.BOTTOM);
      }
      
    }

  Future<void> createOrder(Map<String, dynamic> orderData) async {
    try {
      // Menambahkan data ke koleksi 'orders' di Firestore
      await FirebaseFirestore.instance.collection('orders').add(orderData);

      // Mengambil data email pengguna dan konversi data cartItems menjadi string
      final String userEmail = FirebaseAuth.instance.currentUser!.email ?? "Tidak diketahui";
      final String alamatPengguna = alamat.value ?? "Tidak diketahui";
      final String items = cartController.cartItems.map((item) => item.toString()).join(", ");
      final String totalHarga = grandTotal.toString();

      final String message =
          "Halo Admin, pesanan saya dengan detail berikut:\n\n"
          "- Nama : $userEmail\n"
          "- Alamat: $alamatPengguna\n"
          "- Items: $items\n"
          "- Grand Total : Rp. $totalHarga\n"
          "Bisakah saya lanjut ke tahap pembayaran?";

      // Membuka URL WhatsApp
      final String url =
          "https://wa.me/6281247293065?text=${Uri.encodeComponent(message)}";

      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } catch (e) {
      print('ERROR : $e');
      
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
