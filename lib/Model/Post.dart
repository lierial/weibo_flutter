class Post{
  int id;
  int userId;
  String tag;
  String content;
  List<String> images;
  int likes;
  int comments;
  String created;
  String userName;
  String avatar;
  bool isFollowed;
  bool isLiked;

  Post(this.id,this.userId,this.tag,this.content,this.images,this.likes,this.comments,this.created,this.userName,this.avatar,this.isFollowed,this.isLiked);

  factory Post.fromJson(dynamic map){
    List<String> images = map["images"].split("||");
    if(images.isNotEmpty && images[0] == "") images = [];
    return Post(map["id"], map["userId"], map["tag"],
        map["content"], images, map["likes"],
        map["comments"], map["created"],map["userName"],map["avatar"],
      map["followed"],map["liked"]
    );
  }

  factory Post.simple(int uid,String tag,String content,List<String> images){
    return Post(0, uid, tag, content, images, 0, 0, "", "", "", false, false);
  }

  Map<String,dynamic> toJson(){
    return {
      "id":id,
      "userId":userId,
      "tag":tag,
      "content":content,
      "images":images.join("||"),
      "likes":likes,
      "comments":comments,
      "created":created
    };
  }

  Map<String,dynamic> toSimpleJson(){
    return {
      "uid":userId,
      "tag":tag,
      "content":content,
      "images":images.join("||"),
    };
  }
}