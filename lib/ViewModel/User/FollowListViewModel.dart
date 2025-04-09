import 'package:flunote/Apis/UserApi.dart';
import 'package:flutter/material.dart';

class FollowListViewModel extends ChangeNotifier {

  List users= [];

  Future initViewModel(bool follow)async{
    dynamic result;
    if(follow){
      result = await UserApi().getFollowersByUser();
    }else{
      result = await UserApi().getFolloweesByUser();
    }
    if(result == null || !result["result"]) return;
    users = result["data"];
  }

}