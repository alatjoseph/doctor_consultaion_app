import 'package:doctor_consultation/Screens/home.dart';
import 'package:flutter/material.dart';

class BottomNavigstionWidget extends StatefulWidget {
  const BottomNavigstionWidget({super.key});

  @override
  State<BottomNavigstionWidget> createState() => _BottomNavigstionWidgetState();
}

class _BottomNavigstionWidgetState extends State<BottomNavigstionWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: HomePage.homescreenNotifier,
        builder: (BuildContext ctx, updatedIndex, Widget? _) {
          return BottomNavigationBar(
            currentIndex: updatedIndex,
            onTap: (value) {
              HomePage.homescreenNotifier.value = value;
            },
            backgroundColor: Colors.grey[200],
            elevation: 1,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 25,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.man,
                  size: 25,
                ),
                label: 'Doctors',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(
              //     Icons.group,
              //     size: 25,
              //   ),
              //   label: 'Departments',
              // ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.calendar_month,
                  size: 25,
                ),
                label: 'Appoinments',
              ),
            ],
            unselectedLabelStyle: const TextStyle(fontSize: 15),
            selectedLabelStyle: const TextStyle(fontSize: 15),
          );
        });
  }
}
