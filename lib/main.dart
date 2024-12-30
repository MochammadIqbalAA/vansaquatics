import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app/modules/home/views/home_view.dart';
import 'app/modules/home_admin/views/home_admin_view.dart';
import 'app/modules/login/views/login_view.dart';
import 'app/modules/register/views/register_view.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => AuthChecker()),
        GetPage(name: '/login', page: () => LoginView()),
        GetPage(name: '/home', page: () => HomeView()),
        GetPage(name: '/register', page: () => RegisterView()),
        GetPage(name: '/home_admin', page: () => HomeAdminView()),
      ],
    );
  }
}

// Widget untuk mengecek status autentikasi dan role pengguna
class AuthChecker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Loading indicator ketika Firebase sedang memeriksa status
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        // Jika pengguna belum login, arahkan ke LoginView
        if (!snapshot.hasData || snapshot.data == null) {
          return LoginView();
        }

        // Jika pengguna sudah login, cek role pengguna di Firestore
        return FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance
              .collection('users')
              .doc(snapshot.data!.uid)
              .get(),
          builder: (context, snapshot) {
            // Loading indicator saat menunggu data Firestore
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            // Jika ada error atau data tidak ditemukan
            if (snapshot.hasError ||
                !snapshot.hasData ||
                !snapshot.data!.exists) {
              return LoginView();
            }

            // Ambil role dari dokumen Firestore
            final userRole = snapshot.data!['role'];

            // Arahkan pengguna sesuai dengan role
            if (userRole == 'admin') {
              return HomeAdminView();
            } else {
              return HomeView();
            }
          },
        );
      },
    );
  }
}
