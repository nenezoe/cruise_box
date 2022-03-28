import 'package:cruise_box/screens/event_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetScreen extends StatelessWidget {
  const BottomSheetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff757575),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomPaint(
                  painter: CirclePainter(),
                ),
              ),
              Center(),
              SizedBox(
                height: 10,
              ),
              Text('Successful!'),
              Material(
                elevation: 5.0,
                color: Colors.red,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EventScreen()));
                  },
                  // minWidth: 200.0,
                  height: 40.0,
                  child: Text(
                    "Home",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.amber;
    paint.strokeWidth = 5;

    paint.color = Colors.blue;
    paint.style = PaintingStyle.stroke;
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 4, paint);

    paint.color = Colors.green;

    var path = Path();
    path.moveTo(size.width / 3, size.height * 3 / 4);
    path.lineTo(size.width / 2, size.height * 5 / 6);
    path.lineTo(size.width * 3 / 4, size.height * 4 / 6);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
