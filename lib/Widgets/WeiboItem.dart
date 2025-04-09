import 'package:flunote/Apis/PostApi.dart';
import 'package:flunote/Model/Post.dart';
import 'package:flunote/ViewModel/UserViewModel.dart';
import 'package:flunote/Widgets/FollowButton.dart';
import 'package:flunote/Widgets/UserItem.dart';
import 'package:flunote/Widgets/WebImage.dart';
import 'package:flunote/Widgets/WeiboButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeiboItem extends StatelessWidget {
  WeiboItem({super.key, required this.post, this.detail});
  final Post post;
  final bool? detail;
  final ValueNotifier v = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    v.value = post.isLiked;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserItem(id: post.userId, avatar: post.avatar, name: post.userName, subtitle: post.created, followed: post.isFollowed),
          Padding(padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),child: Text(post.content,textAlign: TextAlign.left,)),
          if(post.images.isNotEmpty) Padding(padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 5.0,crossAxisSpacing: 5.0),
              itemCount: post.images.length,
              itemBuilder: (context,index){
                return WebImage(path: post.images[index]);
              })),
          const Divider(indent: 10.0,endIndent: 10.0,),
          if(detail ?? true) Row(
            children: [
              Expanded(child: WeiboButton(onPressed: (){}, label: null, icon: FontAwesomeIcons.shareFromSquare)),
              Expanded(child: WeiboButton(onPressed: (){
               Navigator.pushNamed(context, "/comment",arguments: post);
              }, label: post.comments.toString(), icon: FontAwesomeIcons.comment)),
              ValueListenableBuilder(valueListenable: v, builder: (context,l,child){
                return Expanded(child: WeiboButton(onPressed: ()async{
                  if(post.isLiked) {
                    post.isLiked = false;
                    post.likes--;
                    v.value=false;
                    PostApi().deletePost(post.id);
                  }else{
                    post.isLiked = true;
                    post.likes++;
                    v.value = true;
                    PostApi().likePost( post.id);
                  }

                }, label: post.likes.toString(), icon: FontAwesomeIcons.thumbsUp,color: post.isLiked?Colors.blue:null));
              }),
            ],
          )
        ],
      ),
    );
  }
  
}