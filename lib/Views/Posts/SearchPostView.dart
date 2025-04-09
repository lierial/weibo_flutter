import 'package:flunote/Model/Post.dart';
import 'package:flunote/ViewModel/Posts/SearchPostViewModel.dart';
import 'package:flunote/Widgets/WeiboItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPostView extends StatelessWidget {
  SearchPostView({super.key});
  final SearchPostViewModel searchPostViewModel = SearchPostViewModel();

  @override
  Widget build(BuildContext context) {
    String keyWord = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: const Text("搜索结果")),
      body:FutureBuilder(
        future: searchPostViewModel.initSearchView(keyWord),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return  ChangeNotifierProvider.value(
              value: searchPostViewModel,
              builder: (context,child){
                return Consumer<SearchPostViewModel>(
                    builder: (context,spvm,child){
                      return ListView.builder(
                        itemCount: spvm.posts.length,
                        itemBuilder: (context,index){
                          Post post = Post.fromJson(spvm.posts[index]);
                          return WeiboItem(post: post);
                        });
                    });
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
    );
  }
}