import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateGenerator extends StatelessWidget {
   DateGenerator({super.key});
List datetimeList=[];
  @override
  Widget build(BuildContext context) {
    final List<DateTime> dateList = generateDateList();
     return ListView.builder(
      itemCount: dateList.length,
      itemBuilder: (context, index) {
        final date = dateList[index];
        final formattedDate = DateFormat('MMM d, yyyy').format(date);

        // return ListTile(
        //   title: Text(formattedDate),
        // );
      },
    );
  }
  List<DateTime> generateDateList() {
  final today = DateTime.now();
  final dateList = <DateTime>[];

  for (int i = 0; i < 7; i++) {
    final date = today.add(Duration(days: i));
    datetimeList.add(date);
  }

  return dateList;
}

}