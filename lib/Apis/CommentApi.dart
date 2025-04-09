import 'package:flunote/Apis/Request.dart';
import 'package:flunote/Apis/UserApi.dart';

class CommentApi{
  static CommentApi? _instance;
  factory CommentApi() => _instance??CommentApi._();
  CommentApi._(){
    _instance = this;
  }

  Future getAllComment(int pid)async{
    dynamic result = await Request().request("/comment/all/$pid");
    return result;
  }

  Future addComment(int pid,String content)async{
    await Request().request("/comment/add",methods: Methods.POST,params: {
      "uid":UserApi.uid,"pid":pid,"content":content
    });
  }
}