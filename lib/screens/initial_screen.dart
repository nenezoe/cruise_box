import 'package:cruise_box/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 8000), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SplashScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset('assets/first_page.jpg'),
          ),
          SizedBox(
            height: 80,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(left: 60),
                margin: EdgeInsets.only(left: 20),
                height: 126,
                width: 234,
                alignment: Alignment.bottomCenter,
                child: Image.asset('assets/black_box.jpg'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
