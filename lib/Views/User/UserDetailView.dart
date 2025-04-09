
import 'package:flunote/Views/User/FollowListView.dart';
import 'package:flunote/Views/User/MyPostsView.dart';
import 'package:flutter/material.dart';

class UserDetailView extends StatefulWidget {
  const UserDetailView({super.key});

  @override
  State<UserDetailView> createState() => _UserDetailViewState();
}

class _UserDetailViewState extends State<UserDetailView>  with SingleTickerProviderStateMixin{
  late final TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController  = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("我的"),
        bottom: TabBar(tabs: const [
          Tab(text: "微博"),
          Tab(text: "关注"),
          Tab(text: "粉丝"),
        ],controller: tabController,),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          MyPostsView(),
          FollowListView(follow: true),
          FollowListView(follow: false)
        ]),
    );
  }
}