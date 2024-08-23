import 'package:flutter/material.dart';
import 'package:mind_forge/screens/on_boarding/logOrSign.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(image: DecorationImage(image:AssetImage('assets/images/premium_omega3.jpeg'),fit: BoxFit.cover )),
        child:Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(13,35,8,8),
              child: Text('WELCOME TO MIND FORGE  STUDY PLANNER ',
              textAlign: TextAlign.left,
              // style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,fontFamily:'Playfair Display'
              //   ),
              style:GoogleFonts.aBeeZee(fontSize: 30,fontWeight: FontWeight.w500) ,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(1,138,8,8),
              child: Container(
                child: Text('"Small steps, big goals Plan your path to academic success"',
                textAlign:TextAlign.left,
                style:TextStyle(fontSize: 20,)),
                height: MediaQuery.of(context).size.height*0.2,
                width: MediaQuery.of(context).size.width*0.7
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: 100,
            height: 100,
            child: FloatingActionButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LognSign()));
            },
            backgroundColor: Color.fromARGB(255, 5, 238, 129),
            shape: CircleBorder(),
            child: Text(
              'Start',
            style: TextStyle(
              fontSize: 26,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
            )
            ),
          ),
          
        ],
      ),
    );

  }
}
// fontWeight: FontWeight.w400