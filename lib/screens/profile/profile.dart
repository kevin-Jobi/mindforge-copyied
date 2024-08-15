
import 'package:flutter/material.dart';
import 'package:mind_forge/screens/profile/settings.dart';
import 'package:mind_forge/services/models/model.dart';
import 'package:mind_forge/services/repos/boxes.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  Model1? box;
  void initState(){
    super.initState();
  
   box=Boxes.getData1().get('profile');
  }
    // fun(){
    //   box=Boxes.getData1().get('profile');
    // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
          
        Container(
          height: 80,
         decoration: BoxDecoration(
           color:  Color.fromARGB(255, 13, 227, 127),
           //borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
         ),
        
          child:Center(
        child: box ==null ?
        Text('No profile found'):
        ListTile(
          leading: box!.profileImg.isNotEmpty ?
          Image.memory(box!.profileImg):
          Text(''),
          title:Text(box!.name) ,
        ),
        
          )
        ),
        
          
        Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(38,10,61,8),
                  child: Icon(Icons.favorite),
                ),
                Text('Favoraties',
                style: TextStyle(fontWeight: FontWeight.w500,fontSize: 19),
                ),],
            ),
          ),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(38,10,61,8),
                  child: Icon(Icons.search),
                ),
                Text('Search topics',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 19),),],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MySettings())).then((value) {
              setState(() {
                
              });
            });
          },
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(top:8),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(38,10,61,8),
                    child: Icon(Icons.settings),
                  ),
                  Text('Settings',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 19),),],
              ),
            ),
          ),
        ),
        
        
        
          ]
          
        ),
      ),
    );
  }
}