import 'package:cruise_box/constants.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/black_box.jpg',
                      height: 50,
                      width: 50,
                    ),
                    Text(
                      'CruiseBoXx',
                      style: kHeadingText,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Image.asset('assets/group.jpg'),
              SizedBox(
                height: 30,
              ),
              Text(
                'Discover Events',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: 80,
              ),
              //           Container(
              //             margin: EdgeInsets.all(25),
              //             child: TextButton(
              //                 child: Text(
              //                     "Get Started".toUpperCase(),
              //                     style: TextStyle(fontSize: 14)
              //                 ),
              //                 style: ButtonStyle(
              //                     padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
              //                     foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
              //                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //                         RoundedRectangleBorder(
              //                             borderRadius: BorderRadius.circular(18.0),
              //                             side: BorderSide(color: Colors.red)
              //                         ),
              //                     ),
              //                 ),
              //                 onPressed: () => null
              //             ),
              //           ),
            ],
          ),
        ),
      ),
    );
  }
}
