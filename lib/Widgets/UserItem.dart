import 'package:bot_toast/bot_toast.dart';
import 'package:flunote/Apis/UserApi.dart';
import 'package:flunote/Widgets/FollowButton.dart';
import 'package:flutter/material.dart';

import '../Model/User.dart';

class UserItem extends StatelessWidget {
  UserItem({super.key, required this.id, required this.avatar, required this.name, required this.subtitle, required this.followed});
  final int id;
  final String avatar;
  final String name;
  final String subtitle;
  final bool followed;
  final ValueNotifier f = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    f.value = followed;
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(avatar)),
      title: Text(name),
      subtitle: Text(subtitle),
      trailing: ValueListenableBuilder(valueListenable: f, builder: (context,fed,child){
        return FollowButton(onPressed: ()async{
          if(UserApi.uid == id){
            BotToast.showText(text: "不能关注自己！");
            return;
          }
          if(f.value){
            UserApi().disFollowUser(id);
          }else{
            UserApi().followUser(id);
          }
          f.value = !f.value;
        }, isFollowed: fed);
      }),
    );
  }
}