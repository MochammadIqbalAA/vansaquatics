import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../home/views/home_view.dart';
import '../../home_admin/views/home_admin_view.dart';

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;

  Future<void> login() async {
    try {
      // Login dengan Firebase Authentication
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: username.value,
        password: password.value,
      );

      // Ambil dokumen pengguna dari Firestore untuk cek role
      var userDoc = await FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid).get();
      if (userDoc.exists) {
        // Mengambil data pengguna dan memastikan tipe data yang benar
        Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;
        String role = data['role'] as String; // Pastikan 'role' ada dan bukan null
        print("Role pengguna: $role"); // Log role pengguna

        // Arahkan ke halaman sesuai role
        if (role == 'admin') {
          Get.offAll(() => HomeAdminView()); // Menuju halaman admin
        } else if (role == 'customer') {
          Get.offAll(() => HomeView()); // Menuju halaman customer
        } else {
          print("Role tidak dikenali");
        }
      } else {
        print("Dokumen pengguna tidak ditemukan");
      }
    } catch (e) {
      print("Login error: $e");
      // Menampilkan snackbar dengan pesan kesalahan
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }
}