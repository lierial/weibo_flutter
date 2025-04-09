class User{
  int id;
  String name;
  String bio;
  String avatar;
  String created;
  String account;
  int follows = 0;
  int posts = 0;
  int fans = 0;
  bool followed;

  User(this.id,this.name,this.bio,this.avatar,this.created,this.account,this.followed, {this.follows = 0,this.posts=0,this.fans=0});

  factory User.fromJson(dynamic maps) {
    return User(maps["id"], maps["name"], maps["bio"], maps["avatar"], maps["created"], maps["account"],maps["followed"],
        follows: maps["follows"]??0,posts: maps["posts"]??0,fans: maps["fans"]??0);
  }

  Map<String,dynamic> toJson(){
    return {
      "id":id,
      "name":name,
      "bio":bio,
      "avatar":avatar,
      "created":created,
      "account":account
    };
  }
}