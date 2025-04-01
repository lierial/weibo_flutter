import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  int count = 6;
  List posts = [];

  Future initViewModel(int userId)async{
    print("检查UserId:${userId}");
    await Future.delayed(const Duration(seconds: 2));
  }

  void alterCount(int value){
    count = value;
    notifyListeners();
  }


}