import 'package:egemmmm/services/auth.dart';
import 'package:egemmmm/utils/analytics.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:egemmmm/utils/colors.dart';
import 'package:egemmmm/utils/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

class login extends StatefulWidget {
  @override
  const login({Key key, this.analytics, this.observer}) : super(key: key);

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;
  Login createState() => Login();
  
}

class Login extends State<login> {
  String _message = '';
  int attemptCount;
  String mail;
  String pass;
  final _formKey = GlobalKey<FormState>();

 final AuthService _auth = AuthService();




  void forgot() {
    Navigator.pushNamed(context, '/forgot');
    //setState(() {});
  }

  void setmessage(String msg) {
    setState(() {
      _message = msg;
    });
  }

  /*Future<void> signupUser() async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: mail, password: pass);
      print(userCredential.toString());
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      if (e.code == 'email-already-in-use') {
        setmessage('This email is already in use');
      } else if (e.code == 'weak-password') {
        setmessage(
            'Weak password, add uppercase, lowercase, digit, special character, emoji, etc.');
      }
    }
    setmessage("loggedin");
  }*/
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
/*Future<void> loginUser() async {
    try {
      UserCredential userCredential =
          await auth.signInWithEmailAndPassword(email: mail, password: pass);
      print(userCredential.toString());
    } catch (e) {
      print(e.toString());
      if (e.code == 'user-not-found') {
        //signupUser();
        setmessage('Please check your password');
        return;
      } else if (e.code == 'wrong-password') {
        setmessage('Please check your password');
        return;
      }
    }
    Navigator.pushNamed(context, '/navigator');
  }*/

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.bg,
      appBar: AppBar(
        backgroundColor: Appcolors.primary,
        title: Text(
          'Login',
          style: TextStyle(
            color: Appcolors.third,
            letterSpacing: -1,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Log into your account",
                  style: TextStyle(
                    color: Appcolors.primary,
                    fontSize: 36,
                    fontWeight: FontWeight.w300,
                    letterSpacing: -1,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'E-mail / Username',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your e-mail';
                  }
                  if (!EmailValidator.validate(value)) {
                    return 'The e-mail address is not valid';
                  }
                  return null;
                },
                onSaved: (String value) {
                  mail = value;
                },
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                cursorColor: Appcolors.primary,
                keyboardType: TextInputType.text,
                enableSuggestions: false,
                autocorrect: false,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters';
                  }
                  return null;
                },
                onSaved: (String value) {
                  pass = value;
                },
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 195,
                      height: 50,
                      child: TextButton(
                        child: Text("Log In".toUpperCase(),
                            style: normalbuttonText),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(15)),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Color(0XFFA2D2F2)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Appcolors.primary),
                          )),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();

                            //showAlertDialog("Action", 'Button clicked');

                             dynamic result = await _auth.signInWithEmailAndPassword(mail, pass);

                              if(result == null) {
                                print('Login failed');
                              }
                              else {
                                print('User logged in');
                              }

                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Logging in $mail')));
                          }
                        },
                      ),
                    ),
                  ),
                  //SizedBox(width: 5,),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 195,
                      height: 50,
                      child: TextButton(
                        child: Text("Forgot Password?".toUpperCase(),
                            style: normalbuttonText),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(15)),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Color(0XFFA2D2F2)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Appcolors.primary),
                          )),
                        ),
                        onPressed: () => forgot(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                _message,
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Appcolors.primary,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: IconButton(
                  icon: Image.asset('assets/google.png'),
                  highlightColor: Colors.amber,
                  iconSize: 50,
                  onPressed: () => signInWithGoogle(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
