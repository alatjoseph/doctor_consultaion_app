import 'package:doctor_consultation/Screens/doctors.dart';
import 'package:doctor_consultation/Screens/departments.dart';
import 'package:doctor_consultation/Screens/welcomepg.dart';
import 'package:doctor_consultation/Widgets/btm_nav.dart';
import 'package:flutter/material.dart';
import 'appoinment.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static ValueNotifier<int> homescreenNotifier = ValueNotifier(0);

  final pages = const [
    Welcome(),
    Doctors(),
    //Departments(),
    Appoinment(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: const BottomNavigstionWidget(),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: HomePage.homescreenNotifier,
          builder: (BuildContext context, int value, Widget? _) {
            return pages[value];
          },
        ),
      ),
    );
  }
}
