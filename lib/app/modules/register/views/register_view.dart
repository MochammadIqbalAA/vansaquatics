import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/register_controller.dart';

class RegisterView extends StatelessWidget {
  // Inisialisasi controller
  final RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar perangkat
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(); // Kembali ke halaman sebelumnya (LoginView)
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: screenHeight, // Pastikan tinggi minimal sama dengan layar
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo kiri atas dengan rotasi
                  Align(
                    alignment: Alignment.topLeft,
                    child: Opacity(
                      opacity: 0.35, // Opacity 35%
                      child: Transform(
                        transform: Matrix4.rotationY(3.14159), // Membalik logo secara horizontal
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/logo.jpg', // Path logo Anda
                          height: screenHeight * 0.1, // Ukuran dinamis
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  // Nama TextField
                  _buildTextField(
                    label: 'Nama',
                    onChanged: (value) => controller.nama.value = value,
                    icon: Icons.person,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  // Alamat TextField
                  _buildTextField(
                    label: 'Alamat',
                    onChanged: (value) => controller.alamat.value = value,
                    icon: Icons.home,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  // No. Telp TextField
                  _buildTextField(
                    label: 'No. Telp',
                    onChanged: (value) => controller.noTelp.value = value,
                    icon: Icons.phone,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  // Email TextField
                  _buildTextField(
                    label: 'Email',
                    onChanged: (value) => controller.email.value = value,
                    icon: Icons.email,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  // Password TextField
                  _buildTextField(
                    label: 'Password',
                    onChanged: (value) => controller.password.value = value,
                    icon: Icons.lock,
                    isPassword: true,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  // Register Button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        controller.register(); // Panggil fungsi register
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.02, horizontal: screenWidth * 0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Text(
                        'Register',
                        style: TextStyle(fontSize: screenHeight * 0.025),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  // Logo kanan bawah
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Opacity(
                      opacity: 0.35, // Opacity 35%
                      child: Image.asset(
                        'assets/logo.jpg', // Path logo Anda
                        height: screenHeight * 0.1, // Ukuran dinamis
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget untuk membangun TextField
  Widget _buildTextField({
    required String label,
    required Function(String) onChanged,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16)),
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
            onChanged: onChanged,
            obscureText: isPassword,
            decoration: InputDecoration(
              hintText: '$label ...',
              border: InputBorder.none,
              prefixIcon: Icon(icon, size: 24.0),
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
            ),
          ),
        ),
      ],
    );
  }
}
