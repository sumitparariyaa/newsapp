import 'package:flutter/material.dart';


class NavigationState extends ChangeNotifier{
  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  set pageIndex(int newIndex){
    _pageIndex = newIndex;
    notifyListeners();
  }

  void updatePageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }
}