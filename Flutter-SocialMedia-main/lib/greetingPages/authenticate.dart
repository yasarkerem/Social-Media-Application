import 'package:egemmmm/greetingPages/login.dart';
import 'package:egemmmm/greetingPages/welcome.dart';
import 'package:egemmmm/pages/feed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../navigator.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print('User: $user');

    if (user == null) {
      return MyApp();
    } else {
      return MyApp1();
    }
  }
}
