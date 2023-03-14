import 'package:flutter/material.dart';
import 'package:egemmmm/utils/colors.dart';
import 'package:egemmmm/utils/style.dart';
import 'package:egemmmm/objects/post.dart';

class PostCard extends StatelessWidget {

  final Post post;
  final Function delete;
  PostCard({ this.post, this.delete });

  void load_comments(){}

  @override
  Widget build(BuildContext context) {
    return Card(

      margin: EdgeInsets.fromLTRB(0, 8.0, 0.0, 8.0),
      child: Padding(

        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

              Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: post.user.profilePic,
                  radius: 20,
                  backgroundColor: Color(0xFF229A98),
                ),
                TextButton(onPressed: load_comments,
                  child: Text("${post.user.username}",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w400,
                      color: Appcolors.second,
                      letterSpacing: -1.5,
                    ),
                  ),
                ),
                ]
              ),
               Row(
                children: <Widget>[
                 Icon(Icons.location_on_outlined,color: Appcolors.second,),
                 SizedBox(width: 5,),
                 Text("${post.location}",
                   style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                    color: Appcolors.second,
                     letterSpacing: -1.5,
                  ),
                 ),
                 ]
               ),
              ],
            ),

            Divider(),
/*
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.location_on_outlined,color: Appcolors.second,),
                SizedBox(width: 10,),
                Text("Location",style: normalText,),
              ],
            ),
            Divider(),
*/


            post.img,

            Divider(),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //SizedBox(width: 5,),
                SizedBox(
                  width: 40,
                  height: 40,
                   child: IconButton(
                       padding: EdgeInsets.all(0.0),
                       icon:Icon(
                         Icons.favorite_border,
                          color: Appcolors.second,
                          size: 30,
                       ),
                       onPressed: delete
                   ),
                ),
                //SizedBox(width: 10,),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: IconButton(
                      padding: EdgeInsets.all(0.0),
                      icon:Icon(
                        Icons.mode_comment_outlined,
                        color: Appcolors.second,
                        size: 30,
                      ),
                      onPressed: delete
                  ),
                ),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: IconButton(
                      padding: EdgeInsets.all(0.0),
                      icon:Icon(
                        Icons.refresh,
                        color: Appcolors.second,
                        size: 30,
                      ),
                      onPressed: delete
                  ),
                ),

                SizedBox(width: 5,),
                Text(
                  "Liked by ${post.likes} people",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    color: Appcolors.second,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),



            Row(
              children: <Widget>[
                SizedBox(width: 6,),
                Text(
                post.text,
                style: TextStyle(
                 fontSize: 15.0,
                 fontWeight: FontWeight.w400,
                 color: Appcolors.highlight,
                ),
              ),
              ]
            ),

            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[

              TextButton(onPressed: load_comments,
                 child: Text("View all ${post.commentNum} comments",
                   style: TextStyle(
                     fontSize: 15.0,
                     fontWeight: FontWeight.w400,
                     color: Appcolors.second,
                   ),
                 ),
              ),
            ]
            ),



            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  post.date,
                  style: TextStyle(
                    fontFamily: 'BrandonText',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: Appcolors.second,
                  ),
                ),


                IconButton(
                  icon: Icon(
                    Icons.delete,
                    size: 16.0,
                  ),
                  onPressed: delete,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}