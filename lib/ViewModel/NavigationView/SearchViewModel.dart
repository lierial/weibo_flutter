import 'package:flunote/Apis/PostApi.dart';
import 'package:flutter/material.dart';

class SearchViewModel extends ChangeNotifier {

  List<dynamic> posts = [];

  Future initViewModel()async{
    var result = await PostApi().recommendPosts();
    posts = result["data"];
  }

  String getIndexTag(int index){
    print(posts);
    if(posts[index]["tag"] == null) return "";
    if(index >= posts.length) return posts.last["tag"];
    return posts[index]["tag"];
  }

}