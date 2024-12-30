import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderAdminController extends GetxController {
  
  Future<void> updateStatusOrder(String orderId, String newStatus) async {
  try {
    await FirebaseFirestore.instance
        .collection('orders')
        .doc(orderId)
        .update({'statusOrder': newStatus});
    Get.snackbar(
      "Success",
      "Status order berhasil diperbarui ke '$newStatus'",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.shade50,
    );
  } catch (e) {
    Get.snackbar(
      "Error",
      "Gagal memperbarui status order: $e",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red.shade50,
    );
  }
}


  final count = 0.obs;
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
