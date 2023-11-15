import 'package:doctor_consultation/Screens/home.dart';
import 'package:flutter/material.dart';

class GetStart extends StatelessWidget {
  const GetStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset('lib/assets/get start.png'),
            const Text(
              '"Your path to better health starts here."',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(255, 8, 107, 188),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              
              child: ElevatedButton(
               style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
               ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  child: const Text(
                    'Get Started',
                    style: TextStyle(fontSize: 20),
                  )),
            )
          ],
        ),
      )),
    );
  }
}
