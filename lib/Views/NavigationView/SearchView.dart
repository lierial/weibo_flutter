import 'dart:math';

import 'package:flunote/Model/Post.dart';
import 'package:flunote/ViewModel/NavigationView/SearchViewModel.dart';
import 'package:flunote/Widgets/WeiboItem.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});
  final TextEditingController controller = TextEditingController();
  final SearchViewModel searchViewModel = SearchViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 38,
        title: SizedBox(height: 35,child: TextField(
          cursorWidth: 1.0,
          maxLines: 1,
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 10),
            isDense: true,
            suffix: TextButton(onPressed: ()async{
              if(controller.text.isEmpty) return;
              Navigator.pushNamed(context, "/search",arguments: controller.text);
            }, child: const Text("搜索")),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20)
            )
        ),
      ),),),
      body: FutureBuilder(future: searchViewModel.initViewModel(), builder: (context,snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height:110,
                width: 300,
                child: Padding(
                  padding:const EdgeInsets.fromLTRB(8, 10, 5, 5),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 8.0),
                    itemCount: min(10, searchViewModel.posts.length),
                    itemBuilder: (BuildContext context, int index) {
                      return Text(searchViewModel.getIndexTag(index),style: const TextStyle(fontSize: 13),);
                  }),
              )),
              const Text("大家都在搜"),
              Expanded(child: ListView.builder(
                  itemCount: searchViewModel.posts.length,
                  itemBuilder: (context,index){
                    return WeiboItem(post: Post.fromJson(searchViewModel.posts[index]));
                  }))
            ],
          );

        }
        return Container(
            width: 60,
            height: 60,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const CircularProgressIndicator());
      }),
    );
  }
}