import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/routes/app_route.dart';

class SplashProvider with ChangeNotifier {
  checkIfUserLogin() async {
    SharedPreferences prefes = await SharedPreferences.getInstance();
    try {
      if (prefes.containsKey("isLogin")) {
        bool isLogin = prefes.getBool("isLogin")!;
        if (isLogin == true) {
          AppRoute.router.go('/home');
        } else {
          AppRoute.router.go('/auth');
        }
      } else {
        AppRoute.router.go('/auth');
      }
    } catch (E, _) {
      print(E);
      print(_);
    }
    notifyListeners();
  }
}
