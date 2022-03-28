import 'package:cruise_box/screens/payment_screen.dart';
import 'package:cruise_box/screens/sign_up.dart';
import 'package:cruise_box/widgets/category_selector.dart';
import 'package:flutter/material.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  // final _firestore = FirebaseFirestore.instance;

  bool isSwitched = false;

  int _currentIndex = 0;
  final List _children = [
    Center(
      child: Text('Home'),
    ),
    Center(
      child: Text('Like'),
    ),
    Center(
      child: Text('Create'),
    ),
    Center(
      child: Text('Save'),
    ),
    Center(
      child: Text('Profile'),
    ),
  ];

  // late Future<List<FirebaseFile>>futureFiles;

  // UploadTask? task;
  // File? file;

  // void filesStream() async {
  //   await for (var snapshot in _firestore.collection('files').snapshots()) {
  //     for (var event in snapshot.docs) {
  //       print(event.data);
  //     }
  //   }
  // }
  //
  // late Future<List<FirebaseFile>> futureFiles;

  @override
  // void initState() {
  //   super.initState();
  //   futureFiles = FirebaseApi.ListAll('files/');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        // backgroundColor: Colors.grey,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.blueGrey,
        selectedFontSize: 20,
        unselectedFontSize: 15,
        iconSize: 25,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text('like'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_outlined),
            title: Text('Create Event'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_copy),
            title: Text('Save'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            title: Text('Profile'),
          )
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(
                      16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // Text("Show Location"),
                        Material(
                          elevation: 5.0,
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(30.0),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PaymentScreen()));
                            },

                            // minWidth: 200.0,
                            height: 40.0,
                            child: Text(
                              "Show Location",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        // Switch(
                        //   value: isSwitched,
                        //   onChanged: (value) {
                        //     setState(() {
                        //       isSwitched = value;
                        //       value = LocationScreen() as bool;
                        //       print(isSwitched);
                        //     });
                        //   },
                        //   activeTrackColor: Colors.red,
                        //   activeColor: Colors.orangeAccent,
                        // ),
                        Flexible(
                          child: Container(
                            height: 50,
                            width: 300,
                            child: TextButton(
                                child: Text("Create Event +".toUpperCase(),
                                    style: TextStyle(fontSize: 14)),
                                style: buildButtonStyle(),
                                onPressed: () {
                                  // showModalBottomSheet(context: context, builder: builder)
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUp()));
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 280,
                        height: 50,
                        child: TextField(
// onChanged: (value) {
//   cityName = value;
// },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            filled: true,
                            fillColor: Colors.white,
                            icon: Icon(
                              Icons.event,
                              color: Colors.black,
                            ),
                            hintText: 'Search',
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.menu,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                CategorySelector(),
                //               leading: Icon(Icons.arrow_drop_down_circle),
                //               title: Text('$files[heading]'),
                //               subtitle: Text(
                //                 '$files[date]',
                //                 style: TextStyle(
                //                   color: Colors.black.withOpacity(0.6),
                //                 ),
                //               ),
                //             ),
                //             Padding(
                //               padding: EdgeInsets.all(16.0),
                //               child: Text(
                //                 '',
                //                 style: TextStyle(
                //                   color: Colors.black.withOpacity(0.6),
                //                 ),
                //               ),
                //             ),
                //             Image.network('$file'),
                //           ],
                //         ),
                //       );
                //     }),
              ],
            ),
            // StreamBuilder<QuerySnapshot>(
            //     stream: _firestore.collection('files').snapshots(),
            //     builder: (context, snapshot) {
            //       if (!snapshot.hasData) {
            //         return Center(
            //           child: CircularProgressIndicator(
            //             backgroundColor: Colors.lightBlueAccent,
            //           ),
            //         );
            //       }
            //       final files = snapshot.data!.docs;
            //       List<Text> fileWidget = [];
            //       for (var file in files) {
            //         final eventsHeading = file['heading'];
            //         final eventDuration = file['duration'];
            //         final eventLocation = file['location'];
            //         final eventDate = file['date'];
            //         final eventTime = file['time'];
            //
            //         final fileWidgets = Text(
            //             '$eventsHeading ,$eventLocation, $eventDate, $eventTime');
            //         fileWidget.add(fileWidgets);
            //       }
            //       return Card(
            //         clipBehavior: Clip.antiAlias,
            //         child: Column(
            //           children: <Widget>[
            //             ListTile(
            //               leading: Icon(Icons.arrow_drop_down_circle),
            //               title: Text('$files[heading]'),
            //               subtitle: Text(
            //                 '$files[date]',
            //                 style: TextStyle(
            //                   color: Colors.black.withOpacity(0.6),
            //                 ),
            //               ),
            //             ),
            //             Padding(
            //               padding: EdgeInsets.all(16.0),
            //               child: Text(
            //                 '',
            //                 style: TextStyle(
            //                   color: Colors.black.withOpacity(0.6),
            //                 ),
            //               ),
            //             ),
            //             Image.network('$file'),
            //           ],
            //         ),
            //       );
            //     }),
          ),
        ],
      ),
    );
  }
}
// },
// ),
// ]
// ),
// )
//  );
// }

ButtonStyle buildButtonStyle() {
  return ButtonStyle(
    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
      side: BorderSide(color: Colors.red, width: 200),
    )),
  );
}

// Widget buildFile(BuildContext context, FirebaseFile file) => ListTile(
//       leading: Image.network(
//         file.url,
//         width: 52,
//         height: 52,
//         fit: BoxFit.cover,
//       ),
//       title: Text(
//         file.name,
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//           decoration: TextDecoration.underline,
//           color: Colors.blue,
//         ),
//       ),
//       onTap: () => Navigator.of(context)
//           .push(MaterialPageRoute(builder: (context) => ImagePage(file: file))),
//     );
