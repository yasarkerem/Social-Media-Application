import 'package:egemmmm/greetingPages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:egemmmm/utils/colors.dart';
import 'package:egemmmm/utils/style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:egemmmm/pages/feed.dart';


bool isEnd = false;
class WalkThrough extends StatefulWidget {
  @override
  _WalkThroughState createState() => _WalkThroughState();
}

class _WalkThroughState extends State<WalkThrough> {
  int curr = 0;
  int totalpage = 5;

  List<List<String>> stringList = [
    [
      "WELCOME",
      "The awesome app",
      "assets/connection.jpg",
      "The only social media app you will ever need."
    ],
    [
      "INTRO",
      "Sign up easily",
      "assets/signup.jpg",
      "Use your e-mail and create a password."
    ],
    [
      "PROFILES",
      "Create your profile",
      "assets/profile.jpg",
      "Set your unique username"
    ],
    [
      "CONTENT",
      "Connect with people",
      "assets/nnn.jpg",
      "Follow People, Locations or Interests.."
    ],
    [
      "GET STARTED!",
      "Create your account",
      "assets/creation.jpg",
      "Click 'Next' to get started!"
    ],
  ];

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new welcome()));
    } else {
      await prefs.setBool('seen', true);
     Navigator.of(context).pushReplacement(
         new MaterialPageRoute(builder: (context) => new feed()));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  void nextPage() {
    setState(()  {
      if (curr != 4) {
        curr++;
      } else {
        //isEnd = await _getWalkthroughStatus();
        Navigator.pop(context);
      }
    });
  }

  void _storeWalkthroughStatus(bool isPassedStatus) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("isWalkthroughPassed", isPassedStatus);
  }

  Future<bool> _getWalkthroughStatus() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool("isWalkthroughPassed") ?? false;
  }



  void prevPage() {
    setState(() {
      if (curr == 0) {
        curr = 0;
      } else {
        curr--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.bg,
      appBar: AppBar(
        backgroundColor: Appcolors.primary,
        title: Text(
          stringList[curr][0],
          style: appbarText
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Text(
                stringList[curr][1],
                style: darkheader
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                height: 400,

                image: AssetImage(stringList[curr][2]),

              ),
            ),
            Center(
              child: Text(
                stringList[curr][3],
                style: normalText
              ),
            ),

            SizedBox(height: 1,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: prevPage,
                    child: Text(
                      "Prev",
                      style: normalbuttonText,
                    ),
                  ),
                  Text(
                    "${curr + 1}/$totalpage",
                    style: normalbuttonText,
                  ),
                  OutlinedButton(
                    onPressed: nextPage,
                    child: Text(
                      "Next",
                      style: normalbuttonText,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 1,),
          ],
        ),
      ),
    );
  }
}




