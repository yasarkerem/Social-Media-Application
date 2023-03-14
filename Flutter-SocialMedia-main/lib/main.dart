import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:egemmmm/greetingPages/forgot.dart';
import 'package:egemmmm/greetingPages/signup.dart';
import 'package:egemmmm/greetingPages/login.dart';
import 'package:egemmmm/greetingPages/walkthrough.dart';
import 'package:egemmmm/greetingPages/welcome.dart';
import 'package:egemmmm/pages/otherProfiles.dart';
import 'package:egemmmm/pages/profilePage.dart';
import 'package:egemmmm/pages/feed.dart';
import 'package:egemmmm/navigator.dart';
import 'package:egemmmm/pages/search.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:egemmmm/pages/notifications.dart';
import 'package:egemmmm/pages/editProfile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';


import 'greetingPages/wrapper.dart';




int initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt("initScreen");
  await prefs.setInt("initScreen",1);

  /*SharedPreferences prefs1 = await SharedPreferences.getInstance();
  welcomed = await prefs1.getBool("welcomed");
  await prefs1.setInt("welcomed",1);*/

  print('initScreen $initScreen');
  //print('welcomed $welcomed');
  runApp(Wrapper());
}


String initialRoute ()  {
  if(initScreen == 0 || initScreen == null) {
      return "/walk";
    }
  else{
  }
}


//void main() => runApp(MaterialApp(
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 final Future<FirebaseApp> _initialization = Firebase.initializeApp();
 static FirebaseAnalytics analytics = FirebaseAnalytics();
 static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: <NavigatorObserver>[observer],
      initialRoute: initScreen == 0 || initScreen == null ? "/walk" : "/",
    //  initialRoute: "/walk",
      routes: {
        '/': (context) => welcome(),
        '/login': (context) => login(),
        '/forgot': (context) => forgot(),
        '/signup': (context) => signup(),
        '/walk': (context) => WalkThrough(),
        '/profile': (context) => profile(analytics: analytics,observer: observer,),
        '/feed': (context) => feed(analytics: analytics,observer: observer,),
        '/navigator': (context) => MyApp1(),
        '/otherProfile': (context) => otherProfile(analytics: analytics,observer: observer,),
        '/notifications': (context) => notifications(analytics: analytics,observer: observer,),
        '/editProfile': (context) => editProfile(analytics: analytics,observer: observer,),

      },);
  }
}

