import 'package:flutter/material.dart';

class Team extends ChangeNotifier {
  final List<String> _names = [];

  get names => _names;
  void add(String name) {
    if (_names.contains(name)) {
      return;
    }

    _names.add(name);
    notifyListeners();
  }
}
