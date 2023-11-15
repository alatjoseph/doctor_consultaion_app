import 'package:doctor_consultation/Constants/constant_list.dart';
import 'package:doctor_consultation/Screens/patient_details.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class Booking extends StatefulWidget {
  int index;

  Booking({super.key, required this.index});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  List<String> timeSlots = [
    "10.00 AM",
    "10.30 AM",
    "11.00 AM",
    "11.30 AM",
    "12.00 PM",
    "12.30 PM",
    "1.00 PM",
    "4.00 PM",
    "4.30 PM",
    "5.00 PM",
    "5.30 PM",
    "6.00 PM",
  ];

  List<bool> listOfBooleans = List.generate(12, (index) => false);

  // ignore: non_constant_identifier_names
  DateTime selected_date = DateTime.now();
  String time = '';
  // ignore: non_constant_identifier_names
  String Selectedtime = '';
  // ignore: non_constant_identifier_names
  Color default_clr = Colors.orange;
  // ignore: non_constant_identifier_names
  Color onPressed_clr = Colors.green;
  int previndex = 0;
 final date='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Doctor Details',
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 70,
              backgroundImage: AssetImage(doc_img[widget.index]),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    doc_name[widget.index],
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    specialization[widget.index],
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Select Date',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .9,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.blueAccent, width: 2),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      DateFormat('dd - MMM - yyyy')
                                          .format(selected_date),
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueAccent),
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.calendar_month,
                                        color: Colors.blueAccent,
                                        size: 30,
                                      ),
                                      onPressed: () async {
                                        final DateTime? newdate =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2000),
                                                lastDate: DateTime(2025));
                                        setState(() {
                                          if (newdate != null) {
                                            selected_date = newdate;
                                            final date=DateFormat('dd - MMM - yyyy').format(selected_date);
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Select Time',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 1),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(listOfBooleans.length,
                                      (index) {
                                    return TimeContainer(
                                        timeSlots[index],
                                        default_clr,
                                        onPressed_clr,
                                        listOfBooleans[index],
                                        index);
                                  }),
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              InkWell(
                                onTap: () {
                                  print(selected_date);
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => PatientDetailsPage(
                                      date: selected_date,
                                      index: widget.index,
                                      time: Selectedtime,
                                    ),
                                  ));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  height: 50,
                                  width: MediaQuery.of(context).size.width * .8,
                                  child: const Center(
                                      child: Text(
                                    'Book the slot',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              )
                            ],
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.blueAccent,
    );
  }

  Widget TimeContainer(
    String time,
    Color defaultClr,
    Color onpressedClr,
    bool ispressed,
    int index,
  ) {
    return GestureDetector(
      //onSecondaryTap: () => listOfBooleans[index] = !listOfBooleans[index],
      onTap: () {
        setState(() {
          Selectedtime = time;

          listOfBooleans[index] = !listOfBooleans[index];

          if (previndex != index) {
            listOfBooleans[0] = false;
            listOfBooleans[previndex] = !listOfBooleans[previndex];
          }

          //currentIndex = index;
          previndex = index;
        });
      },
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.width / 10,
            width: MediaQuery.of(context).size.width / 4.5,
            decoration: BoxDecoration(
              color: listOfBooleans[index] ? onpressedClr : defaultClr,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                time,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
