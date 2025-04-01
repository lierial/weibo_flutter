import 'package:flunote/Views/Widgets/FollowButton.dart';
import 'package:flunote/Views/Widgets/WeiboButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeiboItem extends StatelessWidget {
  const WeiboItem({super.key});
  final String content = '''
Flutter是Google开源的应用开发框架， 只要一套代码兼顾Android、iOS、Web、Windows、macOS和Linux六个平台。 Flutter编译为原生机器代码，助力提升应用的流畅度并实现优美的动画效果。Flutter由Dart语言强力驱动，助力高效构建全平台应用。''';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const CircleAvatar(backgroundImage: NetworkImage("https://www.keaitupian.cn/cjpic/frombd/0/253/1152107840/119779555.jpg"),),
            title: const Text("用户名"),
            subtitle: const Text("发布于 2025-03-21 IP:山东"),
            trailing: FollowButton(onPressed: (){}),
          ),
          Padding(padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),child: Text(content)),
          const Divider(indent: 10.0,endIndent: 10.0,),
          Row(
            children: [
              Expanded(child: WeiboButton(onPressed: (){}, label: "300", icon: FontAwesomeIcons.shareFromSquare)),
              Expanded(child: WeiboButton(onPressed: (){}, label: "152", icon: FontAwesomeIcons.comment)),
              Expanded(child: WeiboButton(onPressed: (){}, label: "645", icon: FontAwesomeIcons.thumbsUp))
            ],
          )
        ],
      ),
    );
  }
  
}