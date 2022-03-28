import 'package:cruise_box/constants.dart';
import 'package:cruise_box/screens/event_screen.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 30),
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
              height: 30,
            ),
            Image.asset(
              'assets/screen4.jpg',
              height: 330,
              width: 414,
            ),
            Text(
              'Create Events',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: TextButton(
                  child: Text("Get Started".toUpperCase(),
                      style: TextStyle(fontSize: 14)),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(15)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red)))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EventScreen()));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
