import 'package:ds_web/screens/AboutUs.dart';
import 'package:ds_web/screens/AdminPage.dart';
import 'package:ds_web/screens/Events.dart';
import 'package:ds_web/screens/Home.dart';
import 'package:ds_web/screens/Members.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/About_us',
        builder: (context, state) => AboutPage(),
      ),
      GoRoute(
        path: '/Events',
        builder: (context, state) => EventsPage(),
      ),
      GoRoute(
        path: '/Members',
        builder: (context, state) => MembersPage(),
      ),
      GoRoute(
        path: '/Admin',
        builder: (context, state) => AdminPage(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router, // Step 2: Assign the GoRouter
      title: 'Data Science Club',
    );
  }
}
