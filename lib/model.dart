import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 0)
class Model extends HiveObject{
  @HiveField(0)
  String subject;
  @HiveField(1)
  String duration;
  // @HiveField(2)
  // String subtopic;
  // @HiveField(3)
  // String links;
  // @HiveField(4)
  // String images;

  Model({required this.subject, required this.duration});
}