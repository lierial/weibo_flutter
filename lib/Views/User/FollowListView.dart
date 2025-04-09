import 'package:flunote/Model/User.dart';
import 'package:flunote/ViewModel/User/FollowListViewModel.dart';
import 'package:flunote/Widgets/UserItem.dart';
import 'package:flutter/material.dart';

class FollowListView extends StatelessWidget {
  FollowListView({super.key, required this.follow});
  final bool follow;
  final FollowListViewModel viewModel = FollowListViewModel();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: viewModel.initViewModel(follow),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return ListView.builder(
                itemCount: viewModel.users.length,
                itemBuilder: (context,index){
                  User user = User.fromJson(viewModel.users[index]);
                  return UserItem(
                    id:user.id,
                    avatar: user.avatar,
                    name: user.name,
                    subtitle: user.bio,
                    followed: user.followed,
                  );
                });
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}