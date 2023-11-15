import 'package:flutter/material.dart';

import '../Constants/constant_list.dart';
import 'booking.dart';

class Categorypage extends StatelessWidget {
  String data;
  Categorypage({super.key, required this.data});
  //final list_of_dept_doctors=[];
   int? length;
   List<int> count=[];
  @override
  Widget build(BuildContext context) {
    
    if(data=='Cardiology')
    {
      length=cardio.length;
      count.addAll(cardio);
    }
     else if(data=='Neurology')
    {
      length=neuro.length;
      count.addAll(neuro);
    }
    else if(data=='Pediatrics')
    {
     length= pediatrics.length;
     count.addAll(pediatrics);
    }
    else if(data=='Orthopedics')
    {
     length= ortho.length;
     count.addAll(ortho);
    }
    
  else if(data=='Dentistry')
    {
     length= dental.length;
     count.addAll(dental);
    }
    else if(data=='Gastrology')
    {
     length= gastro.length;
     count.addAll(gastro);
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Department of $data'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 4),
            child:  Container(
              
          color: Colors.white,
          child: ListView.builder(
            itemCount: length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8, left: 8, top: 10),
                child: Card(
                  color: Colors.blueAccent,
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(doc_img[count[index]]),
                          radius: 50,
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              doc_name[count[index]],
                              //textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 21.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              specialization[count[index]],
                              style: const TextStyle(
                                fontSize: 17.0,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Booking(
                                    index: index,
                                  ),
                                ));
                              },
                              child: const Text('Book Appointment'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),),
    ),
    );
  }
}





