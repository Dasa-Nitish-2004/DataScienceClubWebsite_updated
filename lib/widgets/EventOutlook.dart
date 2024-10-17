import 'package:ds_web/screens/EventCreation.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EventOutlook extends StatefulWidget {
  final Map<String, Object> map;
  int flag = 0; // 0 - student acess   1 - admin acess
  EventOutlook({super.key, required this.map, required this.flag});

  @override
  State<EventOutlook> createState() => _EventOutlookState();
}

class _EventOutlookState extends State<EventOutlook> {
  String imageUrl = "";
  bool isHovered = false;
  @override
  void initState() {
    _loadImage();
    super.initState();
  }

  Future<void> _loadImage() async {
    try {
      // Get Firebase Storage instance
      FirebaseStorage storage = FirebaseStorage.instance;
      // Get image URL from Firebase Storage dynamically
      String downloadURL = await storage
          .ref("/Events/${widget.map["name"]}/posters/poster.jpg")
          .getDownloadURL();
      setState(() {
        imageUrl = downloadURL;
      });
    } catch (e) {
      print("Error loading image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        // height: isHovered ? 900 : 600,
        height: 600,
        // constraints: BoxConstraints.expand(height: 600, width: double.infinity),
        // width: double.infinity,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 400,
              margin: EdgeInsets.all(50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: imageUrl.isNotEmpty
                      ? NetworkImage(
                          imageUrl) // Load the image from Firebase if available
                      : AssetImage("assets/images/c3.jpeg")
                          as ImageProvider, // Otherwise load local asset
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 400,
              margin: const EdgeInsets.all(50),
              padding: const EdgeInsets.all(50),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.bottomLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.map["name"].toString(),
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: Colors.white70,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.map["caption"].toString(),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.grey,
                          letterSpacing: 2,
                        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Event on ",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.grey,
                              letterSpacing: 2,
                            ),
                      ),
                      Icon(
                        Icons.calendar_month,
                        color: Colors.grey,
                      ),
                      Text(
                        " ${widget.map["eventDate"]}",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.grey,
                              letterSpacing: 2,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Registration last on ",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.grey,
                              letterSpacing: 2,
                            ),
                      ),
                      Icon(
                        Icons.calendar_month,
                        color: Colors.grey,
                      ),
                      Text(
                        " ${widget.map["lastDate"]}",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.grey,
                              letterSpacing: 2,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Timing  ",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.grey,
                              letterSpacing: 2,
                            ),
                      ),
                      Icon(
                        Icons.alarm,
                        color: Colors.grey,
                      ),
                      Text(
                        " ${widget.map["eventTime"]}",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.grey,
                              letterSpacing: 2,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "location  ",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.grey,
                              letterSpacing: 2,
                            ),
                      ),
                      Icon(
                        Icons.location_on,
                        color: Colors.grey,
                      ),
                      Text(
                        " ${widget.map["venue"]}",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.grey,
                              letterSpacing: 2,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  widget.flag == 1
                      ? ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EventCreationPage(
                                  name: widget.map["name"].toString(),
                                  venue: widget.map["venue"].toString(),
                                  caption: widget.map["caption"].toString(),
                                  desc: widget.map["description"].toString(),
                                  lastdate: widget.map["lastDate"].toString(),
                                  eventdate: widget.map["eventDate"].toString(),
                                  eventtime: widget.map["eventTime"].toString(),
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.transparent,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.edit),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Edit"),
                            ],
                          ))
                      : ElevatedButton(
                          onPressed: () {
                            // context.go(
                            //     "/reg/${widget.map["name"]}?desc=${widget.map["description"]}");
                            context.go(Uri(
                                path: "/reg/${widget.map["name"]}",
                                queryParameters: {
                                  'desc': widget.map["description"]
                                }).toString());
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.indigo[700],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.assignment_turned_in),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Get Registered Now"),
                            ],
                          )),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
