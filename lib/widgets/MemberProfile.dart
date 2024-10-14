import 'package:ds_web/services/urlLaunching.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MemberProfile extends StatelessWidget {
  Map<String, String> member;
  MemberProfile({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(member["img"]!),
              radius: 100,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              member["role"]!,
              style: TextStyle(fontSize: 32, color: Colors.grey[700]),
            ),
          ],
        ),
        Container(
          height: 200,
          color: Colors.black,
          width: 1,
        ),
        Container(
          width: 800,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  member["caption"]!,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Colors.grey,
                      ),
                ),
              ),
              Container(
                height: 40,
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: Text(member["name"]!),
              ),
              Container(
                height: 40,
                width: double.infinity,
                alignment: Alignment.centerRight,
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
      ],
    );
  }
}
