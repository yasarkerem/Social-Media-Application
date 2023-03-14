import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egemmmm/services/auth.dart';
import 'package:egemmmm/utils/analytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:egemmmm/utils/colors.dart';
import 'package:egemmmm/utils/style.dart';

// ignore: camel_case_types
class editProfile extends StatefulWidget {
  const editProfile({Key key, this.analytics, this.observer}) : super(key: key);

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  EditProfile createState() => EditProfile();
}

class EditProfile extends State<editProfile> {
  String _message = "";
  final AuthService _auth = AuthService();
  @override
  void initState() {
    super.initState();

    setCurrentScreen(widget.analytics, widget.observer, 'editProfile Page',
        'EditProfilePageState');
  }

  void setMessage(String msg) {
    setState(() {
      _message = msg;
    });
  }

  var docRef = FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser.uid);

  Future<void> _setCurrentScreenEProfile() async {
    await widget.analytics.setCurrentScreen(screenName: "editProfile");
    setMessage("setCurrentScreen editProfile succeeded");
  }

  buton() {}

  bool _privateProfileValue = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: docRef.get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          return Scaffold(
            appBar: AppBar(
                title: Text(
                  "Edit profile",
                  style: appbarText,
                ),
                centerTitle: true,
                backgroundColor: Appcolors.primary,
                actions: <Widget>[
                  TextButton.icon(
                    onPressed: () async {
                      await _auth.signOut();
                    },
                    icon: Icon(Icons.person),
                    label: Text('Logout'),
                  ),
                ]),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 25,
                ),

                Center(
                  child: Stack(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(snapshot.data["ppURL"]),
                        radius: 50,
                      ),
                      CircleAvatar(
                        child: FlatButton(
                          child: Icon(
                            Icons.edit,
                            color: Appcolors.second,
                          ),
                          onPressed: buton(),
                        ),
                        backgroundColor: Color(0x39B1BAC1),
                        radius: 50,
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 25,
                ),

                Divider(
                  color: Appcolors.second,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Name",
                      style: boldText,
                    ),
                    SizedBox(
                      width: 38,
                    ),
                    Text(
                      snapshot.data["name"],
                      style: tinyText,
                    ),
                    SizedBox(
                      width: 50,
                      height: 25,
                    ),
                  ],
                ),

                Divider(
                  color: Appcolors.second,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Bio",
                      style: boldText,
                    ),
                    SizedBox(
                      width: 55,
                    ),
                    Text(
                      snapshot.data["bio"],
                      style: tinyText,
                    ),
                    SizedBox(
                      width: 50,
                      height: 25,
                    ),
                  ],
                ),

                SizedBox(
                  height: 25,
                ),
                Divider(
                  color: Appcolors.second,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Location",
                      style: boldText,
                    ),
                    SizedBox(
                      width: 22,
                    ),
                    Text(
                      "Istanbul",
                      style: tinyText,
                    ),
                    SizedBox(
                      width: 50,
                      height: 25,
                    ),
                  ],
                ),

                Divider(
                  color: Appcolors.second,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Website",
                      style: boldText,
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Text(
                      "https://user5829312.com",
                      style: tinyText,
                    ),
                    SizedBox(
                      width: 50,
                      height: 25,
                    ),
                  ],
                ),

                Divider(
                  color: Appcolors.second,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Birth Date",
                      style: boldText,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "02/09/1998",
                      style: tinyText,
                    ),
                    SizedBox(
                      width: 50,
                      height: 25,
                    ),
                  ],
                ),

                Divider(
                  color: Appcolors.second,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "    Private Account",
                      style: boldText,
                    ),
                    SizedBox(width: 1),
                    Switch(
                      value: snapshot.data["private"],
                      onChanged: _updateProfilePrivacy,
                      activeColor: Appcolors.primary,
                    ),
                    SizedBox(width: 1),
                  ],
                ),

                Divider(
                  color: Appcolors.second,
                ),

                //Switch(value: true, onChanged: )
              ],
            ),
          );
        });
  }

  void _updateProfilePrivacy(bool newValue) {
    setState(() async {
      if (newValue) {
        print("The Account is now private");
        //TODO: Privacy Settings for the Account
      }
      _privateProfileValue = newValue;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser.uid)
          .update({
        "private": newValue,
      });
    });
  }
}
