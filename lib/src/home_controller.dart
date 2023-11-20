import 'package:flutter/cupertino.dart';

class HomeController {
  final ValueNotifier<List<String>> _myValues = ValueNotifier<List<String>>([]);
  ValueNotifier<List<String>> get myValues => _myValues;

  void addNewItem(String newItem) {
    _myValues.value = List.from(_myValues.value)..add(newItem);
  }

  void removeItem(int index) {
    _myValues.value = List.from(_myValues.value)..removeAt(index);
  }
}