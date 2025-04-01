import 'package:flunote/ViewModel/UserViewModel.dart';
import 'package:flunote/Views/Widgets/VIconButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class UserView extends StatelessWidget {
  UserView({super.key});
  late UserViewModel userViewModel;

  @override
  Widget build(BuildContext context) {
    userViewModel = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.userPlus,size: 16)),
        IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.qrcode,size: 16)),
        IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.gear,size: 16)),
      ],),
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage(userViewModel.user.avatar)),
            title: Text(userViewModel.user.name),
            subtitle: Text("用户简介:${userViewModel.user.bio}"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: RichText(text: TextSpan(children: [
                TextSpan(text: "${userViewModel.user.posts}",style: const TextStyle(fontSize: 16,color: Colors.black)),
                const TextSpan(text: "\n微博",style: TextStyle(fontSize: 11,color: Colors.grey)),
              ]),textAlign: TextAlign.center,)),
              Expanded(child: RichText(text: TextSpan(children: [
                TextSpan(text: "${userViewModel.user.follows}",style: const TextStyle(fontSize: 16,color: Colors.black)),
                const TextSpan(text: "\n关注",style: TextStyle(fontSize: 11,color: Colors.grey)),
              ]),textAlign: TextAlign.center,)),
              Expanded(child: RichText(text: TextSpan(children: [
                TextSpan(text: "${userViewModel.user.fans}",style: const TextStyle(fontSize: 16,color: Colors.black)),
                const TextSpan(text: "\n粉丝",style: TextStyle(fontSize: 11,color: Colors.grey)),
              ]),textAlign: TextAlign.center,)),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: VIconButton(icon: FontAwesomeIcons.image, label: "我的相册")),
                    Expanded(child: VIconButton(icon: FontAwesomeIcons.medal, label: "我的赞过")),
                    Expanded(child: VIconButton(icon: FontAwesomeIcons.clockRotateLeft, label: "浏览历史")),
                    Expanded(child: VIconButton(icon: FontAwesomeIcons.envelopeOpenText, label: "草稿箱")),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: VIconButton(icon: FontAwesomeIcons.wallet, label: "我的钱包")),
                    Expanded(child: VIconButton(icon: FontAwesomeIcons.listCheck, label: "我的订单")),
                    Expanded(child: VIconButton(icon: FontAwesomeIcons.lightbulb, label: "创作中心")),
                    Expanded(child: VIconButton(icon: FontAwesomeIcons.calendar, label: "粉丝头条")),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}