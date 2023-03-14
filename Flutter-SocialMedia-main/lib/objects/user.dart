import 'package:flutter/cupertino.dart';
import 'package:egemmmm/objects/post.dart';

class User1 {

  String username;
  String name;
  NetworkImage profilePic;
  int follower_num;
  int following_num;
  String email;

  List<Post> posts;
  List<String> interests;
  List<String> locations;

  User1({
    this.username,
    this.name,
    this.profilePic,
    this.follower_num,
    this.following_num,
    this.email,
  });
}