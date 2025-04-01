import 'package:flunote/Apis/Request.dart';

import '../Model/User.dart';

class UserApi{
  static UserApi? _instance;
  static UserApi get instance => _instance ?? UserApi._();
  factory UserApi() => instance;
  UserApi._();

  Future<User> getUserById(int uid)async{
    var result = await Request().request("/user/get/$uid");
    return User.fromJson(result["data"]);
  }

  Future<User> getUserByAcc(String acc)async{
    var result = await Request().request("/user/getacc/$acc");
    return User.fromJson(result["data"]);
  }

  Future<dynamic> checkUser(String acc,String psd)async{
    var result = await Request().request("/user/login",methods: Methods.POST,params: {
      "acc":acc,"psd":psd
    });
    return result;
  }

  Future insertUser(String username,String acc,String psd)async{
    var result = await Request().request("/user/insert",params: {
      "name":username,
      "acc":acc,
      "psd":psd
    },methods: Methods.POST);
    return result;
  }

}