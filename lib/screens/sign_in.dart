import 'package:cruise_box/constants.dart';
import 'package:cruise_box/screens/event-form_fill.dart';
import 'package:cruise_box/screens/event_screen.dart';
import 'package:cruise_box/screens/sign_up.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool checkedValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/black_box.jpg',
                    height: 50,
                    width: 50,
                  ),
                  Text(
                    'Cruise BoXx',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  // eventDate = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: "User name", labelText: 'name'),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  // eventDate = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: "password", labelText: 'password'),
              ),
              SizedBox(height: 5.0),
              CheckboxListTile(
                title: Text("keep me signed in"),
                value: checkedValue,
                onChanged: (newValue) {
                  setState(() {
                    checkedValue = true;
                  });
                },
                controlAffinity:
                    ListTileControlAffinity.leading, //  <-- leading Checkbox
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: Material(
                    elevation: 5.0,
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30.0),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateEventScreen()));
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
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 60.0, right: 20.0, top: 0.5, bottom: 0.5),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/google.jpg',
                      height: 40,
                      width: 40,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Container(
                      height: 50,
                      width: 150,
                      child: TextButton(
                          child: Text('Sign in with google',
                              style: TextStyle(fontSize: 14)),
                          style: buildButtonStyle(),
                          onPressed: () {
                            // Navigator.push(context,
                            // MaterialPageRoute(builder: (context) => SignIn()));
                          }),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 60.0, right: 1.0, top: 1.0, bottom: 0.5),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/facebook.png',
                      height: 40.0,
                      width: 30.0,
                    ),
                    Container(
                      height: 60,
                      width: 150,
                      child: TextButton(
                          child: Text('Sign in with Facebook',
                              style: TextStyle(fontSize: 12)),
                          style: buildButtonStyle(),
                          onPressed: () {
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) => SignIn()));
                          }),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 60.0, right: 20.0, top: 1.0, bottom: 10.0),
                child: Row(
                  children: [
                    Text('Don"t have an account ?'),
                    SizedBox(
                      width: 5.0,
                    ),
                    Container(
                      height: 50,
                      width: 100,
                      child: TextButton(
                          child:
                              Text('Sign Up', style: TextStyle(fontSize: 14)),
                          style: buildButtonStyle(),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
