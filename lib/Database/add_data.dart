import 'package:doctor_consultation/Database/db_model.dart';
import 'package:doctor_consultation/Screens/appoinment.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<BookingModel>> booking_details = ValueNotifier([]);

//Function to add the details of booking to database

Future<void> add_db(BookingModel data) async {
  // ignore: non_constant_identifier_names
  final AppoinmentDetailsDB = await Hive.openBox<BookingModel>('Booking_db');
  final _id=await AppoinmentDetailsDB.add(data);
  
  data.id=_id;
print(data.id);
  booking_details.value.add(data);
  booking_details.notifyListeners();
}

Future<void> getdb() async {
  final AppoinmentDetailsDB = await Hive.openBox<BookingModel>('Booking_db');
  booking_details.value.clear();
  booking_details.value.addAll(AppoinmentDetailsDB.values);
  booking_details.notifyListeners();
}


Future<void> delete_db(int id)async
{
  // ignore: non_constant_identifier_names
  
  final AppoinmentDetailsDB= await Hive.openBox<BookingModel>('Booking_db');
    AppoinmentDetailsDB.delete(id);
    await getdb();
   // booking_details.notifyListeners();
    
}