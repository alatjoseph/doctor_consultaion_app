import 'package:doctor_consultation/Constants/constant_list.dart';
import 'package:flutter/material.dart';

import 'category_page.dart';

class Departments extends StatelessWidget {
  const Departments({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            scrollDirection: Axis.vertical,
            itemCount: 6,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Categorypage(data: dept_name[index]),
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 97, 152, 247),
                      borderRadius: BorderRadius.circular(30)),

                  height: 127,
                  width: double.infinity,
                  child: SizedBox(
                      width: 10,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 10),
                            CircleAvatar(
                              backgroundImage: AssetImage(dept_img[index]),
                              radius: 55,
                            ),
                            const SizedBox(width: 50),
                            Padding(
                              padding: const EdgeInsets.only(right: 1),
                              child: Text(dept_name[index],
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 22.5,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      )),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
