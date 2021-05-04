import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kishanapp/screens/homescreen.dart';
import 'package:kishanapp/services/auth.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';
import '../constants.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference _postReference =
      FirebaseFirestore.instance.collection('Posts');
  String username = '';
  File _imageFile;
  PickedFile pickeFile;
  final picker = ImagePicker();
  String query = '';
  String postId = Uuid().v4();
  String mediaUrl = '';

  Authservice _authservice = new Authservice();
  _AddPostState() {
    userData();
  }

  userData() async {
    Map<String, dynamic> userdetails = await _authservice.getUserDetails();
    setState(() {
      username = userdetails['name'];
    });
  }

  _pickImage() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      _imageFile = File(pickedFile.path);
    });
  }

  handleSubmit(BuildContext context) async {
    String mediaUrl = await uploadImage();
    await createPostInFireStore(mediaUrl: mediaUrl, query: query);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomeScreen();
    }));
  }

  createPostInFireStore({String mediaUrl, String query}) {
    print(postId);
    print(_auth.currentUser.uid);
    print(username);
    print(mediaUrl);
    print(query);

    _postReference.doc(postId).set({
      'postId': postId,
      'ownerId': _auth.currentUser.uid,
      'username': username,
      'mediaUrl': mediaUrl,
      'query': query,
    });
  }

  Future<String> uploadImage() async {
    String fileName = basename(_imageFile.path);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('Images').child(fileName);
    UploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
    TaskSnapshot taskSnapshot = await uploadTask;
    return taskSnapshot.ref.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Q & A'),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 15.0,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            leading: CircleAvatar(
                              child: Text("AJ"),
                              backgroundColor: Colors.teal,
                            ),
                            title: Text(
                              username,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            alignment: Alignment.centerLeft,
                            decoration: kBoxDecorationStyle,
                            height: 100.0,
                            child: TextFormField(
                              obscureText: false,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'OpenSans',
                              ),
                              maxLines: 4,
                              validator: (value) =>
                                  value.isEmpty ? 'Enter the Name' : null,
                              onChanged: (value) => query = value,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 5.0),
                                hintText: 'Enter your Question',
                                hintStyle: kHintTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        height: 300,
                        width: 400,
                        child: ClipRRect(
                          child: _imageFile != null
                              ? Image.file(_imageFile)
                              : FlatButton(
                                  child: Icon(
                                    Icons.add_a_photo,
                                    size: 50,
                                  ),
                                  onPressed: _pickImage,
                                ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        width: double.infinity,
                        child: RaisedButton(
                          elevation: 5.0,
                          onPressed: () => {handleSubmit(context)},
                          padding: EdgeInsets.all(15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Colors.green,
                          child: Text('Upload',
                              style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 1.5,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OpenSans',
                              )),
                        ),
                      ),
                    ]),
              ))
        ],
      ),
    );
  }
}
