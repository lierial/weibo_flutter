import 'package:flunote/Model/Post.dart';
import 'package:flunote/ViewModel/User/MyPostsViewModel.dart';
import 'package:flunote/Widgets/WeiboItem.dart';
import 'package:flutter/material.dart';

class MyPostsView extends StatelessWidget {
  MyPostsView({super.key});
  final MyPostsViewModel viewModel = MyPostsViewModel();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: viewModel.initViewModel(),
      builder: (context,snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          return ListView.builder(
            itemCount: viewModel.posts.length,
            itemBuilder: (context,index){
              return WeiboItem(post: Post.fromJson(viewModel.posts[index]));
            });
        }
        return const Center(child: CircularProgressIndicator());
      });
  }
}