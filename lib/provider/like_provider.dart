import 'package:flutter/material.dart';

class LikesProvider extends ChangeNotifier {
  bool _isLikeAnimating = false;

  bool get isLikeAnimated => _isLikeAnimating;

  void setLikeAnimated(bool value) {
    _isLikeAnimating = value;
    notifyListeners();
  }
}
