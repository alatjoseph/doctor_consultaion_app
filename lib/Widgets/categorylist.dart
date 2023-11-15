import 'package:doctor_consultation/Constants/constant_list.dart';
import 'package:flutter/material.dart';

import '../Screens/category_page.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
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
                color: const Color.fromARGB(183, 168, 166, 159),
                borderRadius: BorderRadius.circular(30)),
            margin: const EdgeInsets.only(left: 10, right: 10),
            width: MediaQuery.of(context).size.width/2.8,
            child: SizedBox(
                width: 10,
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      CircleAvatar(
                        backgroundImage: AssetImage(dept_img[index]),
                        radius: 50,
                      ),
                      Text(dept_name[index],
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                )),
          ),
        );
      },
    );
  }
}
