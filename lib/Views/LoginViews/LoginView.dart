import 'package:bot_toast/bot_toast.dart';
import 'package:flunote/Apis/UserApi.dart';
import 'package:flunote/ViewModel/UserViewModel.dart';
import 'package:flunote/Views/Widgets/ComButton.dart';
import 'package:flunote/Views/Widgets/InputField.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../App/Routes.dart';
import '../../Model/User.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  TextEditingController acc = TextEditingController();
  TextEditingController pas = TextEditingController();
  var isAllow = ValueNotifier<bool>(false);
  late UserViewModel userViewModel;
  Map? arg;

  @override
  Widget build(BuildContext context) {
    arg = ModalRoute.of(context)?.settings.arguments as Map?;
    if(arg != null){
      acc.text = arg!["acc"];
      pas.text = arg!["psd"];
    }
    userViewModel = Provider.of<UserViewModel>(context);
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          const SizedBox(height: 60),
          const Text("登录",style: TextStyle(fontSize: 25)),
          InputField(labelText: "账号",controller: acc,),
          InputField(labelText: "密码",controller: pas,obscureText: true,),
          ComButton(label: '登录', onPressed:onLoginButtonClick,),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.qq,color: Colors.lightBlue)),
              IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.weixin,color: Colors.lightBlue)),
              IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.github,color: Colors.lightBlue)),
            ],
          ),
          Row(mainAxisAlignment:MainAxisAlignment.center,children: [
            ValueListenableBuilder<bool>(valueListenable: isAllow, builder: (context,allow,child){
              return Checkbox(value: allow, onChanged: (value){
                isAllow.value = value ?? false;
              });
            }),
            RichText(text: const TextSpan(style: TextStyle(color: Colors.black),children: [
              TextSpan(text: "我已阅读并同意"),
              TextSpan(text: "《用户协议》",style: TextStyle(color: Colors.orange)),
              TextSpan(text: "《隐私政策》",style: TextStyle(color: Colors.orange)),
            ]))
          ],),
          ComButton(label: "创建账号", onPressed: onRegisterButtonClick,color: const Color(0xFF8470FF),),
          const SizedBox(height: 20,)
        ],
      )),
    );
  }

  void onRegisterButtonClick()async{
    Routes.navigatorKey.currentState?.pushNamed( "/register");
  }

  void onLoginButtonClick()async{
    if(!isAllow.value){
      BotToast.showText(text: "请先勾选同意隐私政策");
      return;
    }
    if(acc.text.isEmpty || pas.text.isEmpty){
      BotToast.showText(text: "账号密码为空，请重新输入！");
      return;
    }
    var cancel = BotToast.showLoading();
    var result = await UserApi().checkUser(acc.text, pas.text);
    if(result !=null && result["result"]) {
      userViewModel.alterUser(User.fromJson(result["data"]));
      cancel();
      Routes.navigatorKey.currentState
          ?.pushNamedAndRemoveUntil("/home", (route) => false);
    }else{
      BotToast.showText(text: result==null?"请求错误":result["message"]);
      cancel();
    }
  }

}