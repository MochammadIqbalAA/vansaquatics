import 'package:flutter/material.dart';

class GroupOpenedView extends StatelessWidget {
  final String groupName = "Komunitas Ikan Hias Malang Raya"; // Ganti sesuai kebutuhan
  final String groupDescription = "Group description ...";
  final String timestamp = "21.27"; // Waktu pesan

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(groupName),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildGroupMessageBubble("Info Kopdar e bolo", "Asep Cupang", timestamp, true),
                _buildGroupMessageBubble("Serlok tak parani sep", "Saya", timestamp, false),
              ],
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildGroupMessageBubble(String message, String sender, String timestamp, bool isSender) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: isSender ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sender,
              style: TextStyle(fontWeight: FontWeight.bold, color: isSender ? Colors.white : Colors.black),
            ),
            SizedBox(height: 2),
            Text(
              message,
              style: TextStyle(color: isSender ? Colors.white : Colors.black),
            ),
            SizedBox(height: 5),
            Text(
              timestamp,
              style: TextStyle(fontSize: 10, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.mic),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
