import 'package:flunote/Views/AppView.dart';
import 'package:flunote/Views/LoginViews/LoginView.dart';
import 'package:flunote/Views/NotFoundView.dart';
import 'package:flunote/Views/LoginViews/RegisterView.dart';
import 'package:flunote/Views/Posts/CommentView.dart';
import 'package:flunote/Views/Posts/NewPostEditView.dart';
import 'package:flunote/Views/Posts/SearchPostView.dart';
import 'package:flunote/Views/User/UserDetailView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes{

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static Map<String,Widget> routeMap = {
    "/home":const AppView(),
    "/register":RegisterView(),
    "/login":LoginView(),
    "/newpost":NewPostEditView(),
    "/search":SearchPostView(),
    "/comment":CommentView(),
    "/user": UserDetailView()
  };
  
  static Route generatePage(RouteSettings settings){
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return FadeTransition(opacity: animation,child: routeMap[settings.name] ?? const NotFoundView(),);
      }
    );
  }
  
}