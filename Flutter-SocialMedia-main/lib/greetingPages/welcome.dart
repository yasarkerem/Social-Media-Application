import 'package:egemmmm/utils/analytics.dart';
import 'package:egemmmm/utils/crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:egemmmm/utils/colors.dart';
import 'package:egemmmm/utils/style.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';


class welcome extends StatefulWidget {
  
  const welcome({Key key, this.analytics, this.observer}) : super(key: key);

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;
  @override
  Welcome createState() => Welcome();
}


class Welcome extends State<welcome> {
 


  void loginPage() {
    Navigator.pushNamed(context, '/login');
  }
  void signupPage() {
    Navigator.pushNamed(context, '/signup');
  }
FirebaseCrashlytics crashlytics = FirebaseCrashlytics.instance;


@override
  void initState() {
    super.initState();

    enableCrashlytics();

    setCurrentScreen(widget.analytics, widget.observer, 'Welcome Page', 'WelcomePageState');
    crashlytics.setUserIdentifier('anonymous');
    crashlytics.setCustomKey('isLoggedIn', false);
    crashlytics.setCustomKey('userID', 26987);
    crashlytics.setCustomKey('isPremiumMember', true);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.bg,
      appBar: AppBar(
        backgroundColor: Appcolors.primary,
        title: Text(
          'WELCOME',
          style: appbarText
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            Center(
              child: Text(
                "Welcome",
                style: headerText
              ),
            ),
            SizedBox(height: 50,),
            Center(
              child: Container(
                width: 400,
                height: 50,

                child:TextButton(
                  child: Text(
                      "Log in".toUpperCase(),
                      style: headerButton
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                    foregroundColor: MaterialStateProperty.all<Color>(Appcolors.primary),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Appcolors.primary),
                        )
                    ),
                  ),
                  onPressed: () => loginPage(),
                ),
              ),
            ),
            SizedBox(height: 5,),
            Center(
              child: Container(
                width: 400,
                height: 50,

                child:TextButton(
                  child: Text(
                      "Sign Up".toUpperCase(),
                      style: headerButton
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                    foregroundColor: MaterialStateProperty.all<Color>(Appcolors.primary),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Appcolors.primary),
                        )
                    ),
                  ),
                  onPressed: () => signupPage(),
                ),
              ),
            ),
            SizedBox(height: 40,),
            Center(
              child: Text(
                "Networking, made easy",
                style: normalText
              ),
            ),
            SizedBox(height: 55,),

        Center(
            child: Container(
              width: 400,
              height: 50,

              child:TextButton(
                child: Text(
                    "Crash".toUpperCase(),
                    style: headerButton
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                  foregroundColor: MaterialStateProperty.all<Color>(Appcolors.primary),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Appcolors.primary),
                      )
                  ),
                ),
                onPressed: () {
                  FirebaseCrashlytics.instance.crash();
                  throw Exception("This is a crash!");
                },
              ),
            ),
          ),

          ],
        ),
      ),
    );
  }
}