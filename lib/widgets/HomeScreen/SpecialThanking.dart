import 'package:ds_web/widgets/PersonsWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SpecialThanking extends StatelessWidget {
  SpecialThanking({super.key});

  List<Map<String, String>> details = [
    {
      "name": "Dr. Arathi",
      "role": "club Coordinator",
      "image": "assets/images/person.jpeg",
      "linkedin":
          "https://www.linkedin.com/company/data-science-student-club/posts/?feedView=all",
      "gmail": "dasanitish2004@gmail.com",
      "instagram":
          "https://www.instagram.com/datasciencestudentclubjntuh?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw=="
    },
    {
      "name": "Dr. Arathi",
      "role": "club Coordinator",
      "image": "assets/images/person.jpeg",
      "linkedin":
          "https://www.linkedin.com/company/data-science-student-club/posts/?feedView=all",
      "gmail": "mailto:dasanitish2004@gmail.com",
      "instagram":
          "https://www.instagram.com/datasciencestudentclubjntuh?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw=="
    },
    {
      "name": "Dr. Arathi",
      "role": "club Coordinator",
      "image": "assets/images/person.jpeg",
      "linkedin":
          "https://www.linkedin.com/company/data-science-student-club/posts/?feedView=all",
      "gmail": "dasanitish2004@gmail.com",
      "instagram":
          "https://www.instagram.com/datasciencestudentclubjntuh?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw=="
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: details
            .map(
              (person) => Container(
                margin: EdgeInsets.all(25),
                child: PersonProfile(person: person),
              ),
            )
            .toList(),
      ),
    );
  }
}
