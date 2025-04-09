class Comment{

  int id;
  int userId;
  int postId;
  int parentId;
  String content;
  int likes;
  String created;
  String userName;
  String avatar;

  Comment(this.id,this.userId,this.postId,this.parentId,this.content,this.likes,this.created,this.userName,this.avatar);

  factory Comment.formJson(dynamic map){
    return Comment(map["id"], map["userId"], map["postId"], map["parentId"], map["content"], map["likes"], map["created"],map["userName"],map["avatar"]);
  }



}