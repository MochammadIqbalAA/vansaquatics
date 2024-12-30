import 'package:flutter/material.dart';
import '../../edit_profile/views/edit_profile_view.dart';

class AccountSettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              'Asep Slebor',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              '01347124912468126',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Arahkan ke halaman edit profil
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfileView()),
                );
              },
              icon: Icon(Icons.edit),
              label: Text('Edit Profile'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 217, 217, 217),
                overlayColor: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            _buildInfoCard('Username', 'Asep Slebor'),
            _buildInfoCard('No. Telp', '081222993901'),
            _buildInfoCard('Address', 'JL. Tirto Utomo'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String content) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.grey[200],
      child: ListTile(
        title: Text(title, style: TextStyle(color: Colors.black54)),
        subtitle:
            Text(content, style: TextStyle(fontSize: 18, color: Colors.black)),
      ),
    );
  }
}
