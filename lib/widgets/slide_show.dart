import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideShow extends StatelessWidget {
  final List<Widget> slides;
  final bool topDots;
  final Color dotPrimaryColor;
  final Color dotSecondaryColor;
  final double primaryBullet;
  final double secondaryBullet;

  SlideShow(
      {@required this.slides,
      this.topDots = false,
      this.dotPrimaryColor = Colors.blue,
      this.dotSecondaryColor = Colors.grey,
      this.primaryBullet = 12,
      this.secondaryBullet = 12});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SliderShowModel(),
      child: SafeArea(
        child: Center(child: Builder(
          builder: (context) {
            Provider.of<_SliderShowModel>(context).dotPrimaryColor =
                this.dotPrimaryColor;
            Provider.of<_SliderShowModel>(context).dotSecondaryColor =
                this.dotSecondaryColor;

            Provider.of<_SliderShowModel>(context)._bulletPrimary =
                this.primaryBullet;
            Provider.of<_SliderShowModel>(context)._bulletSecondary =
                this.secondaryBullet;

            return _SlidesShows(
              topDots: this.topDots,
              slides: this.slides,
            );
          },
        )),
      ),
    );
  }
}

class _SlidesShows extends StatelessWidget {
  final List<Widget> slides;
  final bool topDots;

  _SlidesShows({@required this.topDots, @required this.slides});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (this.topDots) _Dots(this.slides),
        Expanded(child: _Slides(this.slides)),
        if (!this.topDots) _Dots(this.slides),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final List<Widget> slides;

  _Dots(this.slides);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
            this.slides.map((dot) => _Dot(index: slides.indexOf(dot))).toList(),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  _Dot({
    @required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final slideShowModel = Provider.of<_SliderShowModel>(context);
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: 12,
      width: (slideShowModel._bulletPrimary != 12)
          ? slideShowModel._bulletPrimary
          : (slideShowModel._bulletSecondary != 12)
              ? slideShowModel._bulletSecondary
              : 12,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: (slideShowModel.currentPage >= index - 0.5 &&
                  slideShowModel.currentPage < index + 0.5)
              ? slideShowModel.dotPrimaryColor
              : slideShowModel.dotSecondaryColor,
          shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    // TODO: implement initState
    pageViewController.addListener(() {
      // print(pageViewController.page);

      Provider.of<_SliderShowModel>(context, listen: false).currentPage =
          pageViewController.page;
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides
            .map((slide) => _Slide(
                  slide: slide,
                ))
            .toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  _Slide({@required this.slide});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _SliderShowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _dotPrimaryColor = Colors.blue;
  Color _dotSecondaryColor = Colors.grey;
  double _bulletPrimary;
  double _bulletSecondary;

  double get currentPage => this._currentPage;

  Color get dotPrimaryColor => this._dotPrimaryColor;

  Color get dotSecondaryColor => this._dotSecondaryColor;

  double get bulletPrimary => this._bulletPrimary;

  double get bulletSecondary => this._bulletSecondary;

  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  set dotPrimaryColor(Color color) {
    this._dotPrimaryColor = color;
  }

  set dotSecondaryColor(Color color) {
    this._dotSecondaryColor = color;
  }

  set bulletPrimary(double bullet) {
    this._bulletPrimary = bullet;
    notifyListeners();
  }

  set bulletSecondary(double bullet) {
    this._bulletSecondary = bullet;
    notifyListeners();
  }
}
