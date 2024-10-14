import 'package:ds_web/widgets/HomeScreen/AnimatedInfo.dart';
import 'package:ds_web/widgets/MemberProfile.dart';
import 'package:ds_web/widgets/Navbar.dart';
import 'package:flutter/material.dart';

class MembersPage extends StatelessWidget {
  MembersPage({super.key});
  List<Widget> membersWidgets = [];

  List<Map<String, String>> members = [
    {
      "name": "~Dongari Sri Kashyap",
      "role": "Team head",
      "caption": "\"Your data, our expertise—unleashing potential.\"",
      "img": "assets/images/malePerson.png",
      "linkedin": "https://www.linkedin.com/in/dongari-sri-kashyap-549760249/",
      "github": "https://github.com/Dasa-Nitish-2004",
      "instagram":
          "https://www.instagram.com/datasciencestudentclubjntuh?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
      "x": ""
    },
    {
      "name": "~Nandini Maharaj",
      "role": "Team head",
      "caption": '"Data science isn’t just a skill; it’s a superpower!"',
      "img": "assets/images/person.jpeg",
      "linkedin": "https://www.linkedin.com/in/dongari-sri-kashyap-549760249/",
      "github": "https://github.com/Dasa-Nitish-2004",
      "instagram":
          "https://www.instagram.com/datasciencestudentclubjntuh?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
      "x": ""
    },
    {
      "name": "~Surepally Bhavani",
      "role": "Team head",
      "caption": '"Transforming chaos into clarity through data."',
      "img": "assets/images/person.jpeg",
      "linkedin": "https://www.linkedin.com/in/dongari-sri-kashyap-549760249/",
      "github": "https://github.com/Dasa-Nitish-2004",
      "instagram":
          "https://www.instagram.com/datasciencestudentclubjntuh?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
      "x": ""
    },
    {
      "name": "~Rohith Kiran",
      "role": "Content Creator",
      "caption": '"Behind every great decision is a dataset."',
      "img": "assets/images/rohitKiran.jpg",
      "linkedin": "https://www.linkedin.com/in/dongari-sri-kashyap-549760249/",
      "github": "https://github.com/Dasa-Nitish-2004",
      "instagram":
          "https://www.instagram.com/datasciencestudentclubjntuh?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
      "x": ""
    },
    {
      "name": "~Jeevin Chelleka",
      "role": "Developer",
      "caption": '"Shaping tomorrow’s world with today’s data."',
      "img": "assets/images/jeevin.jpg",
      "linkedin": "https://www.linkedin.com/in/dongari-sri-kashyap-549760249/",
      "github": "https://github.com/Dasa-Nitish-2004",
      "instagram":
          "https://www.instagram.com/datasciencestudentclubjntuh?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
      "x": ""
    },
  ];
  @override
  Widget build(BuildContext context) {
    _populateMembers();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Navbar(), ...membersWidgets],
        ),
      ),
    );
  }

  void _populateMembers() {
    membersWidgets.add(const SizedBox(
      height: 50,
    ));
    for (int i = 0; i < members.length; i++) {
      membersWidgets.add(CkSlideTransition(
          index: i, child: MemberProfile(member: members[i])));
      membersWidgets.add(const SizedBox(
        height: 50,
      ));
      membersWidgets.add(const Divider(
        height: 1,
        indent: 20,
        endIndent: 20,
      ));
      membersWidgets.add(const SizedBox(
        height: 50,
      ));
    }
  }
}
