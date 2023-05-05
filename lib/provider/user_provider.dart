import 'package:flutter/foundation.dart';
import 'package:instagram_clone/model/user_model.dart';
import 'package:instagram_clone/services/auth_firebase.dart';

class UserProvider with ChangeNotifier {
  UserModel? _userModel;
  final AuthServices _authServices = AuthServices();

  UserModel? get getUser => _userModel;

  Future<void> refreshUserData() async {
    UserModel user = await _authServices.getUserData();
    _userModel = user;
    notifyListeners();
  }
}
