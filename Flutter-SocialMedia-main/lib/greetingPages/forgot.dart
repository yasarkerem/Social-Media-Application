import 'package:egemmmm/utils/analytics.dart';
import 'package:flutter/material.dart';
import 'package:egemmmm/utils/colors.dart';
import 'package:egemmmm/utils/style.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

class forgot extends StatefulWidget {
   const forgot({Key key, this.analytics, this.observer}) : super(key: key);

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;
  @override
  Forgot createState() => Forgot();
}

class Forgot extends State<forgot> {
  void sendEmail() {
    // setState(() {});
  }
@override
  void initState() {
    super.initState();


    setCurrentScreen(widget.analytics, widget.observer, 'Forgot Page', 'ForgotPageState');
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.bg,
      appBar: AppBar(
        backgroundColor: Appcolors.primary,
        title: Text('Reset Password', style: appbarText),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("Enter your E-mail adress", style: headerText),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'E-mail',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 400,
              height: 50,
              child: TextButton(
                child: Text("Send Verification E-Mail".toUpperCase(),
                    style: normalbuttonText),
                style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Appcolors.primary),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Appcolors.primary),
                  )),
                ),
                onPressed: () => sendEmail(),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            SizedBox(
              height: 45,
            ),
          ],
        ),
      ),
    );
  }
}
