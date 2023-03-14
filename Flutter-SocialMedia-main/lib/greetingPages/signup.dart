import 'package:egemmmm/services/auth.dart';
import 'package:egemmmm/utils/analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:egemmmm/utils/colors.dart';
import 'package:egemmmm/utils/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

class signup extends StatefulWidget {
  const signup({Key key, this.analytics, this.observer}) : super(key: key);

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;
  @override
  Signup createState() => Signup();
}

class Signup extends State<signup> {
  String _message = '';
  int attemptCount;
  String mail;
  String username;
  String pass;
  String pass2;
  final _formKey = GlobalKey<FormState>();

  final AuthService _auth = AuthService();
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
        return;
      } else if (e.code == 'weak-password') {
        setmessage(
            'Weak password, add uppercase, lowercase, digit, special character, emoji, etc.');
        return;
      }
    }
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Signing Up')));
    Navigator.pushNamed(context, '/login');
  }*/

  void nextPage() {
    //setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Appcolors.bg,
      appBar: AppBar(
        backgroundColor: Appcolors.primary,
        title: Text('Sign Up', style: appbarText),
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
                child: Text("Create Your Account", style: headerText),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'E-mail',
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
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
                keyboardType: TextInputType.text,
                onSaved: (String value) {
                  username = value;
                },
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Create a Password',
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
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirm Password',
                ),
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
                  pass2 = value;
                },
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Container(
                  width: 400,
                  height: 50,
                  child: Container(
                    width: 400,
                    height: 50,
                    child: TextButton(
                        child: Text("CREATE ACCOUNT".toUpperCase(),
                            style: normalbuttonText),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(15)),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Appcolors.primary),
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

                            if (pass != pass2) {
                              setmessage('Passwords must match');
                            } else {
                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                      mail, pass, username);

                              if (result == null) {
                                print('Registration failed');
                              } else {
                                print('User registered');
                                Navigator.pushNamed(context, '/login');
                              }

                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Registering')));
                            }
                          }
                        }),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                _message,
                style: TextStyle(
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
