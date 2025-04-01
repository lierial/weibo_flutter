class Post{
  int id;
  int userId;
  String tag;
  String content;
  List<String> images;
  int likes;
  int comments;
  int shares;
  String created;

  Post(this.id,this.userId,this.tag,this.content,this.images,this.likes,this.comments,this.shares,this.created);

  factory Post.fromJson(dynamic map){
    return Post(map["id"], map["userId"], map["tag"],
        map["content"], map["images"].toString().split("||"), map["likes"], map["comments"], map["shares"], map["created"]);
  }

  dynamic toJson(){
    return {
      "id":id,
      "userId":userId,
      "tag":tag,
      "content":content,
      "images":images.join("||"),
      "likes":likes,
      "comments":comments,
      "shares":shares,
      "created":created
    };
  }
}