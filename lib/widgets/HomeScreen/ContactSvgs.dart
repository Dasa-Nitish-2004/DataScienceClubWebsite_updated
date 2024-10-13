import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ds_web/services/urlLaunching.dart' as launch;
import 'package:http/http.dart' as http;

class ContactSvgsRow extends StatelessWidget {
  Map<String, String> details;
  ContactSvgsRow({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
          onPressed: () {
            launch.launch(details["linkedin"]!);
          },
          child: SvgPicture.asset(
            'assets/svgs/linkedin.svg',
            width: 15.0,
            height: 15.0,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        TextButton(
          onPressed: () {
            launch.launch(details["gmail"]!);
          },
          child: SvgPicture.asset(
            'assets/svgs/gmail.svg',
            width: 15.0,
            height: 15.0,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        TextButton(
          onPressed: () {
            launch.launch(details["instagram"]!);
          },
          child: SvgPicture.asset(
            'assets/svgs/instagram.svg',
            width: 15.0,
            height: 15.0,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
