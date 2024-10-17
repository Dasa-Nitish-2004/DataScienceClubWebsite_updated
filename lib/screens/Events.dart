import 'package:ds_web/widgets/EventOutlook.dart';
import 'package:ds_web/widgets/Navbar.dart';
import 'package:ds_web/widgets/drawer.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  List<Map<String, String>> Events = [];
  final DatabaseReference ref = FirebaseDatabase.instance.ref("posts");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: openedDrawer(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Navbar(),
              Container(
                child: Stack(
                  children: [
                    Container(
                      height: 400,
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/c2.jpeg",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: 400,
                      width: double.infinity,
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      color: Colors.black.withOpacity(0.8),
                      alignment: Alignment.center,
                      child: Text(
                        "Best Data Science Events",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(color: Colors.grey, letterSpacing: 2),
                      ),
                    ),
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
                      flag: 0,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
