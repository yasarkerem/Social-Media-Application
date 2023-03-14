import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egemmmm/utils/analytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:egemmmm/utils/colors.dart';
import 'package:egemmmm/utils/style.dart';

class otherProfile extends StatefulWidget {
  const otherProfile({Key key, this.analytics, this.observer})
      : super(key: key);

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  OtherProfile createState() => OtherProfile();
}

class OtherProfile extends State<otherProfile> {
  int page = 1;
  int pagenum = 4;
  int followers = 148;
  int following = 146;
  String appbartitle = "WELCOME";
  String foto =
      "https://adtechresources.com/wp-content/uploads/2020/02/Mobile-Application.jpeg";
  final locations = ['06 Başkent', 'Istanbul 34', 'Antalya 07', 'buzdan'];
  final interests = ['Jogging', 'BodyBuilding', 'Dancing'];

  @override
  void initState() {
    super.initState();

    setCurrentScreen(widget.analytics, widget.observer, 'OtherProfile Page',
        'OtherProfilePageState');
  }

  void feedPage() {
    setState(() {
      Navigator.pushNamed(context, '/feed');
    });
  }

  void denemePage() {
    setState(() {
      Navigator.pushNamed(context, '/navigator');
    });
  }

  void nextPage() {
    setState(() {
      if (page != 4) page += 1;
    });
  }

  void prevPage() {
    setState(() {
      if (page != 1) followers += 1;
      page -= 1;
    });
  }

  var docRef = FirebaseFirestore.instance
      .collection("users")
      .doc("8aDIounLl9O72sjq8SzZTukjb4F3");

  @override
  Widget build(BuildContext context) {
    if (page == 1) {
      appbartitle = "Mehmet_1234";
      foto =
          "https://adtechresources.com/wp-content/uploads/2020/02/Mobile-Application.jpeg";
    } else if (page == 2) {
      appbartitle = "INTRO";
      foto =
          "https://img-s3.onedio.com/id-5b92a91a6c9251e81483d828/rev-0/w-900/h-1021/f-jpg/s-7d72b5ecfd39c21dfe8f76f1a03e62a85720663f.jpg";
    } else if (page == 3) {
      appbartitle = "PROFILES";
      foto = "https://cdn.pttrns.com/614/7772_f.jpg";
    } else if (page == 4) {
      appbartitle = "CONTENT";
      foto = "https://cdn.pttrns.com/614/7773_f.jpg";
    }

    return FutureBuilder(
        future: docRef.get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Appcolors.primary,
              title: Text(snapshot.data["username"], style: appbarText),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        /*
                            PROFIL FOTOSU
                       */
                        CircleAvatar(
                          backgroundImage: NetworkImage(snapshot.data["ppURL"]),
                          radius: 30,
                        ),
                      ],
                    ),

                    /*
                         | Followers yazisi ve Follow butonu columnu |
                   */
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Followers",
                                style: TextStyle(
                                  color: Appcolors.second,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.5,
                                ),
                              ),
                              Text(
                                '$followers',
                                style: TextStyle(
                                  color: Appcolors.third,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: -1,
                                ),
                              ),
                            ]),
                        FlatButton(
                          onPressed: prevPage,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Follow ",
                                style: TextStyle(
                                  color: Appcolors.second,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.5,
                                ),
                              ),
                              Icon(
                                Icons.star_border,
                                color: Appcolors.second,
                              ),
                            ],
                          ),
                          color: Appcolors.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          minWidth: 160,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Following",
                                style: TextStyle(
                                  color: Appcolors.second,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -1,
                                ),
                              ),
                              Text(
                                "$following",
                                style: TextStyle(
                                  color: Appcolors.third,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: -1,
                                ),
                              ),
                            ]),
                        FlatButton(
                          onPressed: nextPage,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Message  ",
                                style: TextStyle(
                                  color: Appcolors.second,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -1,
                                ),
                              ),
                              Icon(
                                Icons.mail,
                                color: Appcolors.second,
                              ),
                            ],
                          ),
                          color: Appcolors.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          minWidth: 160,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
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
                  ],
                ),
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
                            image: NetworkImage(snapshot.data["posts"]["pic1"]),
                            width: 100,
                            height: 100,
                          ),
                          SizedBox(
                            width: 11,
                          ),
                          Image(
                            image: NetworkImage(snapshot.data["posts"]["pic2"]),
                            width: 100,
                            height: 100,
                          ),
                          SizedBox(
                            width: 11,
                          ),
                          Image(
                            image: NetworkImage(snapshot.data["posts"]["pic3"]),
                            width: 100,
                            height: 100,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: NetworkImage(snapshot.data["posts"]["pic4"]),
                            width: 100,
                            height: 100,
                          ),
                          SizedBox(
                            width: 11,
                          ),
                          Image(
                            image: NetworkImage(snapshot.data["posts"]["pic5"]),
                            width: 100,
                            height: 100,
                          ),
                          SizedBox(
                            width: 11,
                          ),
                          Image(
                            image: NetworkImage(snapshot.data["posts"]["pic6"]),
                            width: 100,
                            height: 100,
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
                        child: Text(
                          "Interests  ",
                          style: TextStyle(
                            color: Appcolors.second,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -1,
                          ),
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
                              style: TextStyle(
                                color: Appcolors.second,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -1,
                              ),
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
                              style: TextStyle(
                                color: Appcolors.second,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -1,
                              ),
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
                              style: TextStyle(
                                color: Appcolors.second,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -1,
                              ),
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
                              style: TextStyle(
                                color: Appcolors.second,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -1,
                              ),
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
                SizedBox(),
              ],
            ),
          );
        });
  }
}
