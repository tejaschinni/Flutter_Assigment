import 'package:hive/hive.dart';
import 'package:testapp/model/user_model.dart';

class Data {
  static Box<UserModel> getData() => Hive.box<UserModel>("UserData");
}
