import 'package:flutter/material.dart';
import '../Apis/UserApi.dart';
import '../Model/User.dart';

class UserViewModel extends ChangeNotifier {
  User _user = User(0, "获取失败", "无法获取到用户，请重启软件", "", "1970-01-01", "error",false);

  User get user => _user;

  void alterUser(User v){
    _user = v;
    UserApi.uid = v.id;
  }

}