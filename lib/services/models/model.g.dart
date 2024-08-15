// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelAdapter extends TypeAdapter<Model> {
  @override
  final int typeId = 0;

  @override
  Model read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Model(
      subject: fields[0] as String,
      duration: fields[1] as String,
      subtopic: (fields[2] as List).cast<String>(),
      links: (fields[3] as List).cast<String>(),
      images: (fields[4] as List).cast<Uint8List>(),
      assignments: (fields[5] as List).cast<String>(),
      exams: (fields[6] as List).cast<String>(),
      assignmentDeadlines: (fields[7] as List?)?.cast<String>(),
      assignmentDescriptions: (fields[8] as List).cast<String>(),
      examDates: (fields[9] as List).cast<String>(),
      examDescriptions: (fields[10] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Model obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.subject)
      ..writeByte(1)
      ..write(obj.duration)
      ..writeByte(2)
      ..write(obj.subtopic)
      ..writeByte(3)
      ..write(obj.links)
      ..writeByte(4)
      ..write(obj.images)
      ..writeByte(5)
      ..write(obj.assignments)
      ..writeByte(6)
      ..write(obj.exams)
      ..writeByte(7)
      ..write(obj.assignmentDeadlines)
      ..writeByte(8)
      ..write(obj.assignmentDescriptions)
      ..writeByte(9)
      ..write(obj.examDates)
      ..writeByte(10)
      ..write(obj.examDescriptions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class Model1Adapter extends TypeAdapter<Model1> {
  @override
  final int typeId = 1;

  @override
  Model1 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Model1(
      name: fields[0] as String,
      profileImg: fields[1] as Uint8List,
    );
  }

  @override
  void write(BinaryWriter writer, Model1 obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.profileImg);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Model1Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
