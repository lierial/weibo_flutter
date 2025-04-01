import 'package:flunote/Views/NavigationView/HomeView.dart';
import 'package:flunote/Views/NavigationView/MessageView.dart';
import 'package:flunote/Views/NavigationView/SearchView.dart';
import 'package:flunote/Views/NavigationView/UserView.dart';
import 'package:flunote/Views/NavigationView/VideoView.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});
  @override
  State<StatefulWidget> createState() => _AppViewState();
}


class _AppViewState extends State<AppView>{
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:IndexedStack(
        index: currentIndex,
        children: [
          HomeView(),
          SearchView(),
          UserView()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int index){
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house,size: 18),
            label: "首页"),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.magnifyingGlass,size: 18,),
            label: "搜索"),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.solidUser,size: 18),
            label: "我")
        ]),
    );
  }
}