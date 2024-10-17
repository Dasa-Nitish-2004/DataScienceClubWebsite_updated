import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ModernDropdownDrawer extends StatefulWidget {
  @override
  _ModernDropdownDrawerState createState() => _ModernDropdownDrawerState();
}

class _ModernDropdownDrawerState extends State<ModernDropdownDrawer> {
  String? selectedValue;

  final List<String> dropdownItems = [
    "Home",
    "About_us",
    "Events",
    "Members",
    "Admin",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200], // Background color for modern look
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Container(
          width: 160,
          child: ExpansionTile(
            title: Text(
              selectedValue ?? "Select",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            children: dropdownItems.map((String item) {
              return ListTile(
                title: Text(
                  item,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  setState(() {
                    selectedValue = item;
                    context.go("/${item}");
                  }); // Close the dropdown when item is selected
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
