import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentConfirmedScreen extends StatefulWidget {
  const PaymentConfirmedScreen({Key? key}) : super(key: key);

  @override
  _PaymentConfirmedScreenState createState() => _PaymentConfirmedScreenState();
}

class _PaymentConfirmedScreenState extends State<PaymentConfirmedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back_ios)),
                      Text(
                        'Done',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Payment Confirmed',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Booking ID #2122AB3',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Image.asset(
                  'assets/image.jpg',
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'EDM Saturdays',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'By kahmi Club',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Date',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  'Sat 29 - Sun 30 Dec 2021',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                Text(
                  '10:00PM - 4:00AM [+1 GMT]',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Location',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  'NIGERIA, Lagos',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '12 Birabi Street, Lekki Phase1',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  'No of Ticket',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  '2 Seat',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
