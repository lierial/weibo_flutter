import 'package:flutter/material.dart';

class NewPostEditViewModel extends ChangeNotifier {

  List<String> images = [];

  void addImage(String link){
    if(images.length>=9) return;
    images.add(link);
    notifyListeners();
  }

}