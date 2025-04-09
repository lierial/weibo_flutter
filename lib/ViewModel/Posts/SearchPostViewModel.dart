import 'package:flunote/Apis/PostApi.dart';
import 'package:flunote/ViewModel/UserViewModel.dart';
import 'package:flutter/material.dart';

class SearchPostViewModel extends ChangeNotifier {
  List<dynamic> posts = [];

  Future initSearchView(String text)async{
    var result = await PostApi().searchPost( text);
    if(result == null && !result["result"]) return;
    posts = result["data"];
  }

}