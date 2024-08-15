import 'package:flutter/material.dart';
import 'package:mind_forge/screens/media/mediaImages.dart';
import 'package:mind_forge/screens/media/mediaLinks.dart';

class Media extends StatelessWidget {
  const Media({super.key});

  @override
  Widget build(BuildContext context) {
    
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBar(
            title: Text('Media'),
            backgroundColor: Colors.green,
          ),
        ), 
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              color: Colors.red,
              child: GestureDetector(
                child: Text('Images', style: TextStyle(fontSize: 20, color: Colors.white)),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MediaImages()));
                },
                ),
            ),
              Container(
              padding: EdgeInsets.all(8.0),
              color: Colors.green,
              child: GestureDetector(
                child: Text('Links', style: TextStyle(fontSize: 20, color: Colors.white)),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MediaLinks()));
                },
                ),
            ),
          ],
        )
        
      );
     
  }
}

