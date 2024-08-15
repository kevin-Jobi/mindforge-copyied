import 'package:flutter/material.dart';
import 'package:mind_forge/screens/profile/profileCrud.dart';

class MySettings extends StatelessWidget {
   MySettings({super.key});
 final List<Map<String, dynamic>> _settingsItems = [
    {'icon': Icons.person, 'text': 'Profile Info'},
    {'icon': Icons.lock, 'text': 'Privacy Policy'},
    {'icon': Icons.alarm, 'text': 'Reminders'},
    {'icon': Icons.share, 'text': 'Share this App'},
    {'icon': Icons.exit_to_app, 'text': 'SignOut'},
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
              child: Text('Settings',style: TextStyle(fontSize: 29),),
            ),
            backgroundColor: Color.fromARGB(255, 13, 227, 127),
          ),
        ),
          body: Container(
            color: Colors.green[100],
            child: ListView.builder(
              itemCount: _settingsItems.length,
              itemBuilder: (context,index){
                return ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.green,

                  ),
                  onPressed: (){
                    if(index==0){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyProfileCrud()));
                    }
                  },
                   icon: Icon(_settingsItems[index]['icon']),
                    label: Text(_settingsItems[index]['text'],
                    style: TextStyle(fontSize: 18),),
                    
                    );
            }),
          ),
      ),
    );
  }
}