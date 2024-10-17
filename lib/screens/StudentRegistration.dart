import 'package:ds_web/services/pushEvent.dart';
import 'package:ds_web/widgets/Navbar.dart';
import 'package:ds_web/widgets/drawer.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
// import 'package:http/http.dart';
import 'package:lottie/lottie.dart';

// some layout based error in my code.

class EventRegistrationForm extends StatefulWidget {
  String? eventName = "";
  String? desc = "";

  EventRegistrationForm(
      {super.key, required this.eventName, required this.desc});

  @override
  _EventRegistrationFormState createState() => _EventRegistrationFormState();
}

class _EventRegistrationFormState extends State<EventRegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final nameController = TextEditingController();
  final rollNumberController = TextEditingController();
  final specializationController = TextEditingController();
  final queryController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    rollNumberController.dispose();
    specializationController.dispose();
    queryController.dispose();
    super.dispose();
  }

  // Radio button states
  String? branch = 'Computer Science';
  String? yearOfStudy = '2nd year';
  String imageUrl = '';

  // Clear form function
  void clearForm() {
    nameController.clear();
    rollNumberController.clear();
    specializationController.clear();
    queryController.clear();
    setState(() {
      branch = 'Computer Science';
      yearOfStudy = "2nd year";
    });
  }

  // Submit form function
  void submitForm() {
    if (_formKey.currentState!.validate()) {
      // You can handle form submission here (e.g., send data to Firebase)
      final k = {
        "Name": nameController.text,
        "Roll Number": rollNumberController.text,
        "Branch": branch,
        "Specialization": specializationController.text,
        "Year of Study": yearOfStudy,
        "Query": queryController.text
      };
      pushStudent(
          "/posts/${widget.eventName}/registeredStudents/${nameController.text}",
          k,
          context);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _loadImage();
    super.initState();
  }

  Future<void> _loadImage() async {
    try {
      // Get Firebase Storage instance
      FirebaseStorage storage = FirebaseStorage.instance;
      // Get image URL from Firebase Storage dynamically
      String downloadURL = await storage
          .ref("/Events/${widget.eventName}/posters/poster.jpg")
          .getDownloadURL();
      setState(() {
        imageUrl = downloadURL;
      });
    } catch (e) {
      print("Error loading image: $e");
    }
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; //640
    return widget.eventName == ""
        ? Scaffold(
            body: Center(
              child: Text("404"),
            ),
          )
        : Scaffold(
            drawer: openedDrawer(context),
            body: SafeArea(
              child: Column(
                children: [
                  const Navbar(),
                  Expanded(
                    // Ensures the remaining space is shared between Lottie and the form
                    child: width > 640
                        ? Row(
                            children: [
                              imageUrl.isNotEmpty
                                  ? Container(
                                      // width: double.infinity,
                                      width: 400,
                                      height: 1000,
                                      margin: EdgeInsets.all(50),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              imageUrl), // Load the image from Firebase if available
                                          // Otherwise load local asset
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    )
                                  :
                                  // Fixed Lottie Animation
                                  width > 640
                                      ? Column(
                                          children: [
                                            Lottie.asset(
                                              "assets/animations/siginAnimation.json",
                                              height: 400,
                                              // Adjust the height based on your layout needs
                                            ),
                                            Text(
                                              widget.eventName!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium!
                                                  .copyWith(color: Colors.grey),
                                            ),
                                          ],
                                        )
                                      : SizedBox(),

                              // Scrollable Form
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                        16.0), // Add padding for better spacing
                                    child: _form(width),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                imageUrl.isNotEmpty
                                    ? Container(
                                        // width: double.infinity,
                                        width: 500,
                                        height: 1000,
                                        margin: EdgeInsets.all(50),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                imageUrl), // Load the image from Firebase if available
                                            // Otherwise load local asset
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )
                                    :
                                    // Fixed Lottie Animation
                                    width > 640
                                        ? Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Lottie.asset(
                                                "assets/animations/siginAnimation.json",
                                                height: 400,
                                                // Adjust the height based on your layout needs
                                              ),
                                              Text(
                                                widget.eventName!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displayMedium!
                                                    .copyWith(
                                                        color: Colors.grey),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                Padding(
                                  padding: const EdgeInsets.all(
                                      16.0), // Add padding for better spacing
                                  child: _form(width),
                                ),
                              ],
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
          width < 640
              ? Text(
                  widget.eventName!,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: Colors.grey),
                )
              : SizedBox(),
          // Name Field
          SizedBox(
            height: 30,
          ),
          Container(
            // color: Colors.amber,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.blue[100]),
            child: Text(
              widget.desc!,
              style: TextStyle(fontFamily: "notoColorEmoji"),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: "Name",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          // Divider(
          //   color: Colors.grey,
          //   endIndent: 40,
          //   indent: 40,
          // ),
          SizedBox(height: 16.0),

          // Roll Number Field
          TextFormField(
            controller: rollNumberController,
            decoration: InputDecoration(
              labelText: "Roll Number (Enter full Hall Ticket number)",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your roll number';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          Divider(
            color: Colors.grey,
            endIndent: 40,
            indent: 40,
          ),
          SizedBox(height: 16.0),

          // Branch Field (RadioListTile)
          Text("Branch", style: TextStyle(fontSize: 16)),
          Column(
            children: [
              RadioListTile<String>(
                title: const Text('Civil'),
                value: 'Civil',
                groupValue: branch,
                onChanged: (value) {
                  setState(() {
                    branch = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Electrical and Electronics'),
                value: 'Electrical and Electronics',
                groupValue: branch,
                onChanged: (value) {
                  setState(() {
                    branch = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Mechanical'),
                value: 'Mechanical',
                groupValue: branch,
                onChanged: (value) {
                  setState(() {
                    branch = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Electronics and Communication'),
                value: 'Electronics and Communication',
                groupValue: branch,
                onChanged: (value) {
                  setState(() {
                    branch = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Computer Science'),
                value: 'Computer Science',
                groupValue: branch,
                // selected: true,
                onChanged: (value) {
                  setState(() {
                    branch = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Metallurgy'),
                value: 'Metallurgy',
                groupValue: branch,
                onChanged: (value) {
                  setState(() {
                    branch = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Chemical'),
                value: 'Chemical',
                groupValue: branch,
                onChanged: (value) {
                  setState(() {
                    branch = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Biotechnology'),
                value: 'Biotechnology',
                groupValue: branch,
                onChanged: (value) {
                  setState(() {
                    branch = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Geo Informatics'),
                value: 'Geo Informatics',
                groupValue: branch,
                onChanged: (value) {
                  setState(() {
                    branch = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Cyber Security'),
                value: 'Cyber Security',
                groupValue: branch,
                onChanged: (value) {
                  setState(() {
                    branch = value;
                  });
                },
              ),
              // Add more radio buttons as needed...
            ],
          ),
          SizedBox(height: 16.0),
          Divider(
            color: Colors.grey,
            endIndent: 40,
            indent: 40,
          ),
          SizedBox(height: 16.0),

          // Specialization Field
          TextFormField(
            controller: specializationController,
            decoration: InputDecoration(
              labelText: "Specialization",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your specialization';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          Divider(
            color: Colors.grey,
            endIndent: 40,
            indent: 40,
          ),
          SizedBox(height: 16.0),

          // Year of Study Field (RadioListTile)
          Text("Year of Study", style: TextStyle(fontSize: 16)),
          Column(
            children: [
              RadioListTile<String>(
                title: const Text('1st year'),
                value: '1st year',
                groupValue: yearOfStudy,
                onChanged: (value) {
                  setState(() {
                    yearOfStudy = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('2nd year'),
                value: '2nd year',
                groupValue: yearOfStudy,
                onChanged: (value) {
                  setState(() {
                    yearOfStudy = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('3rd year'),
                value: '3rd year',
                groupValue: yearOfStudy,
                onChanged: (value) {
                  setState(() {
                    yearOfStudy = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('4th year'),
                value: '4th year',
                groupValue: yearOfStudy,
                onChanged: (value) {
                  setState(() {
                    yearOfStudy = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('5th year'),
                value: '5th year',
                groupValue: yearOfStudy,
                onChanged: (value) {
                  setState(() {
                    yearOfStudy = value;
                  });
                },
              ),
              // Add more radio buttons as needed...
            ],
          ),
          SizedBox(height: 16.0),
          Divider(
            color: Colors.grey,
            endIndent: 40,
            indent: 40,
          ),
          SizedBox(height: 16.0),

          // Query Field
          TextFormField(
            controller: queryController,
            decoration: InputDecoration(
              labelText: "Any query regarding the event",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            ),
            maxLines: 3,
          ),
          SizedBox(height: 16.0),
          // Divider(
          //   color: Colors.grey,
          //   endIndent: 40,
          //   indent: 40,
          // ),
          SizedBox(height: 16.0),

          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: submitForm,
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Text("Submit"),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: clearForm,
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    foregroundColor: Colors.red),
                child: Text("Clear"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
