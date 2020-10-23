import 'package:custom_painter/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class CircularGraphics extends StatefulWidget {
  @override
  _CircularGraphicsState createState() => _CircularGraphicsState();
}

class _CircularGraphicsState extends State<CircularGraphics> {
  double percent = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          percent += 10;

          if (percent > 100) {
            percent = 0;
          }

          setState(() {});
        },
        child: Icon(Icons.refresh_outlined),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(percent, Colors.red),
              CustomRadialProgress(percent, Colors.blue),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(percent, Colors.amber),
              CustomRadialProgress(percent, Colors.green),
            ],
          ),

        ],
      )
    );
  }
}

class CustomRadialProgress extends StatelessWidget {

  final double percent;
  final Color primaryColor;

  CustomRadialProgress(this.percent, this.primaryColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      // color: Colors.red,
      child: RadialProgress(
        percent: percent,
        primaryColor: primaryColor,
        secondaryColor: Colors.grey,
        secondaryWidth: 5,
        primaryWitdth: 10,
      ),
    );
  }
}
