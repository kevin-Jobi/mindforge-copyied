

import 'package:flutter/material.dart';
import 'package:mind_forge/login.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(18.0),
            child: Column(
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  SizedBox(height: 30,),
                Text('Register',
                style: TextStyle(
                  fontSize: 49,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                  Shadow(
                    offset: Offset(2, 1),
                    blurRadius: 3.0,
                    color: Color.fromARGB(255, 0, 0, 0)
                  )
                ]
                ),
                ),                            //Register
                    CircleAvatar(
                      backgroundImage:AssetImage('assets/images/Ellipse 1.png'),
                      maxRadius: 40,
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: 400,
                        height: 50,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border:OutlineInputBorder(
                            
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 4
                            ),
                            ),
                            hintText:'Name' 
                            )
                        ),
                      ),
                      
                      SizedBox(height: 10,),
                       Container(
                        width: 400,
                        height: 50,
                         child: TextFormField(
                          decoration: InputDecoration(
                            border:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 4
                            )
                          ),
                          hintText: 'Email'
                          )
                                               ),
                       ), 
                      SizedBox(height: 10,),
                      Container(
                        width: 400,
                        height: 50,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 4
                            )
                          ),
                          hintText: 'Password'
                          )
                        ),
                      ), 
                      SizedBox(height: 10,),

                      Container(
                        width: 400,
                        height: 50,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 4
                            )
                          ),
                          hintText: 'Confirm Password'
                          )
                        ),
                      ),
                      
                        SizedBox(height: 30,),

                       GestureDetector(
                  onTap: () {
                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login()));
                   },
                  child: CircleAvatar(maxRadius: 60,
                  backgroundColor:Color.fromARGB(255, 93, 169, 231),
                  child: Text('SignUp',
                  style: TextStyle(fontSize: 30,color:Colors.white,fontWeight: FontWeight.w900 )
                  )
                  ),
                ),                     //SignUp button
                Text('Already have account?'),
                Text('Login',style: TextStyle(fontSize: 16,color: Color.fromARGB(255, 209, 85, 76),fontWeight: FontWeight.bold),)
                  
              ],
            ),
          ),
        ),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            stops: [.2,.5,.8],
            colors: [
            Color.fromARGB(255, 236, 246, 246),
             Color.fromARGB(255, 96, 237, 136),
             Color.fromARGB(255, 86, 169, 89),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
          )
        ),
      )
    );
  }
}