import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  // Inisialisasi controller
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Container(
                  height: 150,
                  width: 150,
                  child: Image.asset(
                    'assets/logo.jpg', // Path yang benar ke file logo
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 40),
                // Username TextField
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email', style: TextStyle(fontSize: 16)),
                    SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(14.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10.0,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: TextField(
                        onChanged: (value) {
                          controller.username.value = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Email ...',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Password TextField
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Password', style: TextStyle(fontSize: 16)),
                    SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(14.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10.0,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: TextField(
                        onChanged: (value) {
                          controller.password.value = value;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password ...',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Login Button
                ElevatedButton(
                  onPressed: () {
                    controller.login(); // Panggil fungsi login
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: 20),
                // Sign Up Text
                TextButton(
                  onPressed: () {
                    Get.toNamed('/register'); // Navigasi ke halaman register
                  },
                  child: Text("Don't have an account? Sign Up"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
