import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  double percent = 0.0;
  double newPercent = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 800));

    controller.addListener(() {
      print('controller value ${controller.value}');
      percent = lerpDouble(percent, newPercent, controller.value);
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh_outlined),
        backgroundColor: Colors.amber,
        onPressed: () {

          percent = newPercent;
          newPercent += 10;
          if (percent > 100) {
            newPercent = 0;
            percent = 0;
          }

          controller.forward(from: 0.0);
          setState(() {});
        },
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5),
          width: 300,
          height: 300,
          // color: Colors.red,
          child: CustomPaint(painter: _RadialProgress(percent: percent)),
        ),
      ),
    );
  }
}

class _RadialProgress extends CustomPainter {
  final percent;

  _RadialProgress({@required this.percent});

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final paint = new Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    Offset center = new Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, paint);

    //Arc

    final arcPaint = new Paint()
      ..strokeWidth = 10
      ..color = Colors.amber
      ..style = PaintingStyle.stroke;

    // filled cricle

    double arcAngle = 2 * pi * (percent / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, arcPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
