import 'package:flunote/Model/Post.dart';
import 'package:flunote/ViewModel/NavigationView/HomeViewModel.dart';
import 'package:flunote/ViewModel/UserViewModel.dart';
import 'package:flunote/Widgets/WeiboItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../App/Routes.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  late final UserViewModel userViewModel;
  final HomeViewModel homeViewModel = HomeViewModel();
  final ScrollController sc = ScrollController();

  @override
  Widget build(BuildContext context) {
    userViewModel = Provider.of<UserViewModel>(context);

    sc.addListener(() async {
      if (sc.offset == sc.position.maxScrollExtent) {
        await Future.delayed(const Duration(seconds: 1));
        homeViewModel.alterCount(homeViewModel.count + 3);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("关注"),
        actions: [
          IconButton(
              onPressed: () =>
                  Routes.navigatorKey.currentState?.pushNamed("/newpost"),
              icon: const Icon(Icons.add))
        ],
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: homeViewModel.initViewModel(userViewModel.user.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ChangeNotifierProvider<HomeViewModel>.value(
                value: homeViewModel,
                builder: (context, child) {
                  return Consumer<HomeViewModel>(
                      builder: (context, hvm, child) {
                    return ListView.builder(
                        itemCount: hvm.posts.length + 1,
                        controller: sc,
                        itemBuilder: (context, index) {
                          if (index == hvm.posts.length) {
                            return Container(
                                width: 60,
                                height: 60,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(10),
                                child: sc.offset < 0.1
                                    ? null
                                    : const CircularProgressIndicator());
                          }
                          Post post = hvm.getPost(index);
                          return WeiboItem(post: post);
                        });
                  });
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
