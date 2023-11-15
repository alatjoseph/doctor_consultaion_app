import 'package:doctor_consultation/Database/db_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Constants/constant_list.dart';
import '../Database/add_data.dart';

// ignore: must_be_immutable
class PatientDetailsPage extends StatefulWidget {
  String time;
  int index;
  DateTime date;
  PatientDetailsPage(
      {super.key, required this.time, required this.index, required this.date});

  @override
  // ignore: library_private_types_in_public_api
  _PatientDetailsPageState createState() => _PatientDetailsPageState();
}

class _PatientDetailsPageState extends State<PatientDetailsPage> {
  String name = '';
  int age = 0;
  String phone = '';
  String gender = 'Male'; // You can provide gender options
  String diagnosis = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Details'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Enter Patient's Details..",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent, width: 2),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    decoration: const InputDecoration(
                        hintText: 'Name', border: InputBorder.none),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent, width: 2),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        age = int.tryParse(value) ?? 0;
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: 'Age', border: InputBorder.none),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent, width: 2),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        phone = value;
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Phone Number',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent, width: 2),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<String>(
                    value: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value!;
                      });
                    },
                    items: ['Male', 'Female', 'Other'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      hintText: 'Gender',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent, width: 2),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        diagnosis = value;
                      });
                    },
                    maxLines: 3,
                    decoration: const InputDecoration(
                        hintText: 'Diagnosis', border: InputBorder.none),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                color: Colors.blueAccent,
                height: MediaQuery.of(context).size.width / 10,
                width: MediaQuery.of(context).size.width / 2,
                child: TextButton(
                  
                  onPressed: () {
                    // Save patient details or perform an action
                    String date =
                        DateFormat('dd - MMM - yyyy').format(widget.date);
                    var data = BookingModel(
                        patientname: name,
                        patientage: age,
                        phno: phone,
                        gender: gender,
                        diagnosis: diagnosis,
                        docname: doc_name[widget.index],
                        docdpt: specialization[widget.index],
                        date: widget.date,
                        time: widget.time,
                        index: widget.index);

                    //Adding data to the database(list)

                    add_db(data);

                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white,fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
