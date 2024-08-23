import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mind_forge/screens/timer/pomodoro_model.dart';
import 'package:mind_forge/services/models/model.dart';
import 'package:mind_forge/screens/on_boarding/splash_Screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

const SAVE_KEY_NAME='UserLoggedIn';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var directory=await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  await Hive.initFlutter();
   Hive.registerAdapter(ModelAdapter());
   Hive.registerAdapter(Model1Adapter());
   await Hive.openBox<Model>('subjects');
      await Hive.openBox<Model1>('profileDetails');

  runApp(
    MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=>PomodoroModel()),
      ChangeNotifierProvider(create: (_)=>SubtopicTimer()),
    ],
    child: MyApp()));
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



//------------------------------------------------------------------------------


