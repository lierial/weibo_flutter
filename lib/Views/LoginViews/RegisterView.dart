import 'package:bot_toast/bot_toast.dart';
import 'package:flunote/Apis/UserApi.dart';
import 'package:flunote/ViewModel/UserViewModel.dart';
import 'package:flunote/Views/Widgets/ComButton.dart';
import 'package:flunote/Views/Widgets/InputField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../App/Routes.dart';
import '../../Model/User.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final TextEditingController username = TextEditingController();
  final TextEditingController acc = TextEditingController();
  final TextEditingController psd = TextEditingController();
  late UserViewModel userViewModel;

  @override
  Widget build(BuildContext context) {
    userViewModel = Provider.of<UserViewModel>(context);
    return Scaffold(
      body:SafeArea(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 80),
          const Text("注册",style: TextStyle(fontSize: 25)),
          InputField(labelText: "用户名",allow: false,controller: username,),
          InputField(labelText: "账号",controller: acc,),
          InputField(labelText: "密码",controller: psd,obscureText: true),
          ComButton(label: "注册", onPressed: onRegisterButtonClick),
          const Spacer(),
          ComButton(label: "前往登录", onPressed: onToLoginButtonClick,color:const Color(0xFF6A5ACD)),
          const SizedBox(height: 30)
        ],
      )),
    );
  }

  void onRegisterButtonClick()async{
    if(username.text.isEmpty || acc.text.isEmpty || psd.text.isEmpty){
      BotToast.showText(text: "请勿填写空内容");
      return;
    }
    var cancel = BotToast.showLoading();
    var result = await UserApi().insertUser(username.text,acc.text,psd.text);
    if(result["result"]){
      cancel();
      onToLoginButtonClick();
    }else{
      BotToast.showText(text: result["message"]);
    }
    cancel();
  }

  void onToLoginButtonClick(){
    Routes.navigatorKey.currentState?.pushNamed("/login",arguments: {"acc":acc.text,"psd":psd.text});
  }
}