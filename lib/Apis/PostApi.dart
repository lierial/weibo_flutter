import 'package:flunote/Apis/Request.dart';
import 'package:flunote/Apis/UserApi.dart';

import '../Model/Post.dart';

class PostApi{
  static PostApi? _instance;
  factory PostApi() => _instance??PostApi._();
  PostApi._(){
    _instance = this;
  }

  Future getFollowsPosts(int page)async{
    dynamic result = await Request().request("/post/follows/${UserApi.uid}?page=$page");
    return result;
  }

  Future addPost(Post post)async{
    dynamic result = await Request().request("/post/add",methods: Methods.POST,params: post.toSimpleJson());
    return result;
  }

  Future searchPost(String text)async{
    dynamic result = await Request().request("/post/search/${UserApi.uid}?text=$text");
    return result;
  }

  Future likePost(int pid)async{
    dynamic result = await Request().request("/post/like",params: {
      "uid":UserApi.uid,"pid":pid
    },methods: Methods.POST);
  }

  Future deletePost(int pid)async{
    await Request().request("/post/dlike",params: {
      "uid":UserApi.uid,"pid":pid
    },methods: Methods.POST);
  }

  Future recommendPosts()async{
    dynamic result = await Request().request("/post/recommend/${UserApi.uid}");
    return result;
  }

  Future getPostsByUser()async{
    dynamic result = await Request().request("/post/my/${UserApi.uid}");
    return result;
  }
}