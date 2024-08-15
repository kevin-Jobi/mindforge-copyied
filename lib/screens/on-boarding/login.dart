import 'package:flutter/material.dart';
import 'package:mind_forge/screens/dashboard/home.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding:EdgeInsets.all(18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50,),

                 Text('Login',
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
                ),    
                SizedBox(height: 40,),                  //Login
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
                            labelText: 'UserName',
                            hintText:'Enter Username' 
                            )
                        ),
                      ),
                      SizedBox(height: 20,),
                         Container(
                        width: 400,
                        height: 50,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: 'Password',
                            hintText:'Enter Password' 
                            )
                        ),
                        
                      ),

                          SizedBox(height: 30,),

                      GestureDetector(
                  onTap: () {
                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyHome()));
                   },
                  child: CircleAvatar(maxRadius: 60,
                  backgroundColor:Colors.green,
                  child: Text('Login',
                  style: TextStyle(fontSize: 30,color:Colors.white,fontWeight: FontWeight.w900 )
                  )
                  ),
                ),

                  SizedBox(height: 60,),

                Text('Or Sign Up Using '),
                Text('SignUp',style: TextStyle(fontSize: 16,color: Color.fromARGB(255, 209, 85, 76),fontWeight: FontWeight.bold),)
                
              ],
            ),
             ),
        ),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 236, 246, 246),
             Color.fromARGB(255, 96, 237, 136),
             Color.fromARGB(255, 86, 169, 89),
          ])
        ),
      )
    );

  }
}