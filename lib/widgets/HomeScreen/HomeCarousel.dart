import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  List imgList = [
    [
      "assets/images/c1.png",
      "Data science isn’t just a skill;\nit’s a superpower!",
      Alignment.centerLeft
    ],
    [
      "assets/images/c2.jpeg",
      "Discovering patterns,\npredicting trends.",
      Alignment.center
    ],
    [
      "assets/images/c3.jpeg",
      "Shaping tomorrow’s world\nwith today’s data.",
      Alignment.centerRight
    ]
  ];

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          CarouselSlider(
            items: imgList
                .map(
                  (item) => Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Image.asset(
                          item[0],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.black.withOpacity(0.7),
                        alignment: item[2],
                        padding: EdgeInsets.all(50),
                        child: Text(
                          item[1],
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                color: Colors.white,
                                letterSpacing: 2,
                                // fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
            options: CarouselOptions(
              height: 400,
              viewportFraction: 1, // Ensures the slides take full width
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 5),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.ease,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      );
}
