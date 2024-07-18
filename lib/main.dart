import 'package:flutter/material.dart';
import 'package:mind_forge/splash_Screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

const SAVE_KEY_NAME='UserLoggedIn';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var directory=await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}
// ------------------------------------------------------------------------------




// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Login Signup UI',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           CustomPaint(
//             size: Size.infinite,
//             painter: TrianglePainter(),
//           ),
//           GestureDetector(
//             onTapUp: (details) {
//               if (_isPointInTopLeftTriangle(details.localPosition, context)) {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => LoginScreen()),
//                 );
//               } else {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SignupScreen()),
//                 );
//               }
//             },
//           ),
//           // Texts
//           Align(
//             alignment: Alignment(-0.5, -0.5),
//             child: Text(
//               'Login ',
//               style: TextStyle(
//                 fontSize: 44,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment(0.5, 0.5),
//             child: Text(
//               'Sign Up',
//               style: TextStyle(
//                 fontSize: 44,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   bool _isPointInTopLeftTriangle(Offset point, BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return point.dy < size.height - (point.dx * size.height / size.width);
//   }
// }

// class LoginScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Login')),
//       body: Center(child: Text('Login Screen')),
//     );
//   }
// }

// class SignupScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Sign Up')),
//       body: Center(child: Text('Sign Up Screen')),
//     );
//   }
// }

// class TrianglePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint();

//     // Draw blue triangle
//     paint.color = Colors.orange;
//     final path1 = Path()
//       ..moveTo(0, 0)
//       ..lineTo(size.width, 0)
//       ..lineTo(0, size.height)
//       ..close();
//     canvas.drawPath(path1, paint);

//     // Draw green triangle
//     paint.color = Colors.green;
//     final path2 = Path()
//       ..moveTo(size.width, size.height)
//       ..lineTo(size.width, 0)
//       ..lineTo(0, size.height)
//       ..close();
//     canvas.drawPath(path2, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }






