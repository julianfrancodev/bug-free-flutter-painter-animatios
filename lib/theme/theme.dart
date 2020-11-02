import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  ThemeData _currentTheme;

  ThemeData get currentTheme => this._currentTheme;

  bool get darkTheme => this._darkTheme;

  bool get customTheme => this._customTheme;

  ThemeChanger(int theme) {
    switch (theme) {
      case 1:
        this._darkTheme = false;
        this._customTheme = false;
        this._currentTheme = ThemeData.light();
        break;

      case 2:
        this._darkTheme = true;
        this._customTheme = false;
        this._currentTheme = ThemeData.dark();
        break;

      case 3:
        this._darkTheme = false;
        this._customTheme = true;
        break;

      default:
        this._darkTheme = false;
        this._customTheme = false;
        this._currentTheme = ThemeData.light();
    }
  }

  set darkTheme(bool value) {
    _customTheme = false;
    this._darkTheme = value;
    if (value) {
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }

  set customTheme(bool value) {
    _darkTheme = false;
    this._customTheme = value;

    if (value) {
      _currentTheme = ThemeData.dark().copyWith(
        accentColor: Color(0xff48a0eb),
        primaryColorLight: Colors.white,
        scaffoldBackgroundColor: Color(0xff16202b)
      );
    } else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }
}
