import 'package:cruise_box/constants.dart';
import 'package:cruise_box/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  // bool showSpinner = false;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: "logo",
                child: Container(
                  height: 250.0,
                  child: Image.asset('assets/black_box.jpg'),
                ),
              ),
            ),
            SizedBox(
              height: 28.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
              },
              decoration:
                  kTextFieldDecoration.copyWith(hintText: "Enter your Email"),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                  hintText: "Enter your Password"),
            ),
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 32.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () async {
                    // setState(() {
                    //   showSpinner = true;
                    // });
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (newUser != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      }

                      // setState(() {
                      //   showSpinner = false;
                      // });
                    } catch (e) {
                      print(e);
                    }
                  },
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen()));

                  // minWidth: 200.0,
                  height: 40.0,
                  child: Text(
                    "Register",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            // RoundedButton(color: Colors.blueAccent, title: "Register", onPressed: () {},),
          ],
        ),
      ),
    );
  }
}
