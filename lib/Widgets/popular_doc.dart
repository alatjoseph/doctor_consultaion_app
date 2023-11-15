import 'package:doctor_consultation/Constants/constant_list.dart';
import 'package:doctor_consultation/Screens/doctors.dart';
import 'package:flutter/material.dart';

class Popular_Doctor extends StatelessWidget {
  const Popular_Doctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
              return Container(
                child: Text(doc_name[index]),
               // subtitle: Text(specialization[index]),
              );
            },)
          ],
        ),
      ),
    );
  }
}
