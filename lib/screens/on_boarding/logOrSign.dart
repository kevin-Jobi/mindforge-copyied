import 'package:flutter/material.dart';
import 'package:mind_forge/screens/on_boarding/login.dart';
import 'package:mind_forge/screens/on_boarding/signUp.dart';

class LognSign extends StatelessWidget {
  const LognSign({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(80.0),
              child: Text('MIND FORGE',
              style:TextStyle(
                color: Colors.white,
                fontSize: 33,
                fontWeight: FontWeight.w800,
                wordSpacing: 2
                )
                ),
                ),                          //MIND FORGE

                GestureDetector(
                   onTap: () {
                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login()));
                   },
                  child: CircleAvatar(maxRadius: 75,
                  backgroundColor:Colors.green,
                  child: Text('Login',
                  style: TextStyle(fontSize: 30,color:Colors.white,fontWeight: FontWeight.w900 )
                  )
                  ),
                ),                           // Login

                SizedBox(height: 20),

                GestureDetector(
                  onTap: () {
                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUp()));
                   },
                  child: CircleAvatar(maxRadius: 75,
                  backgroundColor:Color.fromARGB(255, 93, 169, 231),
                  child: Text('SignUp',
                  style: TextStyle(fontSize: 30,color:Colors.white,fontWeight: FontWeight.w900 )
                  )
                  ),
                )                            //SignUp
          ],
        ),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            stops: [.2,.5,.8,],
            colors: [
              Color.fromARGB(255, 86, 169, 89),
              Color.fromARGB(255, 96, 237, 136),
              Color.fromARGB(255, 236, 246, 246)
              
            ],
            begin: Alignment.topCenter,
            end:Alignment.bottomRight
            )
        ),
        
      ),
      
    );
  }
}