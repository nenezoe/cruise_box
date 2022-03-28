import 'package:cruise_box/constants.dart';
import 'package:cruise_box/screens/event_screen.dart';
import 'package:cruise_box/screens/payment_confirmed_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Checkout',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'EDM Saturday',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '<',
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      '\$29',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Ticket for 1',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      child: Container(
                        color: Colors.grey,
                        height: 30,
                        width: 50,
                        child: Icon(Icons.remove),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        color: Colors.grey,
                        height: 30,
                        width: 50,
                        child: Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Payment Method',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Material(
                      elevation: 5.0,
                      color: Colors.red,
                      // borderRadius: BorderRadius.circular(30.0),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EventScreen()));
                        },
                        // minWidth: 200.0,
                        height: 40.0,
                        child: Text(
                          "Credit",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Material(
                      elevation: 5.0,
                      color: Colors.red,
                      // borderRadius: BorderRadius.circular(30.0),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EventScreen()));
                        },
                        // minWidth: 200.0,
                        height: 40.0,
                        child: Text(
                          "Debit",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Material(
                      elevation: 5.0,
                      color: Colors.red,
                      // borderRadius: BorderRadius.circular(30.0),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EventScreen()));
                        },
                        // minWidth: 200.0,
                        height: 40.0,
                        child: Text(
                          "Credit",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Payment Details',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Card Number',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  // controller: _phoneController,
                  onSaved: (val) {
                    // phone = val!;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: "0000 0000 0000 0000",
                      labelText: 'Card Number'),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter Card Number";
                    }
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Cardholder Name',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  // controller: _phoneController,
                  onSaved: (val) {
                    // phone = val!;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: "eg Jonathan Paul Ive",
                      labelText: 'Cardholder Name'),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter Card Name";
                    }
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Text(
                            'Expiry Date',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          TextFormField(
                            textAlign: TextAlign.center,
                            // controller: _phoneController,
                            onSaved: (val) {
                              // phone = val!;
                            },
                            decoration: kTextFieldDecoration.copyWith(
                                hintText: "MM / YYYY", labelText: 'Date'),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter Expiry Date";
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Text(
                            'cvv/cvc',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          TextFormField(
                            textAlign: TextAlign.center,
                            // controller: _phoneController,
                            onSaved: (val) {
                              // phone = val!;
                            },
                            decoration: kTextFieldDecoration.copyWith(
                                hintText: "3-4 digits", labelText: 'Cvc'),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter Last 4 Digits";
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Text(
                          'Save this card for future',
                          style: TextStyle(fontSize: 20),
                        )),
                    SizedBox(height: 5.0),
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
                  height: 20.0,
                ),
                Center(
                  child: Material(
                    elevation: 5.0,
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30.0),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PaymentConfirmedScreen()));
                      },
                      // minWidth: 200.0,
                      height: 40.0,
                      child: Text(
                        "Get Ticket",
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
}
