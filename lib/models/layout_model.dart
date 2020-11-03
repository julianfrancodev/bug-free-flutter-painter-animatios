import 'package:custom_painter/labs/slideshow_page.dart';
import 'package:flutter/material.dart';


class LayoutModel with ChangeNotifier{
  Widget _currentPage = SlideShowPage();

  Widget get currentPage => this._currentPage;

  set currentPage (Widget page){
    this._currentPage = page;
    notifyListeners();
  }

}