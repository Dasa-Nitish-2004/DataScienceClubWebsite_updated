import 'package:ds_web/widgets/HomeScreen/ContactSvgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PersonProfile extends StatelessWidget {
  Map<String, String> person;
  PersonProfile({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 300,
          width: 270,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            // color: Colors.amber,
            image: DecorationImage(
                image: AssetImage(person["image"]!), fit: BoxFit.fill),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          right: 10,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.black.withOpacity(0.8),
            ),
            // width: 200,
            height: 100,
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${person["name"]}",
                  style: const TextStyle(color: Colors.white, letterSpacing: 2),
                ),
                Text(
                  "${person["role"]}",
                  style: const TextStyle(color: Colors.white, letterSpacing: 2),
                ),
                SizedBox(
                  height: 10,
                ),
                ContactSvgsRow(
                  details: person,
                ),
                // SizedBox(
                //   height: 5,
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
