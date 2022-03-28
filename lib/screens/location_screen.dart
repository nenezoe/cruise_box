import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

// class LocationScreen extends StatelessWidget {
//   static const String routeName = '/location';
//
//   static Route route() {
//     return MaterialPageRoute(
//       builder: (_) => LocationScreen(),
//       settings: RouteSettings(name: routeName),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           Container(
//             height: MediaQuery.of(context).size.height,
//             width: double.infinity,
//             child: GoogleMap(
//               myLocationButtonEnabled: true,
//               initialCameraPosition:
//                   CameraPosition(target: LatLng(10, 10), zoom: 10),
//             ),
//           ),
//           Positioned(
//             top: 40,
//             left: 20,
//             right: 20,
//             child: Container(
//               height: 100,
//               child: Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: Image.asset(
//                       'assets/black_box.jpg',
//                     ),
//                     flex: 1,
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Expanded(
//                     child: LocationSearchBox(),
//                     flex: 3,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 50,
//             left: 20,
//             right: 20,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 70.0),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(primary: Colors.red),
//                 child: Text('Save'),
//                 onPressed: () {},
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Padding LocationSearchBox() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: TextField(
//         decoration: InputDecoration(
//             filled: true,
//             fillColor: Colors.white,
//             hintText: 'Enter your Location',
//             suffixIcon: Icon(Icons.search),
//             contentPadding: EdgeInsets.only(left: 20, bottom: 5, right: 5),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(color: Colors.white),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(color: Colors.white),
//             )),
//       ),
//     );
//   }
// }

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
        backgroundColor: Colors.green,
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }
}
