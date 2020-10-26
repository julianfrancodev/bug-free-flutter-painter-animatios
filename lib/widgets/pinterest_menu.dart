import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({@required this.onPressed, @required this.icon});
}

class PinteresMenu extends StatelessWidget {
  final bool show;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;

  PinteresMenu(
      {this.show = true,
      this.activeColor = Colors.black,
      this.inactiveColor = Colors.grey,
      this.backgroundColor = Colors.white, @required this.items});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => new _MenuModel(),
        child: Builder(
          builder: (context) {
            Provider.of<_MenuModel>(context).backgroundColor = backgroundColor;
            Provider.of<_MenuModel>(context).inactiveColor = inactiveColor;
            Provider.of<_MenuModel>(context).activeColor = activeColor;
            return AnimatedOpacity(
              duration: Duration(milliseconds: 250),
              opacity: (show) ? 1 : 0,
              child: _PinterestMenuBackground(
                child: _MenuItems(
                  menuItems: items,
                ),
              ),
            );
          },
        ));
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;

  _PinterestMenuBackground({@required this.child});

  @override
  Widget build(BuildContext context) {

    final backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;

    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5)
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  _MenuItems({this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length,
          (index) => _PinterestMenuButton(index, menuItems[index])),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton pinterestButton;

  _PinterestMenuButton(this.index, this.pinterestButton);

  @override
  Widget build(BuildContext context) {
    final itemSelected = Provider.of<_MenuModel>(context).itemSelected;
    final activeColor = Provider.of<_MenuModel>(context).activeColor;
    final inactiveColor = Provider.of<_MenuModel>(context).inactiveColor;

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSelected = index;
        pinterestButton.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Icon(
        pinterestButton.icon,
        size: (itemSelected == index) ? 30 : 25,
        color: (itemSelected == index) ? activeColor : inactiveColor,
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSelected = 0;
  Color _backgroundColor;
  Color _activeColor;
  Color _inactiveColor;

  int get itemSelected => this._itemSelected;

  Color get backgroundColor => this._backgroundColor;

  Color get activeColor => this._activeColor;

  Color get inactiveColor => this._inactiveColor;

  set itemSelected(int item) {
    this._itemSelected = item;
  }

  set backgroundColor(Color color) {
    this._backgroundColor = color;
  }

  set activeColor(Color color) {
    this._activeColor = color;
  }

  set inactiveColor(Color color) {
    this._inactiveColor = color;
  }
}
