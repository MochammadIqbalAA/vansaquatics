import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../login/views/login_view.dart';


class RegisterController extends GetxController {
  var nama = ''.obs;
  var alamat = ''.obs;
  var noTelp = ''.obs;
  var email = ''.obs; // Menambahkan email
  var password = ''.obs;

  Future<void> register() async {
    try {
      // Buat akun baru di Firebase Authentication menggunakan email
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );

      // Simpan data pengguna di Firestore dengan role "customer"
      await FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid).set({
        'nama': nama.value,
        'alamat': alamat.value,
        'noTelp': noTelp.value,
        'email': email.value,
        'role': 'customer', // Role default sebagai customer
      });

      // Arahkan pengguna ke halaman login setelah registrasi berhasil
      Get.to(() => LoginView());
    } catch (e) {
      print("Register error: $e");
      // Anda bisa menambahkan dialog untuk error handling
    }
  }
}
