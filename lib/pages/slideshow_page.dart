import 'package:custom_painter/widgets/slide_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlidesShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: _SlideShown()),
          Expanded(child: _SlideShown()),
        ],
      )
    );
  }
}
class _SlideShown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SlideShow(
      slides: [
        SvgPicture.asset('assets/images/slide-1.svg'),
        SvgPicture.asset('assets/images/slide-2.svg'),
        SvgPicture.asset('assets/images/slide-3.svg'),
        SvgPicture.asset('assets/images/slide-4.svg'),
        SvgPicture.asset('assets/images/slide-5.svg'),
      ],
      topDots: false,
      dotPrimaryColor: Colors.red,
      secondaryBullet: 12,
    );
  }
}
