import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egemmmm/services/auth.dart';
import 'package:egemmmm/utils/analytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:egemmmm/utils/colors.dart';
import 'package:egemmmm/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:egemmmm/objects/post.dart';
import 'package:egemmmm/objects/user.dart';
import 'package:egemmmm/pages/editProfile.dart';
import 'package:egemmmm/posts.dart';
import 'package:provider/provider.dart';

class profile extends StatefulWidget {
  const profile({Key key, this.analytics, this.observer}) : super(key: key);

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  Profile createState() => Profile();
}

class Profile extends State<profile> {
  String _message = "";
  final AuthService _auth = AuthService();
  void setMessage(String msg) {
    setState(() {
      _message = msg;
    });
  }

  @override
  void initState() {
    super.initState();

    setCurrentScreen(
        widget.analytics, widget.observer, 'Profile Page', 'ProfilePageState');
  }

  var docRef = FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser.uid);
  static User1 kus = User1(
      username: "Cicikus",
      name: "boncuk",
      follower_num: 12,
      following_num: 123,
      profilePic: NetworkImage(
          "https://img-s3.onedio.com/id-5b92a91a6c9251e81483d828/rev-0/w-900/h-1021/f-jpg/s-7d72b5ecfd39c21dfe8f76f1a03e62a85720663f.jpg"));

  List<Post> posts = [
    Post(
        user: kus,
        location: "Ankara",
        img: Image(
          image: NetworkImage(
              "https://img-s3.onedio.com/id-5b92a91a6c9251e81483d828/rev-0/w-900/h-1021/f-jpg/s-7d72b5ecfd39c21dfe8f76f1a03e62a85720663f.jpg"),
          height: 400,
          width: 400,
        ),
        text: 'Hello World',
        date: '19 March 2021',
        likes: 30,
        commentNum: 10),
    Post(
        user: kus,
        location: "Istanbul",
        img: Image(
          image: NetworkImage(
              "https://pbs.twimg.com/profile_images/1322172744197378053/4hyx4j33.jpg"),
          height: 400,
          width: 400,
        ),
        text: 'Hello World 2',
        date: '18 March 2021',
        likes: 20,
        commentNum: 20),
    Post(
        user: kus,
        location: "Izmir",
        img: Image(
          image: NetworkImage(
              "https://i.pinimg.com/originals/bb/bc/9c/bbbc9c2ce9491378e01836fa8c3db282.jpg"),
          height: 400,
          width: 400,
        ),
        text: 'Hello World 3',
        date: '17 March 2021',
        likes: 10,
        commentNum: 30),
  ];

  int page = 1;
  int pagenum = 4;
  int followers = 148;
  int following = 146;
  String appbartitle = "Cicikus2";
  String foto =
      "https://pbs.twimg.com/profile_images/1322172744197378053/4hyx4j33.jpg";
  final locations = ['06 Başkent', 'Istanbul 34', 'Antalya 07', 'buzdan'];
  final interests = ['Jogging', 'BodyBuilding', 'Dancing'];

  void nextPage() {
    setState(() {
      if (page != 4) page += 1;
    });
  }

  void edit_profile_page() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => editProfile()),
      (Route<dynamic> route) => true,
    );
  }

  void prevPage() {
    setState(() {
      if (page != 1) followers += 1;
      page -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
          future: docRef.get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            return Scaffold(
              appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: Appcolors.primary,
                  title: Text(
                    snapshot.data["username"],
                    style: appbarText,
                  ),
                  actions: <Widget>[
                    TextButton.icon(
                      onPressed: () async {
                        await _auth.signOut();
                      },
                      icon: Icon(Icons.person),
                      label: Text('Logout'),
                    ),
                  ]),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        SizedBox(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            /*
                              PROFIL FOTOSU
                         */
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage(snapshot.data["ppURL"]),
                              radius: 50,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),

                        /*
                 | Followers yazisi ve Follow butonu columnu |

                   */

                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Followers       ",
                                          style: tinyText,
                                        ),
                                        Text(
                                          '$followers          ',
                                          style: TextStyle(
                                            color: Appcolors.third,
                                            fontWeight: FontWeight.w900,
                                            letterSpacing: -1,
                                          ),
                                        ),
                                      ]),
                                  SizedBox(
                                    width: 70,
                                  ),
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("Following ", style: tinyText),
                                        Text(
                                          "$following ",
                                          style: TextStyle(
                                            color: Appcolors.third,
                                            fontWeight: FontWeight.w900,
                                            letterSpacing: -1,
                                          ),
                                        ),
                                      ]),
                                ]),

                            // ignore: deprecated_member_use
                            FlatButton(
                              onPressed: edit_profile_page,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("    Edit Profile  ", style: tinyText),
                                  Icon(
                                    Icons.edit,
                                    color: Appcolors.second,
                                  ),
                                ],
                              ),
                              color: Appcolors.primary,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              minWidth: 280,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 1,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          snapshot.data["name"],
                          //"Babacik Babacik\nIstanbul",
                          style: boldText,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          snapshot.data["bio"],
                          //"Babacik Babacik\nIstanbul",
                          style: tinyText,
                        ),
                      ],
                    ),
                    /*burda posts interests locations
             */

                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FlatButton(
                            onPressed: prevPage,
                            child: Text(
                              "Posts  ",
                              style: buttonText,
                            ),
                            color: Appcolors.primary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            minWidth: 325,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image(
                                image: NetworkImage(
                                    snapshot.data["posts"]["pic1"]),
                                width: 100,
                                height: 100,
                              ),
                              SizedBox(
                                width: 11,
                              ),
                              Image(
                                image: NetworkImage(
                                    snapshot.data["posts"]["pic2"]),
                                width: 100,
                                height: 100,
                              ),
                              SizedBox(
                                width: 11,
                              ),
                              Image(
                                image: NetworkImage(
                                    snapshot.data["posts"]["pic3"]),
                                width: 100,
                                height: 100,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image(
                                image: NetworkImage(
                                    snapshot.data["posts"]["pic4"]),
                                width: 100,
                                height: 100,
                              ),
                              SizedBox(
                                width: 11,
                              ),
                              Image(
                                image: NetworkImage(
                                    snapshot.data["posts"]["pic5"]),
                                width: 100,
                                height: 100,
                              ),
                              SizedBox(
                                width: 11,
                              ),
                              Image(
                                image: NetworkImage(
                                    snapshot.data["posts"]["pic6"]),
                                width: 100,
                                height: 100,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Center(
                      child: Container(
                        color: Theme.of(context).accentColor.withOpacity(0.1),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Text Posts", style: boldText),
                              ],
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [Text(snapshot.data["TextPost"])])
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Center(
                      child: Column(
                        children: <Widget>[
                          FlatButton(
                            onPressed: prevPage,
                            child: Text(
                              "Interests  ",
                              style: buttonText,
                            ),
                            color: Appcolors.ProfileColors[3],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            minWidth: 325,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FlatButton(
                                onPressed: prevPage,
                                child: Text(
                                  interests[0],
                                  style: buttonText,
                                ),
                                color: Appcolors.ProfileColors[0],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                minWidth: 85,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              FlatButton(
                                onPressed: prevPage,
                                child: Text(
                                  interests[1],
                                  style: buttonText,
                                ),
                                color: Appcolors.ProfileColors[1],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                minWidth: 85,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              FlatButton(
                                onPressed: prevPage,
                                child: Text(
                                  interests[2],
                                  style: buttonText,
                                ),
                                color: Appcolors.ProfileColors[2],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                minWidth: 85,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        children: <Widget>[
                          FlatButton(
                            onPressed: prevPage,
                            child: Text("Locations  ", style: buttonText),
                            color: Appcolors.ProfileColors[3],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            minWidth: 325,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FlatButton(
                                onPressed: prevPage,
                                child: Text(
                                  locations[0],
                                  style: buttonText,
                                ),
                                color: Appcolors.ProfileColors[0],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                minWidth: 85,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              FlatButton(
                                onPressed: prevPage,
                                child: Text(
                                  locations[1],
                                  style: buttonText,
                                ),
                                color: Appcolors.ProfileColors[1],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                minWidth: 85,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              FlatButton(
                                onPressed: prevPage,
                                child: Text(
                                  locations[2],
                                  style: buttonText,
                                ),
                                color: Appcolors.ProfileColors[2],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                minWidth: 85,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    /*burda posts interests locations
             */

                    SizedBox(),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
