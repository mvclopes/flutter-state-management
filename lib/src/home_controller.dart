import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  final List<String> _myValues = [];
  List<String> get myValues => _myValues;

  void addNewValue(String newValue) {
    _myValues.add(newValue);
    notifyListeners();
  }

  void removeItem(int index) {
    _myValues.removeAt(index);
    notifyListeners();
  }
}