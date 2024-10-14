import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Captions extends StatelessWidget {
  Map<String, String> data;
  Captions({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 250,
          width: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            // border: Border.all(width: 2),
          ),
          clipBehavior: Clip.antiAlias,
          child: Image.asset(
            data["img"]!,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          width: 1,
          height: 200,
          color: Colors.black,
        ),
        Column(
          children: [
            Container(
              width: 600,
              child: Text(
                data['title']!,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: Colors.grey[700], letterSpacing: 2),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 600,
              child: Text(
                data['subTitle']!,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.grey[700]),
              ),
            ),
          ],
        ),
      ],
    );
  }
}