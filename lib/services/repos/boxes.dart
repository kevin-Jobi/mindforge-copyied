
import 'package:hive/hive.dart';
import 'package:mind_forge/services/models/model.dart';

class Boxes{
  static Box<Model> getData(){
    final a=Hive.box<Model>('subjects');
      return a;
    } 

    static Box<Model1> getData1(){
      final b=Hive.box<Model1>('profileDetails');
      return b;
    }
}



