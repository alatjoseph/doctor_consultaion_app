// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookingModelAdapter extends TypeAdapter<BookingModel> {
  @override
  final int typeId = 1;

  @override
  BookingModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookingModel(
      id: fields[0] as int?,
      patientname: fields[1] as String,
      patientage: fields[2] as int,
      phno: fields[3] as String,
      gender: fields[4] as String,
      diagnosis: fields[5] as String,
      docname: fields[6] as String,
      docdpt: fields[7] as String,
      date: fields[8] as DateTime,
      time: fields[9] as String,
      index: fields[10] as int,
    );
  }

  @override
  void write(BinaryWriter writer, BookingModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.patientname)
      ..writeByte(2)
      ..write(obj.patientage)
      ..writeByte(3)
      ..write(obj.phno)
      ..writeByte(4)
      ..write(obj.gender)
      ..writeByte(5)
      ..write(obj.diagnosis)
      ..writeByte(6)
      ..write(obj.docname)
      ..writeByte(7)
      ..write(obj.docdpt)
      ..writeByte(8)
      ..write(obj.date)
      ..writeByte(9)
      ..write(obj.time)
      ..writeByte(10)
      ..write(obj.index);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookingModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
