import 'package:doctor_consultation/Constants/constant_list.dart';
import 'package:doctor_consultation/Database/db_model.dart';
import 'package:flutter/material.dart';


class BookingDetails extends StatefulWidget {
  final BookingModel data;
  const BookingDetails({required this.data}) : super();

  @override
  _BookingDetailsState createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  @override
  Widget build(BuildContext context) {
    final pname = widget.data.patientname;
    final page = widget.data.patientage;
    final phn = widget.data.phno;
    final gender = widget.data.gender;
    final diagnosis = widget.data.diagnosis;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Booking Details',
          style: TextStyle(fontSize: 22),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 60,
              backgroundImage: AssetImage(doc_img[widget.data.index]),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    doc_name[widget.data.index],
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    specialization[widget.data.index],
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Patient Details",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                  

                      patient_details('Name      :', pname,context),
                      const SizedBox(
                        height: 15,
                      ),
                      patient_details('Age         :', page,context),
                      const SizedBox(
                        height: 15,
                      ),
                      patient_details('Phone     :', phn,context),
                      const SizedBox(
                        height: 15,
                      ),
                      patient_details('Gender   :', gender,context),
                      const SizedBox(
                        height: 15,
                      ),
                      //  patient_details('Diagnosis        :', date,context),
                      // const SizedBox(
                      //   height: 15,
                      // ),
                       patient_details('Diagnosis :', diagnosis,context),
                      const SizedBox(
                        height: 15,
                      ),
                    
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.blueAccent,
    );
  }
}

// ignore: non_constant_identifier_names
Widget patient_details(var data1, var data2,BuildContext ctx) {
  return Padding(
    padding: const EdgeInsets.only(right: 8,left: 8),
    child: Container(
      decoration: BoxDecoration(color: Colors.blueAccent ,borderRadius: BorderRadius.circular(20)),
      child: Row(
       //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
       SizedBox(width: MediaQuery.of(ctx).size.width/4,),
          Text(
            data1,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 20,
          ),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              data2.toString(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ),
  );
}
