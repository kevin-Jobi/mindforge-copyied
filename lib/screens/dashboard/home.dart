import 'package:flutter/material.dart';
import 'package:mind_forge/screens/Assignments/viewAsmts.dart';

import 'package:mind_forge/screens/dashboard/myHomeContent.dart';
import 'package:mind_forge/screens/exam/exam.dart';
import 'package:mind_forge/screens/media/media.dart';
import 'package:mind_forge/screens/profile/profile.dart';

import 'package:mind_forge/services/models/model.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
 
  List<String>subject=[];
  List<String>duration=[];
  int _currentIndex=0;
  final List<Widget> _btmScreens=[
    MyHomeContent(),
    Media(),
    MyAssingments(),
    MyExams(),
  ];

  void onTabTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  
//
//                                             //alertdialoge end




  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: _currentIndex==0? PreferredSize(
          preferredSize: Size.fromHeight(85),
          child: AppBar(centerTitle: true,
            
              title: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,28,0,0),
                  child: Text('TOPICS',
                  
                  style: TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                    ),
                    ),
                )
                  ),
                  actions: [IconButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyProfile()));
                    },
                     icon: Icon(Icons.more_vert,color: Colors.white , )
                     )],
              backgroundColor: Colors.black
          
          ),
        ) :null,
        //--------------------------------------- body: -------------------------------- start
        body: _btmScreens[_currentIndex],
        //--------------------------------------- body: -------------------------------- end
        
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex:_currentIndex ,
        selectedItemColor: Color.fromARGB(255, 228, 47, 6),
        unselectedItemColor: Color.fromARGB(255, 231, 218, 47),
        backgroundColor: Color.fromARGB(255, 7, 7, 7),
        type: BottomNavigationBarType.fixed,
        
        items: [
          BottomNavigationBarItem(
          
            icon: Icon(Icons.home),
            label: 'Home'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder), 
              label: 'Media'
              ),
             BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: 'Assingment'),
               BottomNavigationBarItem(
              icon: Icon(Icons.quiz_rounded),
              label: 'Exam'
              ),
              
        ]),
        
       
      ),
    );
  }
   void delete(Model model) async{
    await model.delete();
        }
}