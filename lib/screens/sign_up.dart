import 'dart:convert';

import 'package:cruise_box/backend/api.dart';
import 'package:cruise_box/constants.dart';
import 'package:cruise_box/screens/event-form_fill.dart';
import 'package:cruise_box/screens/event_screen.dart';
import 'package:cruise_box/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late String username, phone, email, password;
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  // GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  // late ScaffoldMessengerState scaffoldMessenger;
  // var reg = RegExp(
  //     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  // Getting value from Controller
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 45),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
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
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    controller: _usernameController,
                    onSaved: (val) {
                      username = val!;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: "User name", labelText: 'Name'),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Please enter name";
                      }
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    controller: _passwordController,
                    onSaved: (val) {
                      password = val!;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: "password", labelText: 'Password'),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Please enter password";
                      }
                      if (!RegExp(
                              r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$")
                          .hasMatch(val)) {
                        return "Please enter valid password";
                      }
                    },
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    controller: _phoneController,
                    onSaved: (val) {
                      phone = val!;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: "Phone Number", labelText: 'Phone number'),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Please enter Phone Number";
                      }
                    },
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                      textAlign: TextAlign.center,
                      controller: _emailController,
                      onSaved: (val) {
                        email = val!;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: "email", labelText: 'email'),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please enter Email";
                        }
                        if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val)) {
                          return "Please enter valid email";
                          {
                            return null;
                          }
                        }
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.bottomRight,
                          width: double.infinity,
                          child: Material(
                            elevation: 5.0,
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(30.0),
                            child: MaterialButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  RegistrationUser();
                                  print("Successful");
                                } else {
                                  print("Unsuccessful");
                                }
                                // signup(username, email, password, phone) async {
                                //   setState(() {
                                //     isLoading = true;
                                //   });
                                //   print("Calling");
                                //
                                //   Map data = {
                                //     'email': email,
                                //     'password': password,
                                //     'username': username,
                                //     'phone': phone,
                                //   };
                                //   print(data.toString());
                                //   final response = await http.post(
                                //       Uri.parse(REGISTRATION),
                                //       headers: {
                                //         "Accept": "application/json",
                                //         "Content-Type":
                                //             "application/x-www-form-urlencoded"
                                //       },
                                //       body: data,
                                //       encoding: Encoding.getByName("utf-8"));
                                //   if (response.statusCode == 200) {
                                //     setState(() {
                                //       isLoading = false;
                                //     });
                                //     Map<String, dynamic> resposne =
                                //         jsonDecode(response.body);
                                //     if (!resposne['error']) {
                                //       Map<String, dynamic> user =
                                //           resposne['data'];
                                //       print(" User name ${user['data']}");
                                //       // savePref(
                                //       //     user['phone'], user['username'], user['email'], user['password']);
                                //       // Navigator.pushReplacementNamed(context, "/home");
                                //     } else {
                                //       print(" ${resposne['message']}");
                                //     }
                                //
                                //     savePref(String username, String email,
                                //         String password, String phone) async {
                                //       SharedPreferences preferences =
                                //           await SharedPreferences.getInstance();
                                //
                                //       preferences.setString(
                                //           "username", username);
                                //       preferences.setString("phone", phone);
                                //       preferences.setString("email", email);
                                //       preferences.setString(
                                //           "password", password);
                                //       preferences.commit();
                                //     }

                                //   scaffoldMessenger
                                //       .showSnackBar(SnackBar(content: Text("${resposne['message']}")));
                                // } else {
                                //   scaffoldMessenger
                                //       .showSnackBar(SnackBar(content: Text("Please Try again")));
                                // }
                                // }

                                // if (_usernameController.text.isEmpty) {
                                //   scaffoldMessenger.showSnackBar(SnackBar(
                                //       content: Text("Please Enter Name")));
                                //   return;
                                // }
                                // if (!reg.hasMatch(_emailController.text)) {
                                //   scaffoldMessenger.showSnackBar(SnackBar(
                                //       content: Text("Enter Valid Email")));
                                //   return;
                                // }
                                // if (_passwordController.text.isEmpty ||
                                //     _passwordController.text.length < 6) {
                                //   scaffoldMessenger.showSnackBar(SnackBar(
                                //       content: Text(
                                //           "Password should be min 6 characters")));
                                //
                                //   return;
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        CreateEventScreen()));
                              },
                              //   signup(
                              //       _usernameController.text,
                              //       _emailController.text,
                              //       _passwordController.text,
                              //       _phoneController.text);
                              // },

                              // minWidth: 200.0,
                              height: 40.0,
                              child: Text(
                                "Sign Up",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        child: (isLoading)
                            ? Center(
                                child: Container(
                                    height: 26,
                                    width: 26,
                                    child: CircularProgressIndicator(
                                      backgroundColor: Colors.green,
                                    )))
                            : Container(),
                        right: 30,
                        bottom: 0,
                        top: 0,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Already have an account ?',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => SignIn()));
                        },
                        child: Text('Sign In',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.red,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future RegistrationUser() async {
    String apiEndpoint = "http://localhost/backend/registration.php";
    final Uri url = Uri.parse(apiEndpoint);
    Map mapeddata = {
      'email': _emailController.text,
      'password': _passwordController.text,
      'username': _usernameController.text,
      'phone': _phoneController.text,
    };
    print('JSON DATA: ${mapeddata}');
    http.Response response = await http.post(url, body: mapeddata);

    var data = jsonDecode(response.body);
    print("Data: ${data}");
  }
}

// Map data = {
//   'email': email,
//   'password': password,
//   'username': username
// };
// print(data.toString());
// final  response= await http.post(
// Uri.parse(REGISTRATION),
// headers: {
// "Accept": "application/json",
// "Content-Type": "application/x-www-form-urlencoded"
// },
//
//
// body: data,
// encoding: Encoding.getByName("utf-8")
// )  ;
