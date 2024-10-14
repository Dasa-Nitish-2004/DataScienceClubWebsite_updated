import 'package:ds_web/widgets/Navbar.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return SingleChildScrollView(
      child: Column(
        children: [
          Navbar(),
        ],
      ),
    );
  }
}
