import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egemmmm/services/auth.dart';
import 'package:egemmmm/services/database.dart';
import 'package:egemmmm/utils/analytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:egemmmm/objects/user.dart';
import 'package:egemmmm/pages/profilePage.dart';
import 'package:egemmmm/utils/colors.dart';
import 'package:egemmmm/objects/post.dart';
import 'package:egemmmm/posts.dart';
import 'package:egemmmm/utils/style.dart';
import 'package:egemmmm/pages/notifications.dart';
import 'package:provider/provider.dart';

class feed extends StatefulWidget {

  const feed ({Key key, this.analytics,this.observer}) : super(key: key);

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  Feed createState() => Feed();
}

class Feed extends State<feed> {
final AuthService _auth = AuthService();
@override
  void initState() {
    super.initState();

    setCurrentScreen(widget.analytics, widget.observer, 'Feed Page', 'FeedPageState');

  }
  int postCount = 0;
  String _message = "";
  
  void setMessage(String msg) {
    setState(() {
      _message = msg;
    });
  }
  
  Future<void> _setCurrentScreenFeed() async {
    await widget.analytics.setCurrentScreen(screenName: "feed");
    setMessage("setCurrentScreen succeeded");
  }

  var docRef = FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser.uid);
 

  static User1 kus = User1(
      username:"Cicikus",
      name: "boncuk",
      follower_num: 12,
      following_num: 123,
      profilePic: NetworkImage("https://img-s3.onedio.com/id-5b92a91a6c9251e81483d828/rev-0/w-900/h-1021/f-jpg/s-7d72b5ecfd39c21dfe8f76f1a03e62a85720663f.jpg"));

static User1 kus2 = User1(
      username:"Cicikus",
      name: "boncuk",
      follower_num: 12,
      following_num: 123,
      profilePic: NetworkImage("https://img-s3.onedio.com/id-5b92a91a6c9251e81483d828/rev-0/w-900/h-1021/f-jpg/s-7d72b5ecfd39c21dfe8f76f1a03e62a85720663f.jpg"));

static User1 kus3 = User1(
      username:"Cicikus",
      name: "boncuk",
      follower_num: 12,
      following_num: 123,
      profilePic: NetworkImage("https://img-s3.onedio.com/id-5b92a91a6c9251e81483d828/rev-0/w-900/h-1021/f-jpg/s-7d72b5ecfd39c21dfe8f76f1a03e62a85720663f.jpg"));

  

  List<Post> posts = [
    Post(user : kus, location: "Ankara", img: Image(image: NetworkImage("https://img-s3.onedio.com/id-5b92a91a6c9251e81483d828/rev-0/w-900/h-1021/f-jpg/s-7d72b5ecfd39c21dfe8f76f1a03e62a85720663f.jpg"),height: 400,width: 400,) ,text: 'Hello World', date: '19 March 2021', likes: 30, commentNum: 10),
    Post(user : kus, location: "Istanbul", img: Image(image: NetworkImage("https://pbs.twimg.com/profile_images/1322172744197378053/4hyx4j33.jpg"),height: 400,width: 400,) ,text: 'Hello World 2', date: '18 March 2021', likes: 20, commentNum: 20),
    Post(user : kus, location: "Izmir", img: Image(image: NetworkImage("https://i.pinimg.com/originals/bb/bc/9c/bbbc9c2ce9491378e01836fa8c3db282.jpg"),height: 400,width: 400,) ,text: 'Hello World 3', date: '17 March 2021', likes: 10, commentNum: 30),
  ];

  void buttonPressed() {
    setState(() {
      postCount += 1;
    });
  }

  void profilePage() {
    setState(() {
      Navigator.pushNamed(context, '/profile');

    });
  }

  @override
  Widget build(BuildContext context) {

    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().users,
      initialData: null,
          child: Scaffold(
        backgroundColor: Appcolors.bg,

        appBar: AppBar(
          backgroundColor: Appcolors.primary,
          title: Text(
              "Feed",
              style: appbarText
          ),
          actions: <Widget>[
            TextButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text('Logout'),
            ),// appBardaki notifications iconu eklendi
            IconButton(
              iconSize: 40,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => notifications()
                )
                );
              },
              icon: Icon(Icons.notifications),
            ),
          ],
        ),

        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[


            Column(
              children: posts.map((post) => PostCard(
                  post: post,
                  delete: () {
                    setState(() {
                      posts.remove(post);
                    });
                  }
            )).toList(),
          ),

            SizedBox(),
          ],
        ),
      ),
      ),
    );
  }
}
