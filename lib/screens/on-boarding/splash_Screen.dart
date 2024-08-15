import 'package:flutter/material.dart';
import 'package:mind_forge/screens/dashboard/home.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    gotoHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:GestureDetector(
          child: Image.asset(
            'assets/images/Screenshot 2024-07-06 123812 ed.png',
            height: 300,
            ),
            onTap:(){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const MyHome()));} ,
        ) ,
        ),
    );
  }
  Future<void> gotoHome()async{
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>MyHome()));
  }
  //  Future<void>checkUserLoggedIn()async{
  //   final _sharedPrefs=await SharedPreferences.getInstance();
  //   final _userLoggedIn= _sharedPrefs.getBool(SAVE_KEY_NAME);
  //   if(_userLoggedIn==null||_userLoggedIn==false){
      
  //   }
  // }
}