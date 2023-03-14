import 'package:flutter/cupertino.dart';
import 'package:egemmmm/objects/user.dart';

class Post {

  User1 user;
  String location;
  Image img;
  String text;
  String date;
  int likes;
  int commentNum;
  List<String> comments;

  Post({
    this.user,
    this.location,
    this.img,
    this.text,
    this.date,
    this.likes,
    this.commentNum,
    this.comments
  });
}

class Comment {
  String comment;
  User1 user;
  int likes;

  Comment({
    this.comment,
    this.user
  });

}
