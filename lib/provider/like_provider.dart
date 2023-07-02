import 'package:flutter/material.dart';

class LikesProvider extends ChangeNotifier {
  bool _isLikeAnimated = false;

  bool get isLikeAnimated => _isLikeAnimated;

  void setLikeAnimated(bool value) {
    _isLikeAnimated = value;
    notifyListeners();
  }
}
