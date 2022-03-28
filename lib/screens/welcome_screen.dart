// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:cruise_box/screens/login_screen.dart';
// import 'package:cruise_box/screens/registration_screen.dart';
// import 'package:flutter/material.dart';
//
// class WelcomeScreen extends StatefulWidget {
//   const WelcomeScreen({Key? key}) : super(key: key);
//
//   @override
//   _WelcomeScreenState createState() => _WelcomeScreenState();
// }
//
// class _WelcomeScreenState extends State<WelcomeScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController controller;
//   late Animation animation;
//
//   @override
//   void initState() {
//     super.initState();
//     controller =
//         AnimationController(duration: Duration(seconds: 3), vsync: this);
//     animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
//         .animate(controller);
//     controller.forward();
//     controller.addListener(() {
//       setState(() {});
//       print(animation.value);
//     });
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: animation.value,
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 200),
//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 Row(
//                   children: <Widget>[
//                     Hero(
//                       tag: "logo",
//                       child: Container(
//                         child: Image.asset('assets/black_box.jpg'),
//                         height: 35,
//                       ),
//                     ),
//                     TypewriterAnimatedTextKit(
//                       text: ["Cruise BoXx"],
//                       textStyle: TextStyle(
//                         fontSize: 35.0,
//                         fontWeight: FontWeight.w900,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: 32.0),
//                   child: Material(
//                     elevation: 5.0,
//                     color: Colors.lightBlueAccent,
//                     borderRadius: BorderRadius.circular(30.0),
//                     child: MaterialButton(
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => RegistrationScreen()));
//                       },
//                       minWidth: 200.0,
//                       height: 40.0,
//                       child: Text(
//                         "Registration",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 3,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: 32.0),
//                   child: Material(
//                     elevation: 5.0,
//                     color: Colors.blueAccent,
//                     borderRadius: BorderRadius.circular(30.0),
//                     child: MaterialButton(
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => LoginScreen()));
//                       },
//
//                       // minWidth: 200.0,
//                       height: 40.0,
//                       child: Text(
//                         "Login",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//                 // RoundedButton(color: Colors.blueAccent, title: "Registration", onPressed: () {}, ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
