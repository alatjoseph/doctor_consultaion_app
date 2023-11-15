import 'package:doctor_consultation/Screens/doctors.dart';
import 'package:doctor_consultation/Widgets/top_banner.dart';
import 'package:flutter/material.dart';
import '../Constants/constant_list.dart';
import '../Widgets/categorylist.dart';
import 'booking.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const TopBanner(),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Choose Categories',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 150,
              child: CategoryList(),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Top Doctors',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Doctors(),
                        ));
                      },
                      child: const Text('View All',
                          style: TextStyle(
                            fontSize: 15,
                          )))
                ],
              ),
            ),

//popular doctors list

            InkWell(
              child: Popular_Doctor(0),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Booking(
                        index: 0,
                      ); // Replace YourDestinationScreen with the screen you want to navigate to.
                    },
                  ),
                );
              },
            ),

            const SizedBox(
              height: 10,
            ),

            InkWell(
              child: Popular_Doctor(8),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Booking(
                        index: 8,
                      );
                    },
                  ),
                );
              },
            ),

            const SizedBox(
              height: 10,
            ),

            InkWell(
              child: Popular_Doctor(9),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Booking(
                        index: 9,
                      );
                    },
                  ),
                );
              },
            ),

            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Popular_Doctor(int index) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blueAccent, borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.only(left: 10, right: 10),
        height: 100,
        width: double.infinity,
        child: SizedBox(
            width: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(doc_img[index]),
                    radius: 37,
                  ),
                  title: Text(
                    doc_name[index],
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  subtitle: Text(
                    specialization[index],
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
