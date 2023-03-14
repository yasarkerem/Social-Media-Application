import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egemmmm/utils/colors.dart';
import 'package:egemmmm/utils/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../objects/user.dart';

class Upload extends StatefulWidget {
  final User currentUser;

  Upload({this.currentUser});

  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  final _formKey = GlobalKey<FormState>();
  String text;
  PickedFile file;
  final ImagePicker _picker = ImagePicker();
  File _file;
  bool isUploading = false;
  final postsRef = FirebaseFirestore.instance.collection('posts');
  handleTakePhoto() async {
    //Navigator.pop(context);
    PickedFile file = await _picker.getImage(
      source: ImageSource.camera,
      maxHeight: 675,
      maxWidth: 960,
    );
    setState(() {
      this.file = file;
    });
  }

  handleChooseFromGallery() async {
    final PickedFile file = await _picker.getImage(
      source: ImageSource.gallery,
    );
    final File _file = File(file.path);
    setState(() {
      this.file = file;
      this._file = _file;
    });
  }

  selectImage(parentContext) {
    return showDialog(
        context: parentContext,
        builder: (context) {
          return SimpleDialog(
            title: Text('Create Post'),
            children: <Widget>[
              SimpleDialogOption(
                child: Text('Photo with Camera'),
                onPressed: handleTakePhoto,
              ),
              SimpleDialogOption(
                child: Text('Image from Gallery'),
                onPressed: handleChooseFromGallery,
              ),
              SimpleDialogOption(
                child: Text('Cancel'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        });
  }

  Scaffold buildSplashScreen() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.primary,
        title: Text("Share", style: appbarText),
      ),
      body: Center(
        child: Container(
          color: Theme.of(context).accentColor.withOpacity(0.1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //SvgPicture.asset('assets/upload.svg', height: 260.0),
                  Container(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: ElevatedButton(
                          child: Text(
                            'Upload Image',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                            ),
                          ),
                          onPressed: () => selectImage(context),
                        )),
                  ),
                  RaisedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Stack(
                                overflow: Overflow.visible,
                                children: <Widget>[
                                  Positioned(
                                    right: -40.0,
                                    top: -40.0,
                                    child: InkResponse(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: CircleAvatar(
                                        child: Icon(Icons.close),
                                        backgroundColor: Colors.red,
                                      ),
                                    ),
                                  ),
                                  Form(
                                    key: _formKey,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.all(20.0),
                                          child: TextFormField(
                                            obscureText: false,
                                            enableSuggestions: false,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: 'Text',
                                            ),
                                            maxLines: 5,
                                            minLines: 3,
                                            keyboardType: TextInputType.text,
                                            onSaved: (String value) {
                                              text = value;
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: RaisedButton(
                                            child: Text("Submit"),
                                            onPressed: () async {
                                              if (_formKey.currentState
                                                  .validate()) {
                                                _formKey.currentState.save();
                                                await FirebaseFirestore.instance
                                                    .collection('users')
                                                    .doc(FirebaseAuth.instance
                                                        .currentUser.uid)
                                                    .update({
                                                  'TextPost': text,
                                                });
                                                Navigator.of(context).pop();
                                              }
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    child: Text("Text Post"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  clearImage() {
    setState(() {
      file = null;
    });
  }

  createPostInFirestore(
      {String mediaUrl, String description, String location}) {}

  handleSubmit() {
    setState(() {
      isUploading = true;
    });
  }

  Scaffold buildUploadForm() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: clearImage,
        ),
        title: Text(
          'Caption Post',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          ElevatedButton(
              onPressed: isUploading ? null : () => handleSubmit(),
              child: Text(
                'Post',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ))
        ],
      ),
      body: ListView(
        children: <Widget>[
          isUploading
              ? LinearProgressIndicator(
                  //value: AnimationController(duration: const Duration(seconds: 2),).value,
                  backgroundColor: Colors.blue,
                )
              : Text(''),
          Container(
            height: 220.0,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Center(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(_file),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
          ),
          ListTile(
            leading: CircleAvatar(),
            title: Container(
              width: 250.0,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Write a caption...',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.pin_drop, color: Colors.orange, size: 35.0),
              title: Container(
                width: 250.0,
                child: TextField(
                    decoration: InputDecoration(
                  hintText: 'Where was this photo taken?',
                  border: InputBorder.none,
                )),
              )),
          Container(
            width: 200.0,
            height: 100.0,
            alignment: Alignment.center,
            child: ElevatedButton.icon(
              label: Text(
                'use Current Location',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => print('get user location'),
              icon: Icon(
                Icons.my_location,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return file == null ? buildSplashScreen() : buildUploadForm();
  }
}
