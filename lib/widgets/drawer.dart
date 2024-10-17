import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Drawer openedDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.black45,
          ),
          child: Text('Menu'),
        ),
        ListTile(
          title: Text('Home'),
          onTap: () {
            context.go('/');
          },
        ),
        ListTile(
          title: Text('About_us'),
          onTap: () {
            context.go('/About_us');
          },
        ),
        ListTile(
          title: Text('Events'),
          onTap: () {
            context.go('/Events');
          },
        ),
        ListTile(
          title: Text('Members'),
          onTap: () {
            context.go('/Members');
          },
        ),
        ListTile(
          title: Text('Admin'),
          onTap: () {
            context.go('/Admin');
          },
        ),
      ],
    ),
  );
}
