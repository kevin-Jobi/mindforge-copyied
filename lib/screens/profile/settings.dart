import 'package:flutter/material.dart';
import 'package:mind_forge/screens/profile/profile_crud.dart';

class MySettings extends StatelessWidget {
  MySettings({super.key});

  final List<Map<String, dynamic>> _settingsItems = [
    {'icon': Icons.person, 'text': 'Profile Info', 'color': Colors.blue[800]},
    {'icon': Icons.lock, 'text': 'Privacy Policy', 'color': Colors.red[600]},
    {'icon': Icons.alarm, 'text': 'Reminders', 'color': Colors.green[700]},
    {'icon': Icons.share, 'text': 'Share this App', 'color': Colors.purple[500]},
   
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 29, color: Colors.white),
              ),
            ),
            backgroundColor: Colors.orange[600],
          ),
        ),
        body: Container(
          color: Colors.orange[100],
          child: ListView.builder(
            itemCount: _settingsItems.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (index == 0) {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyProfileCrud()),
                    );
                  }
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.orange[200],
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: _settingsItems[index]['color'],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          _settingsItems[index]['icon'],
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          _settingsItems[index]['text'],
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.orange[900],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.orange[600],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
