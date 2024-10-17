import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  List<bool> ishovered = [false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 60,
      // color: Colors.transparent,
      color: Color.fromRGBO(33, 37, 41, 1), // Keep AppBar transparent
      // color: Colors.amber, // Keep AppBar transparent
      child: width > 600
          ? Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: _supportNavbar(),
            )
          : ListView(
              children: _supportNavbar(),
              scrollDirection: Axis.horizontal,
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
