import 'package:ds_web/services/pushEvent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';

class EventCreationPage extends StatefulWidget {
  String name, caption, venue, desc, eventdate, lastdate, eventtime;
  EventCreationPage(
      {super.key,
      this.name = "",
      this.caption = "",
      this.venue = "",
      this.desc = "",
      this.eventdate = 'Event Date',
      this.eventtime = 'Event Time',
      this.lastdate = 'Reg Last Date'});

  @override
  State<EventCreationPage> createState() => _EventCreationPageState();
}

class _EventCreationPageState extends State<EventCreationPage> {
  final _formKey = GlobalKey<FormState>();
  final formatter = DateFormat.yMEd();
  bool isEnable = true;
  bool isSubmitClicked = false;
  // Controllers for text fields
  late TextEditingController EventnameController =
      TextEditingController(text: widget.name);
  late TextEditingController CaptionController =
      TextEditingController(text: widget.caption);
  late TextEditingController venueController =
      TextEditingController(text: widget.venue);
  late TextEditingController EventDescriptionController =
      TextEditingController(text: widget.desc);

  @override
  void initState() {
    // TODO: implement initState
    EventnameController.text = widget.name;
    CaptionController.text = widget.caption;
    venueController.text = widget.venue;
    EventDescriptionController.text =
        widget.desc.substring(5, widget.desc.length - 6);
    isEnable = widget.name == "" ? true : false;
    super.initState();
  }

  @override
  void dispose() {
    EventnameController.dispose();
    CaptionController.dispose();
    venueController.dispose();
    EventDescriptionController.dispose();
    super.dispose();
  }

  // Function to show date picker
  _showDatePicker(int i) async {
    var selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );

    if (selectedDate != null) {
      setState(() {
        if (i == 1) {
          widget.eventdate = formatter.format(selectedDate);
        } else {
          widget.lastdate = formatter.format(selectedDate);
        }
      });
    }
  }

  // Function to show time picker
  _showTimePicker() async {
    var selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      setState(() {
        widget.eventtime = selectedTime.format(context);
      });
    }
  }

  // Clear form function
  void clearForm() {
    EventnameController.clear();
    CaptionController.clear();
    venueController.clear();
    EventDescriptionController.clear();
    setState(() {
      widget.eventdate = 'Event Date';
      widget.lastdate = 'Last Date';
      widget.eventtime = 'Event Time';
    });
  }

  // Submit form function
  void submitForm() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission here (e.g., send data to Firebase)
      if (widget.eventdate == 'Event Date' ||
          widget.lastdate == 'Reg Last Date' ||
          widget.eventtime == 'Event Time') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Please Select all Date and Time")));
        return;
      }
      // print(formatter.format(DateTime.now()));
      // print("Event Title: ${EventnameController.text}");
      // print("Caption: ${CaptionController.text}");
      // print("Venue: ${venueController.text}");
      // print("Event Description: ${EventDescriptionController.text}");
      // print("Event Date: $eventDate");
      // print("Last Date: $lastDate");
      // print("Event Time: $eventTime");
      setState(() {
        isSubmitClicked = true;
      });
      pushEvent(
          "posts/${EventnameController.text}",
          {
            "name": EventnameController.text,
            "caption": CaptionController.text,
            "venue": venueController.text,
            "description": "<pre>${EventDescriptionController.text}</pre>",
            // "description": EventDescriptionController.text,
            "registeredStudents": {
              "Dasa Nitish": {"name": "Dasa Nitish"}
            },
            "postedDate": formatter.format(DateTime.now()),
            "lastDate": widget.lastdate,
            "eventDate": widget.eventdate,
            "eventTime": widget.eventtime,
          },
          context);
      setState(() {
        isSubmitClicked = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event Details"),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Lottie.asset("assets/animations/EventAnimation.json",
                    height: 400),
                const SizedBox(height: 30),
                Text(
                  "Make your Event",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: Colors.grey),
                ),
              ],
              mainAxisSize: MainAxisSize.min,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _form(width),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _form(double width) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          // Event Title Field
          TextFormField(
            controller: EventnameController,
            decoration: InputDecoration(
              labelText: "Event Title",
              enabled: isEnable,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter event title';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),

          // Caption Field
          TextFormField(
            controller: CaptionController,
            decoration: InputDecoration(
              labelText: "Caption",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter a caption';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),

          // Venue Field
          TextFormField(
            controller: venueController,
            decoration: InputDecoration(
              labelText: "Venue",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter venue';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),

          // Event Description Field
          TextFormField(
            controller: EventDescriptionController,
            maxLines: 10,
            decoration: InputDecoration(
              labelText: "Description",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter event description';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          const Divider(color: Colors.grey, endIndent: 40, indent: 40),
          const SizedBox(height: 25.0),

          // Date and Time Picker
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => _showDatePicker(1),
                child: Chip(
                  label: Text(widget.eventdate),
                  avatar: Icon(Icons.calendar_month),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () => _showDatePicker(0),
                child: Chip(
                  label: Text(widget.lastdate),
                  avatar: Icon(
                    Icons.calendar_today,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () => _showTimePicker(),
                child: Chip(
                    label: Text(widget.eventtime),
                    avatar: Icon(Icons.access_alarm)),
              ),
            ],
          ),
          const SizedBox(height: 25.0),
          const Divider(color: Colors.grey, endIndent: 40, indent: 40),
          const SizedBox(height: 16.0),

          // Buttons
          isSubmitClicked
              ? Container(
                  height: 30,
                  child: CircularProgressIndicator(),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: submitForm,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text("Submit"),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: clearForm,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        foregroundColor: Colors.red,
                      ),
                      child: const Text("Clear"),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
