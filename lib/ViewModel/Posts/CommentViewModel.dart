import 'package:flunote/Apis/CommentApi.dart';
import 'package:flutter/material.dart';

class CommentViewModel extends ChangeNotifier {

  List comments = [];

  Future initViewModel(int pid)async{
    dynamic result = await CommentApi().getAllComment(pid);
    if(result == null || !result["result"]) return;
    comments = result["data"];
  }

}