import 'package:flutter/material.dart';
import '../../addfriend/views/addfriend_view.dart';
import '../../friendlist/views/friendlist_view.dart';
import 'message_opened_view.dart'; // Pastikan file ini ada
import 'group_opened_view.dart'; // Pastikan file ini ada

class InboxView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inbox'),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.person_add_alt_1), // Ikon Add Friend
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddFriendView()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.group), // Ikon Friend List
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FriendListView()),
              );
            },
          ),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              indicatorColor: Colors.teal,
              tabs: [
                Tab(text: 'Friends'),
                Tab(text: 'Groups'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Friends Tab
                  ListView(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(
                              'assets/user.png'), // Ganti dengan gambar profil yang sesuai
                        ),
                        title: Text('Asep Cupang'),
                        subtitle: Text('info spot mancing gacor sep'),
                        trailing: Text('21.22'),
                        onTap: () {
                          // Navigasi ke detail chat teman
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MessageOpenedView()), // Ganti dengan class tampilan pesan yang sesuai
                          );
                        },
                      ),
                      // Tambahkan ListTile lain sesuai kebutuhan
                    ],
                  ),
                  // Groups Tab
                  ListView(
                    children: [
                      ListTile(
                        leading: Icon(Icons.group),
                        title: Text('Komunitas Ikan Hias Malang Raya'),
                        subtitle: Text('Group description ...'),
                        trailing: Text('21.22'),
                        onTap: () {
                          // Navigasi ke detail chat grup
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    GroupOpenedView()), // Ganti dengan class tampilan grup yang sesuai
                          );
                        },
                      ),
                      // Tambahkan ListTile lain sesuai kebutuhan
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
