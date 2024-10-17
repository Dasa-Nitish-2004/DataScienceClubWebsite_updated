import 'package:ds_web/widgets/Navbar.dart';
import 'package:ds_web/widgets/animaterImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ds_web/services/urlLaunching.dart' as launch;

class AboutPage extends StatelessWidget {
  List<Widget> _supportWhoWeAre() {
    return [
      const Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Who We Are",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "We are a community of data science enthusiasts"
              "committed to fostering a space where students can "
              "explore, learn, and innovate. Our mission is to "
              "equip future data scientists with the skills needed "
              "to excel in this fast-evolving field.\n\n\n"
              "Data Science Student Club aims to provide a platform for students interested in data science to enhance their skills, collaborate on projects, in this rapidly evolving field. The club aims to organize a series of events and activities throughout the academic year that will contribute to the intellectual and professional growth of its members. ",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      SizedBox(width: 20),
      Expanded(
        child: Img(
          path: 'assets/images/groupPhoto.jpeg',
          height: 400,
          width: 0,
        ),
      ),
    ];
  }

  List<Widget> _supportFeatures() {
    return [
      _buildFeature(
        icon: Icons.school,
        title: "Hands-on Workshops",
        description: "Interactive learning experiences.",
      ),
      _buildFeature(
        icon: Icons.people,
        title: "Industry Connections",
        description: "Network with experts.",
      ),
      _buildFeature(
        icon: Icons.computer,
        title: "Real-World Projects",
        description: "Work on practical projects.",
      ),
      _buildFeature(
        icon: Icons.group,
        title: "Interactive Discussions",
        description: "Engage in meaningful conversations.",
      ),
    ];
  }

  // Helper function to build a feature card
  Widget _buildFeature(
      {required IconData icon,
      required String title,
      required String description}) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.grey),
        SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  // Helper function to build a testimonial card
  Widget _buildTestimonialCard(
      {required String avatarUrl,
      required String name,
      required String feedback}) {
    return Container(
      width: 300,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5),
        ],
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(avatarUrl),
                radius: 30,
              ),
              SizedBox(width: 20),
              Text(
                name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(feedback, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Navbar(),
              // Hero Section
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(40),
                color: Colors.black26,
                child: const Column(
                  children: [
                    Text(
                      "Welcome to the Future of Data Science",
                      style: TextStyle(
                        fontSize: 32,
                        // fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Empowering Tomorrow's Data Leaders",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),

              // Who We Are Section
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: width > 840
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _supportWhoWeAre(),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Who We Are",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20),
                              const Text(
                                "We are a community of data science enthusiasts"
                                "committed to fostering a space where students can "
                                "explore, learn, and innovate. Our mission is to "
                                "equip future data scientists with the skills needed "
                                "to excel in this fast-evolving field.\n\n\n"
                                "Data Science Student Club aims to provide a platform for students interested in data science to enhance their skills, collaborate on projects, in this rapidly evolving field. The club aims to organize a series of events and activities throughout the academic year that will contribute to the intellectual and professional growth of its members. ",
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 30),
                              Img(
                                path: 'assets/images/groupPhoto.jpeg',
                                height: 400,
                                width: 0,
                              ),
                            ],
                          ),
                        ],
                      ),
              ),
              // Some of the planned events for the club include:
              // 1. Workshops and Seminars
              // 2.Hackathons and Data Competitions
              // 3. Guest Lectures
              // 4. Project Showcases
              // 5. Training Sessions

              // Features Section
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Why Join Us",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40),
                    width > 840
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: _supportFeatures(),
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: _supportFeatures(),
                          ),
                  ],
                ),
              ),

              // Testimonials Section

              // Footer
              Container(
                color: Colors.black87,
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      "© 2024 Data Science Student Club",
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "follow us on",
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            launch.launch("url");
                          },
                          child: SvgPicture.asset(
                            height: 15,
                            width: 15,
                            "assets/svgs/X2.svg",
                            color: Colors.white,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            launch.launch("url");
                          },
                          child: SvgPicture.asset(
                            height: 15,
                            width: 15,
                            "assets/svgs/whatsapp.svg",
                            color: Colors.white,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            launch.launch("url");
                          },
                          child: SvgPicture.asset(
                            height: 15,
                            width: 15,
                            "assets/svgs/instagram.svg",
                            color: Colors.white,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            launch.launch("url");
                          },
                          child: SvgPicture.asset(
                            height: 15,
                            width: 15,
                            "assets/svgs/linkedin.svg",
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
