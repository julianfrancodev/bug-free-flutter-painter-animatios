import 'package:flutter/material.dart';

class AnimationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedRectagle(),
      ),
    );
  }
}

class _Rectagle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.red
      ),
    );
  }
}

class AnimatedRectagle extends StatefulWidget {
  @override
  _AnimatedRectagleState createState() => _AnimatedRectagleState();
}

class _AnimatedRectagleState extends State<AnimatedRectagle> {
  @override
  Widget build(BuildContext context) {
    return _Rectagle();
  }
}


