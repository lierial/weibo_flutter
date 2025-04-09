import 'package:flunote/Apis/PostApi.dart';
import 'package:flunote/ViewModel/UserViewModel.dart';
import 'package:flutter/material.dart';

class MyPostsViewModel extends ChangeNotifier {

  List posts = [];

  Future initViewModel()async{
    dynamic result = await PostApi().getPostsByUser();
    if(result == null || !result["result"]) return;
    posts = result["data"];
  }

}