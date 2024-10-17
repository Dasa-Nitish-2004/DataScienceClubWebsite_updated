import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void pushEvent(String path, Map Event, BuildContext context) async {
  final ref = FirebaseDatabase.instance.ref(path);
  ref.set(Event).then((value) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Successfully added the event")));
    Navigator.pop(context);
  }).catchError((error) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Something went wrong")));
  });
}
