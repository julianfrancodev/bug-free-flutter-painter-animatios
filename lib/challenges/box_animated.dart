import 'package:flutter/material.dart';

class BoxAnimatedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _RectangleAnimated()),
    );
  }
}

class _Rectagle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.red),
    );
  }
}

class _RectangleAnimated extends StatefulWidget {
  @override
  __RectangleAnimatedState createState() => __RectangleAnimatedState();
}

class __RectangleAnimatedState extends State<_RectangleAnimated>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  Animation<double> moveToRight;
  Animation<double> moveToUp;
  Animation<double> moveToLeft;
  Animation<double> moveToDown;

  @override
  void initState() {
    // TODO: implement initState

    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

    moveToRight = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.25, curve: Curves.bounceOut)));
    moveToUp = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.25, 0.50, curve: Curves.bounceOut)));
    moveToLeft = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.5, 0.75, curve: Curves.bounceOut)));
    moveToDown = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.75, 1.0, curve: Curves.bounceOut)));

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
    controller.forward();
    print(moveToRight.value);
    return AnimatedBuilder(
      animation: controller,
      child: _Rectagle(),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(moveToRight.value + moveToLeft.value,
              moveToUp.value + moveToDown.value),
          child: child,
        );
      },
    );
  }
}
