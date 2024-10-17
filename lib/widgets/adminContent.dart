import 'package:ds_web/screens/EventCreation.dart';
import 'package:ds_web/widgets/EventOutlook.dart';
import 'package:ds_web/widgets/Navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:go_router/go_router.dart';

class AdminContent extends StatefulWidget {
  const AdminContent({super.key});

  @override
  State<AdminContent> createState() => _AdminContentState();
}

class _AdminContentState extends State<AdminContent> {
  final DatabaseReference ref = FirebaseDatabase.instance.ref("posts");
  final FirebaseAuth auth = FirebaseAuth.instance;

  void _createPost() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EventCreationPage(),
      ),
    );
  }

  // Function to sign out the user
  void _signOutUser() async {
    try {
      await auth.signOut();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Signed out successfully")),
      );
      context.go("/"); // Navigate back to sign-in page or previous page
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Sign out failed: $error")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Navbar(),
              Container(
                height: 40,
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: _createPost,
                      child: Chip(
                        label: Text("Event"),
                        avatar: Icon(Icons.add),
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: _signOutUser,
                      child: Chip(
                        label: Text("Sign Out"),
                        avatar: Icon(Icons.logout),
                      ),
                    ),
                    SizedBox(width: 40),
                  ],
                ),
              ),
              Container(
                height: 500,
                child: FirebaseAnimatedList(
                  query: ref,
                  itemBuilder: (context, snapshot, animation, index) {
                    // Create a Map to hold the key-value pairs
                    Map<String, Object> map = {};

                    // Iterate through each child and add to the map
                    for (var child in snapshot.children) {
                      map[child.key ?? ''] =
                          child.value ?? ''; // Use default values if null
                    }

                    // print(map); // Debug print to see the map contents

                    return EventOutlook(
                      map: map,
                      flag: 1,
                    );
                  },
                ),
              ),
              // Other widgets...
            ],
          ),
        ),
      ),
    );
  }
}
