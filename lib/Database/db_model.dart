import 'package:hive_flutter/hive_flutter.dart';
part'db_model.g.dart';
@HiveType(typeId: 1)
class BookingModel {
  @HiveField(0)
  int ? id;

  @HiveField(1)
  String patientname;

  @HiveField(2)
  int patientage;

  @HiveField(3)
  String phno;

  @HiveField(4)
  String gender;

  @HiveField(5)
  String diagnosis;

  @HiveField(6)
  String docname;

  @HiveField(7)
  String docdpt;

  @HiveField(8)
  DateTime date;

  @HiveField(9)
  String time;

  @HiveField(10)
  int index;

  BookingModel(
      {this.id,
      required this.patientname,
      required this.patientage,
      required this.phno,
      required this.gender,
      required this.diagnosis,
      required this.docname,
      required this.docdpt,
      required this.date,
      required this.time,
      required this.index});

  get age => null;

  get phoneNumber => null;

  get doctorName => null;

  get department => null;
}
