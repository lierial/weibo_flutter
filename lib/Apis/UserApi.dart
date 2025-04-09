
import 'package:flunote/Apis/Request.dart';

import '../Model/User.dart';

class UserApi{
  static UserApi? _instance;
  static int uid = 0;
  factory UserApi() => _instance ?? UserApi._();
  UserApi._(){
    _instance = this;
  }


  Future<User> getUserById()async{
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

  Future getFollowersByUser()async{
    dynamic result = await Request().request("/user/follower/$uid");
    return result;
  }

  Future getFolloweesByUser()async{
    dynamic result = await Request().request("/user/followee/$uid");
    return result;
  }

  Future followUser(int fid)async{
    await Request().request("/user/follow/add",methods: Methods.POST,params: {
      "uid":uid,"fid":fid
    });
  }

  Future disFollowUser(int fid)async{
    await Request().request("/user/follow/delete",methods: Methods.POST,params: {
      "uid":uid,"fid":fid
    });
  }
}