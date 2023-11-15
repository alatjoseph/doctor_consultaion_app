import 'package:doctor_consultation/Database/add_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Constants/constant_list.dart';
import 'booking_details.dart';

class Appoinment extends StatelessWidget {
  const Appoinment({super.key});

  @override
  Widget build(BuildContext context) {
     getdb();
    return ValueListenableBuilder(
      valueListenable: booking_details,
      builder: (context, value, child) {
        return ListView.builder(
          itemCount: booking_details.value.length,
          itemBuilder: (context, index) {
            final data = booking_details.value[index];
            final imgIndx = data.index;
            final date  =  DateFormat('dd - MMM - yyyy').format(data.date).toString();
            final time=data.time;
            return Padding(
              padding: const EdgeInsets.only(
                  right: 14, left: 14, bottom: 14, top: 9),
              child: Container(
                height: MediaQuery.of(context).size.height / 3.5,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(doc_img[imgIndx]),
                            radius: 45,
                          ),
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              width: 24,
                              height: 20,
                            ),
                            Text(
                              data.docname,
                              style: const TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              data.docdpt,
                              style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Date : $date",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 255, 217, 3))
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                             Text(
                              "Time : $time",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color:Color.fromARGB(255, 255, 217, 3)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                
                                Container(
                                    decoration: BoxDecoration(
                                        color:
                                            Colors.red,
                                        borderRadius: BorderRadius.circular(20)),
                                    height: 30,
                                    child: TextButton(
                                      onPressed: () {
                                        if(data.id!=null)
                                        {
                                           delete_db(data.id!);
                                        }
                                       else{
                                        print('Not able to delete');
                                       }
                                      }, 
                                      child: const Text(
                                        'Cancel Slot',
                                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                      ),
                                    )),
                                      const SizedBox(width: 20,),
                                    Container(
                                    decoration: BoxDecoration(
                                        color:
                                            const Color.fromARGB(255, 255, 217, 3),
                                        borderRadius: BorderRadius.circular(20)),
                                    height: 30,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => BookingDetails(
                                            data: data,
                                          ),
                                        ));
                                      },
                                      child: const Text(
                                        'View Details',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    )),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
