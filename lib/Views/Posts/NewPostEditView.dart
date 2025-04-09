import 'package:bot_toast/bot_toast.dart';
import 'package:flunote/Apis/PostApi.dart';
import 'package:flunote/Apis/UserApi.dart';
import 'package:flunote/App/Routes.dart';
import 'package:flunote/Dialog/InputDialog.dart';
import 'package:flunote/Model/Post.dart';
import 'package:flunote/ViewModel/UserViewModel.dart';
import 'package:flunote/Widgets/WebImage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../ViewModel/Posts/NewPostEditViewModel.dart';

class NewPostEditView extends StatelessWidget {
  NewPostEditView({super.key});
  final TextEditingController tag = TextEditingController();
  final TextEditingController tec = TextEditingController();
  NewPostEditViewModel newPostEditViewModel = NewPostEditViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("新帖子"),
          centerTitle: true,
        ),
        body: ChangeNotifierProvider.value(
          value: newPostEditViewModel,
          builder: (context,child){
            return Consumer<NewPostEditViewModel>(
              builder: (context,nvm,child){
                return SingleChildScrollView(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 160,
                        height: 30,
                        margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 180, 180, 180),
                            borderRadius: BorderRadius.circular(15)),
                        child: TextField(
                          maxLines: 1,
                          style: const TextStyle(fontSize: 10),
                          controller: tag,
                          decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.fromLTRB(8,10,0,0),
                              border: InputBorder.none, hintText: "#输入话题"),
                        )),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      margin: const EdgeInsets.all(8),
                      height: 230,
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          TextField(
                              controller: tec,
                              decoration: const InputDecoration(
                                  isDense: true,
                                  border: InputBorder.none, hintText: "在此编辑帖子..."),
                              maxLines: 10)
                        ],
                      ),
                    ),
                    TextButton(onPressed: ()async{
                      var result = await showDialog(context: context, builder: (context)=>InputDialog());
                      if(result == null) return;
                      nvm.addImage(result["content"]);
                    }, child: const Text("添加图片")),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 5.0,mainAxisSpacing: 5.0),
                          itemCount: nvm.images.length,
                          itemBuilder: (context,index){
                            return WebImage(path: nvm.images[index]);
                          })
                    )
                  ],
                ));
              });
          },
        ),
        bottomSheet: Align(
          heightFactor: 1.0,
          alignment: const Alignment(0.9, 0.0),
          child: ElevatedButton(onPressed: ()async{
            if(tag.text.isEmpty || tec.text.isEmpty){
              BotToast.showText(text: "话题或内容不可为空");
              return;
            }
            await PostApi().addPost(Post.simple(UserApi.uid, tag.text, tec.text, newPostEditViewModel.images));
            BotToast.showText(text: "提交成功");
            Navigator.pop(context);
          }, child: const Text("提交")),
        ),
    );
  }

}
