import 'package:custom_painter/theme/theme.dart';
import 'package:custom_painter/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinteresPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        // body: PinteresMenu(),
        body: Stack(
          children: [_PinterestGrid(), _PinterestMenuPositioned()],
        ),
      ),
    );
  }
}

class _PinterestMenuPositioned extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size;

    final show = Provider.of<_MenuModel>(context).show;

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Positioned(
        bottom: 30,
        child: Container(
          width: width.width,
          child: Align(
            child: PinteresMenu(
              backgroundColor: appTheme.scaffoldBackgroundColor,
              activeColor: appTheme.accentColor,
              show: show,
              inactiveColor: Colors.blueGrey,
              items: [
                PinterestButton(
                    icon: Icons.pie_chart,
                    onPressed: () => print("Icon pie chart")),
                PinterestButton(
                    icon: Icons.search, onPressed: () => print("Icon search")),
                PinterestButton(
                    icon: Icons.notifications_active_outlined,
                    onPressed: () => print("Icon notifications")),
                PinterestButton(
                    icon: Icons.supervised_user_circle_outlined,
                    onPressed: () => print("Icon user"))
              ],
            ),
          ),
        ));
  }
}

class _PinterestGrid extends StatefulWidget {
  @override
  __PinterestGridState createState() => __PinterestGridState();
}

class __PinterestGridState extends State<_PinterestGrid> {
  final List items = List.generate(200, (index) => index);

  ScrollController controller = new ScrollController();
  double beforeScroll = 0;

  @override
  void initState() {
    // TODO: implement initState
    controller.addListener(() {
      if (controller.offset > beforeScroll) {
        Provider.of<_MenuModel>(context, listen: false).show = false;
      } else if (controller.offset == 0.0 || beforeScroll == 0.0) {
        Provider.of<_MenuModel>(context, listen: false).show = true;
      } else {
        Provider.of<_MenuModel>(context, listen: false).show = true;
      }

      beforeScroll = controller.offset;
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
    return new StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinteresItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinteresItem extends StatelessWidget {
  final int index;

  _PinteresItem(this.index);

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(20)),
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}

class _MenuModel with ChangeNotifier {
  bool _show = true;

  bool get show => this._show;

  set show(bool show) {
    this._show = show;
    notifyListeners();
  }
}
