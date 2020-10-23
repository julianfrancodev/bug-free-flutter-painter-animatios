import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final percent;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryWitdth;
  final double secondaryWidth;

  RadialProgress(
      {@required this.percent,
      this.primaryColor = Colors.blue,
      this.secondaryColor = Colors.grey,
      this.secondaryWidth = 4.0, this.primaryWitdth = 10.0});

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  double previousPercent;

  @override
  void initState() {
    // TODO: implement initState

    previousPercent = widget.percent;

    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));

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
    controller.forward(from: 0.0);

    final difference = widget.percent - previousPercent;

    previousPercent = widget.percent;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _RadialProgress(
                percent: (widget.percent - difference) +
                    (difference * controller.value),
                primaryColor: widget.primaryColor,
                secondaryColor: widget.secondaryColor,
                secondaryWidth: widget.secondaryWidth, primaryWidth: widget.primaryWitdth),
          ),
        );
      },
    );
  }
}

class _RadialProgress extends CustomPainter {
  final percent;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryWidth;
  final double secondaryWidth;

  _RadialProgress(
      {@required this.percent,
      this.primaryColor,
      this.secondaryColor,
      this.secondaryWidth,this.primaryWidth});

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    final Rect rect = new Rect.fromCircle(
      center: Offset(0,0),
      radius: 180
    );

    final Gradient gradient= new LinearGradient(
      colors: [
        Color(0xffc012ff),
        Color(0xff6d05e8),
        Colors.red
      ]
    );

    final paint = new Paint()
      ..strokeWidth = secondaryWidth
      ..color = secondaryColor
      ..style = PaintingStyle.stroke;

    Offset center = new Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, paint);

    //Arc

    final arcPaint = new Paint()
      ..strokeWidth = primaryWidth
      // ..color = primaryColor
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // filled cricle

    double arcAngle = 2 * pi * (percent / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, arcPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
