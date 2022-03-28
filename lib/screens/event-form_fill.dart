import 'dart:io';
import 'dart:math' as math;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cruise_box/constants.dart';
import 'package:cruise_box/screens/bottom_sheet.dart';
import 'package:cruise_box/widgets/dropdown_data.dart';
import 'package:cruise_box/widgets/seat_data.dart';
import 'package:cruise_box/widgets/firebase_api.dart';
import 'package:cruise_box/widgets/firebase_file.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

ButtonStyle buttonStyle = ButtonStyle();

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({Key? key}) : super(key: key);

  @override
  _CreateEventScreenState createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  bool isSwitched = false;
  final _firestore = FirebaseFirestore.instance;

  late String eventsHeading;
  late String eventDuration;
  late String eventLocation;
  late String eventDate;
  late String eventTime;
  late String eventImage;

  UploadTask? task;
  File? image;

  String selectedDuration = 'Day';
  String selectedEvents = 'Events';

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return;
    final path = result.files.single.path;
    setState(() => image = File(path!));
  }

  Future uploadFile() async {
    if (image == null) return;
    final fileName = basename(image!.path);
    final destination = 'file/$fileName';
    task = FirebaseApi.uploadFile(destination, image!);
    setState(() {});
    if (task == null) return;
    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    return urlDownload;
    print('Download-Link: $urlDownload');
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
      stream: task.snapshotEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final snap = snapshot.data!;
          final progress = snap.bytesTransferred / snap.totalBytes;
          final percentage = (progress * 100).toStringAsFixed(2);
          return Text(
            '$percentage %',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          );
        } else {
          return Container();
        }
      });

  List<DropdownMenuItem<String>> getDropdownItemsDuration() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (String seat in seatList) {
      var newItem = DropdownMenuItem(
        child: Text(seat),
        value: seat,
      );
      dropdownItems.add(newItem);
    }
    return dropdownItems;
  }

  List<DropdownMenuItem<String>> getDropdownItems() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (String event in eventList) {
      var newItem = DropdownMenuItem(
        child: Text(event),
        value: event,
      );
      dropdownItems.add(newItem);
    }
    return dropdownItems;
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);

      final imagePermanent = await saveImagePermanently(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print("failed to pick image: $e");
    }
  }

  Future<File> saveImagePermanently(String imagepath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagepath);
    final image = File('${directory.path}/$name');
    return File(imagepath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    final fileName = image != null ? basename(image!.path) : 'No File Selected';
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Create Event',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  'Event Title',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 2.0, left: 10.0, right: 10.0, bottom: 13.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: "Event Title"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Add Photos',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Row(
                            children: [
                              Text(
                                'Pick Gallery',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.image),
                            ],
                          ),
                          buildButton(
                            title: "Pick Gallery",
                            icon: Icons.image_outlined,
                            onClicked: () => pickImage(ImageSource.gallery),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Pick Camera',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(Icons.camera),
                            ],
                          ),
                          buildButton(
                            title: "Pick Gallery",
                            icon: Icons.camera_alt_outlined,
                            onClicked: () => pickImage(ImageSource.camera),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Event Details',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      textAlign: TextAlign.center,
                      decoration:
                          InputDecoration(hintText: "Event Decoration")),
                ),
                // Container(
                //   height: 150.0,
                //   alignment: Alignment.center,
                //   padding: EdgeInsets.only(bottom: 30.0),
                //   color: Colors.red,
                //   child: DropdownButton<String>(
                //     value: selectedDuration,
                //     items: getDropdownItems(),
                //     onChanged: (value) {
                //       setState(() {
                //         selectedDuration = value!;
                //       });
                //     },
                //   ),
                // ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Starts'),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "DD/MM/YYYY",
                          focusColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Ends',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(hintText: "DD/MM/YYYY"),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text('Paid Event'),
                    Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                          value = isSwitched;
                          print(isSwitched);
                        });
                      },
                      activeTrackColor: Colors.red,
                      activeColor: Colors.red,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 120),
                  child: Material(
                    elevation: 5.0,
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30.0),
                    child: MaterialButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => BottomSheetScreen());
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => BottomSheetScreen()));
                      },

                      // minWidth: 200.0,
                      height: 40.0,
                      child: Text(
                        "Sign In",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButton({
    required String title,
    required IconData icon,
    required VoidCallback onClicked,
  }) =>
      SizedBox(
        width: 120,
        height: 100,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            // minimumSize: Size.fromHeight(64.0),
            primary: Color(0xFFFD2BAC2FF),
            onPrimary: Colors.black,
            textStyle: TextStyle(fontSize: 60, color: Colors.black),
          ),
          child: Row(
            children: <Widget>[
              // Icon: (icon, size: 28),
              SizedBox(width: 10),
            ],
          ),
          onPressed: onClicked,
        ),
      );
}

//   Widget buildFile(BuildContext context, FirebaseFile file) => ListTile(
//         title: Text(
//           '$eventsHeading',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             decoration: TextDecoration.underline,
//             color: Colors.blue,
//           ),
//         ),
//       );
// }
//
// class PopupScreen extends StatelessWidget {
//   const PopupScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Color(0xff757575),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20.0),
//             topRight: Radius.circular(20.0),
//           ),
//         ),
//         child: Column(
//           children: <Widget>[
//             LayoutBuilder(
//                 builder: (BuildContext context, BoxConstraints constraints) {
//               return CustomPaint(
//                 painter: ShapePainter(),
//                 size: Size(constraints.maxWidth, constraints.maxHeight),
//               );
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ShapePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final radius = math.min(size.width, size.height) / 2;
//     final center = Offset(size.width / 2, size.height / 2);
//
//     //  Draw the body
//     final paint = Paint()..color = Colors.yellow;
//     canvas.drawCircle(center, radius, paint);
//
//     //  Draw the mouth
//     final smilePaint = Paint()
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 10;
//     canvas.drawArc(Rect.fromCircle(center: center, radius: radius / 2), 0,
//         math.pi, false, smilePaint);
//
//     //  Draw the eyes
//     canvas.drawCircle(
//         Offset(center.dx - radius / 2, center.dy - radius / 2), 10, Paint());
//     canvas.drawCircle(
//         Offset(center.dx + radius / 2, center.dy - radius / 2), 10, Paint());
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     // TODO: implement shouldRepaint
//     return false;
//   }
// }
//
// class ButtonWidget extends StatelessWidget {
//   final IconData icon;
//   final String text;
//   final VoidCallback onClicked;
//
//   const ButtonWidget(
//       {Key? key,
//       required this.icon,
//       required this.text,
//       required this.onClicked})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) => ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           primary: Color.fromRGBO(29, 194, 95, 1),
//           minimumSize: Size.fromHeight(50),
//         ),
//         onPressed: onClicked,
//         child: buildContent(),
//       );
//   Widget buildContent() => Row(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           Icon(
//             icon,
//             size: 28,
//           ),
//           SizedBox(
//             width: 16,
//           ),
//           Text(
//             text,
//             style: TextStyle(fontSize: 22, color: Colors.white),
//           ),
//         ],
//       );
// }
