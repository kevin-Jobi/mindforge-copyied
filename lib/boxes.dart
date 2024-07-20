
import 'package:hive/hive.dart';
import 'package:mind_forge/model.dart';

class Boxes{
  static Box<Model> getData(){
    return Hive.box<Model>('subjects');
    } 
}