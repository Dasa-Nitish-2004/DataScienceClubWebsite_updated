import 'package:ds_web/widgets/HomeScreen/AnimatedInfo.dart';
import 'package:ds_web/widgets/HomeScreen/Captions.dart';
import 'package:ds_web/widgets/HomeScreen/HomeCarousel.dart';
import 'package:ds_web/widgets/Navbar.dart';
import 'package:ds_web/widgets/HomeScreen/SpecialThanking.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  List<Widget> detailsWidget = [];
  List<Map<String, String>> details = [
    {
      "title": "Predict the Future with Data Science.",
      "subTitle":
          "Step ahead with predictive models that anticipate trends, understand behaviors, and optimize outcomes across industries.",
      "img": "assets/images/img1.jpg"
    },
    {
      "title": "Advanced Analytics for Smarter Decisions.",
      "subTitle":
          "Turn complexity into clarity. Our advanced analytics solutions help you navigate data with precision and confidence.",
      "img": "assets/images/img2.jpg"
    },
    {
      "title": "Empowering Businesses Through Data.",
      "subTitle":
          "Equip your organization with data-driven strategies that increase efficiency, boost performance, and create lasting impact.",
      "img": "assets/images/img3.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    populate();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Navbar(),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Carousel(),
              ),
              const SizedBox(height: 50),
              const Divider(
                height: 1,
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(height: 50),
              ...detailsWidget,
              const SizedBox(height: 50),
              Text(
                "Special Thanking",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Colors.grey[700],
                    ),
              ),
              const SizedBox(height: 50),
              SpecialThanking(),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  void populate() {
    int index = 0;
    for (final item in details) {
      detailsWidget.add(CkSlideTransition(
          index: index,
          child: Captions(
            data: details[index],
          )));
      detailsWidget.add(const SizedBox(
        height: 50,
      ));
      detailsWidget.add(const Divider(
        height: 1,
        indent: 20,
        endIndent: 20,
      ));
      detailsWidget.add(const SizedBox(
        height: 50,
      ));
      index++;
    }
  }
}
