import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/data/data.dart';
import 'package:testapp/model/user_model.dart';
import 'package:testapp/routes/app_route.dart';
import 'package:testapp/utils/states.dart';

class AuthProvider with ChangeNotifier {
  bool _isVisible = false;
  bool get isVisible => _isVisible;

  bool _isConfirmVisible = false;
  bool get isconFirm => _isConfirmVisible;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  SignUpStatus _signUpStatus = SignUpStatus.inital;
  SignUpStatus get signUpStatus => _signUpStatus;

  SignStatus _signInStatus = SignStatus.inital;
  SignStatus get sigInStatu => _signInStatus;

  visiblePassowrd() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  clearSignUpField() {
    emailController.clear();
    passwordController.clear();
    nameController.clear();
    confirmController.clear();
  }

  visibleConfirmPassowrd() {
    _isConfirmVisible = !_isConfirmVisible;
    notifyListeners();
  }

  signUp(UserModel user) async {
    _signUpStatus = SignUpStatus.loading;
    try {
      final box = Data.getData();
      box.add(user);
      user.save().then((va) {
        savefunction(user);
      });
      clearSignUpField();

      _signUpStatus = SignUpStatus.scussess;
    } catch (E) {
      _signUpStatus = SignUpStatus.error;
    }
    notifyListeners();
  }

  savefunction(UserModel user) async {
    SharedPreferences prefes = await SharedPreferences.getInstance();
    prefes.setString("userID", user.id.toString());
    prefes.setBool("isLogin", true);

    AppRoute.router.go('/home');
    clearSignUpField();
    notifyListeners();
  }

  signInfunction(String email, String password) async {
    _signInStatus = SignStatus.loading;
    try {
      final box = Data.getData();
      UserModel user = box.values.firstWhere(
          (test) => test.email == email && test.password == password);

      savefunction(user);
      _signInStatus = SignStatus.scussess;
    } catch (E) {
      print("catch");
      _signInStatus = SignStatus.error;
      print(E);
    }
    notifyListeners();
  }
}
