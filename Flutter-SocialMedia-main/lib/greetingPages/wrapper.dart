
import 'package:egemmmm/greetingPages/authenticate.dart';
import 'package:egemmmm/greetingPages/no_firebase.dart';
import 'package:egemmmm/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {

    // return either the Home or Authenticate widget
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot){
        if(snapshot.hasError) {
          print('Cannot connect to firebase: '+snapshot.error);
          return MaterialApp(
            home: NoFirebaseView(),
          );
        }
        if(snapshot.connectionState == ConnectionState.done) {
          print('Firebase connected');
          return StreamProvider<User>.value(
            value: AuthService().user,
            initialData: null,
            child: MaterialApp(
              home: Authenticate(),
            ),
          );
        }

        return MaterialApp(
          home: WaitingFirebase(),
        );
      },
    );

  }
}