import 'package:custom_painter/theme/theme.dart';
import 'package:custom_painter/widgets/slide_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlidesShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLarge;

    if (MediaQuery.of(context).size.height > 500) {
      isLarge = true;
    } else {
      isLarge = false;
    }

    final List<Widget> children = [
      Expanded(child: _SlideShown()),
      Expanded(child: _SlideShown()),
    ];

    return Scaffold(
        body: (isLarge)
            ? Column(
                children: children,
              )
            : Row(
                children: children,
              ));
  }
}

class _SlideShown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return SlideShow(
      slides: [
        SvgPicture.asset('assets/images/slide-1.svg'),
        SvgPicture.asset('assets/images/slide-2.svg'),
        SvgPicture.asset('assets/images/slide-3.svg'),
        SvgPicture.asset('assets/images/slide-4.svg'),
        SvgPicture.asset('assets/images/slide-5.svg'),
      ],
      topDots: false,
      dotPrimaryColor: (appTheme.darkTheme)
          ? appTheme.currentTheme.accentColor
          : Colors.pink,
      secondaryBullet: 12,
    );
  }
}
