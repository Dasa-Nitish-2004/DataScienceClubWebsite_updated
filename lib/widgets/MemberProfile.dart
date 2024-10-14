// import 'dart:js';

import 'package:ds_web/services/urlLaunching.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MemberProfile extends StatelessWidget {
  Map<String, String> member;
  MemberProfile({super.key, required this.member});

  List<Widget> _supportMemberView(double width, BuildContext context) {
    return [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(member["img"]!),
            radius: width > 1045 ? 100 : 50,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            member["role"]!,
            style: TextStyle(
                fontSize: width > 1045 ? 32 : 25, color: Colors.grey[700]),
          ),
        ],
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        height: width > 800 ? 200 : 1,
        color: Colors.black,
        width: width > 800 ? 1 : 200,
      ),
      Container(
        // color: Colors.amber,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // height: 150,
              width: 500,
              child: Text(
                member["caption"]!,
                style: width > 1000
                    ? Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: Colors.grey,
                        )
                    : Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: Colors.grey,
                        ),
              ),
            ),
            Container(
              height: 40,
              // width: double.infinity,
              alignment:
                  width > 1100 ? Alignment.centerRight : Alignment.center,
              child: Text(member["name"]!),
            ),
            Container(
              height: 40,
              // width: double.infinity,
              alignment:
                  width > 1100 ? Alignment.centerRight : Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      launch(member["linkedin"]!);
                    },
                    child: SvgPicture.asset(
                      "assets/svgs/linkedin.svg",
                      height: 15,
                      width: 15,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      launch(member["github"]!);
                    },
                    child: SvgPicture.asset(
                      "assets/svgs/github.svg",
                      height: 15,
                      width: 15,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      launch(member["instagram"]!);
                    },
                    child: SvgPicture.asset(
                      "assets/svgs/instagram.svg",
                      height: 15,
                      width: 15,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      launch(member["x"]!);
                    },
                    child: SvgPicture.asset(
                      "assets/svgs/X2.svg",
                      height: 15,
                      width: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; // 800 mobile view
    print(width);
    return width > 800
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _supportMemberView(width, context),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _supportMemberView(width, context),
          );
  }
}
