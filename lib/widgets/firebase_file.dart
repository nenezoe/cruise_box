import 'package:firebase_storage/firebase_storage.dart';

class FirebaseFile {
  final Reference ref;
  final String name;
  final String url;
  // final String heading;
  // final String location;
  // final String duration;
  // final String date;
  // final String time;

  FirebaseFile({
    required this.ref,
    required this.name,
    required this.url,
    // required this.heading, required this.duration, required this.location, required this.date, required this.time
  });
}

//
class Files {
  late String heading;
  late String location;
  late String duration;
  late String date;
  late String time;
  late String image;

  Files.fromMap(Map<String, dynamic> data) {
    heading = data['heading'];
    location = data['location'];
    duration = data['duration'];
    date = data['date'];
    time = data['time'];
    image = data['file'];
  }
}
