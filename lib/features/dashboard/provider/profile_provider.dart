import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/data/data.dart';
import 'package:testapp/model/user_model.dart';
import 'package:testapp/routes/app_route.dart';

class ProfileProvider with ChangeNotifier {
  UserModel _userModel = UserModel();
  UserModel get usermodel => _userModel;
  getuserProfile() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String id = prefs.getString("userID").toString();
      final box = Data.getData();
      UserModel user = box.values.firstWhere((test) => test.id == id);
      _userModel = user;
    } catch (E) {}
    notifyListeners();
  }

  logoutFuncton() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("userID");
    prefs.setBool("isLogin", false);
    AppRoute.router.go('/auth');
    notifyListeners();
  }
}
