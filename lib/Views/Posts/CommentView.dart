import 'package:bot_toast/bot_toast.dart';
import 'package:flunote/Apis/CommentApi.dart';
import 'package:flunote/Model/Comment.dart';
import 'package:flunote/Model/Post.dart';
import 'package:flunote/ViewModel/Posts/CommentViewModel.dart';
import 'package:flunote/Widgets/WeiboItem.dart';
import 'package:flutter/material.dart';

class CommentView extends StatelessWidget {
  CommentView({super.key});
  final CommentViewModel commentViewModel = CommentViewModel();
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Post post = ModalRoute.of(context)?.settings.arguments as Post;
    return Scaffold(
      appBar: AppBar(title: const Text("帖子详情"),),
      body: ListView(
        children: [
          WeiboItem(post: post,detail: false),
          FutureBuilder(future: commentViewModel.initViewModel(post.id), builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: commentViewModel.comments.length,
                itemBuilder: (context,index){
                  Comment c = Comment.formJson(commentViewModel.comments[index]);
                  return ListTile(
                    dense: true,
                    leading: CircleAvatar(backgroundImage: NetworkImage(c.avatar)),
                    titleAlignment: ListTileTitleAlignment.top,
                    title: Text(c.userName,
                      style: TextStyle(color: post.userId==c.userId?Colors.pinkAccent:Colors.black),),
                    subtitle: Text(c.content),
                  );
                });
            }
            return const Center(child: CircularProgressIndicator());
          }),
          const SizedBox(height: 35)
        ],
      ),
      bottomSheet: Row(
        children: [
          Expanded(child: TextField(
            controller: textEditingController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.fromLTRB(10, 3, 3, 3),
              hintText: "发一条友善的评论吧！"
            ),
          )),
          ElevatedButton(onPressed: ()async{
            if(textEditingController.text.isEmpty) {
              BotToast.showText(text: "发送内容不可为空");
              return;
            }
            CommentApi().addComment(post.id, textEditingController.text);
            textEditingController.clear();
            BotToast.showText(text: "发送成功");
          }, child: const Text("发送"))
        ],
      ),
    );
  }
}