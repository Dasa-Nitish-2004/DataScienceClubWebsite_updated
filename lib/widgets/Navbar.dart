import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:go_router/go_router.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  List<bool> ishovered = [false, false, false, false, false];
  double height = 60;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      color: Color.fromRGBO(33, 37, 41, 1), // Keep AppBar color consistent
      child: width > 600
          ? Row(
              children: _supportNavbar(),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Add the logo on the left side
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/clublogo.png"),
                      ),
                    ),
                  ),
                ),
                // Hamburger icon on smaller screens
                IconButton(
                  icon: Icon(Icons.menu, color: Colors.white),
                  onPressed: () {
                    // setState(() {
                    //   height = 300;
                    // });
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ],
            ),
    );
  }

  List<Widget> _supportNavbar() {
    return [
      SizedBox(
        width: 20,
      ),
      Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage("assets/images/clublogo.png"),
          ),
        ),
      ),
      Spacer(),
      NavbarItem(0, "Home"),
      const SizedBox(width: 20), // Spacing to the right edge
      NavbarItem(1, "About_us"),
      const SizedBox(width: 20), // Spacing to the right edge
      NavbarItem(2, "Events"),
      const SizedBox(width: 20), // Spacing to the right edge
      NavbarItem(3, "Members"),
      const SizedBox(width: 20), // Spacing to the right edge
      NavbarItem(4, "Admin"),
      const SizedBox(width: 20), // Spacing to the right edge
    ];
  }

  Widget NavbarItem(int index, String itemName) {
    return TextButton(
      onHover: (value) {
        setState(() {
          ishovered[index] = value; // Set the hover state
        });
      },
      onPressed: () {
        String k = itemName;
        if (k == "Home") {
          k = "";
        }
        context.go("/${k}");
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            itemName,
            style: const TextStyle(color: Colors.white),
          ),
          Positioned(
            bottom: 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              color: Colors.white,
              height: ishovered[index] ? 2 : 0, // Underline height
              width: 40, // Fixed width for underline
            ),
          ),
        ],
      ),
    );
  }
}
