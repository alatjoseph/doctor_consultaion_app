import 'package:doctor_consultation/Database/db_model.dart';
import 'package:doctor_consultation/Screens/get_Start.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(BookingModelAdapter().typeId))
  {
      Hive.registerAdapter(BookingModelAdapter());
  }
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GetStart(),
    );
  }
}
