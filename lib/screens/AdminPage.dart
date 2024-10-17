import 'package:ds_web/widgets/HomeScreen/AnimatedInfo.dart';
import 'package:ds_web/widgets/Navbar.dart';
import 'package:ds_web/widgets/SignInWidget.dart';
import 'package:ds_web/widgets/adminContent.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Widget child = const SizedBox();
    User? islogin = auth.currentUser;
    if (islogin == null) {
      child = CkSlideTransition(index: 0, child: SignInWidget());
    } else {
      return AdminContent();
    }
    // _signoutuser();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Navbar(),
              // Spacer(),
              Container(
                child: child,
                margin: EdgeInsets.all(30),
              ),
              // Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
