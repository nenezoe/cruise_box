import 'package:cruise_box/screens/screen1.dart';
import 'package:cruise_box/screens/screen2.dart';
import 'package:cruise_box/screens/screen3.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = PageController(
    initialPage: 0,
  );
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageIndicatorContainer(
        child: PageView(
          children: <Widget>[
            FirstScreen(),
            SecondScreen(),
            ThirdScreen(),
          ],
          controller: controller,
          onPageChanged: (SplashScreen) => {print(SplashScreen.toString())},
          pageSnapping: true,
          scrollDirection: Axis.horizontal,
        ),
        align: IndicatorAlign.bottom,
        length: 3,
        indicatorSpace: 20.0,
        padding: const EdgeInsets.all(10),
        indicatorColor: Colors.blueGrey,
        indicatorSelectorColor: Colors.blue,
        shape: IndicatorShape.circle(size: 12),
        // shape: IndicatorShape.roundRectangleShape(size: Size.square(12),cornerSize: Size.square(3)),
        // shape: IndicatorShape.oval(size: Size(12, 8)),

        // body: PageView(
        //   controller: controller,
        //   onPageChanged: (SplashScreen) => {
        //     print(SplashScreen.toString())
        //   },
        //   pageSnapping: true,
        //   scrollDirection: Axis.horizontal,
        //   children: <Widget>[
        //     FirstScreen(),
        //     SecondScreen(),
        //     ThirdScreen(),
        //   ],
        // ),
      ),
    );
  }
}
