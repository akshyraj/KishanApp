import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kishanapp/screens/homescreen.dart';
import 'package:kishanapp/services/auth.dart';
import 'package:path/path.dart';
import 'package:video_compress/video_compress.dart';
import 'package:video_player/video_player.dart';
import '../constants.dart';

final Color yellow = Color(0xfffbc31b);
final Color orange = Color(0xfffb6900);

class UploadingImageToFirebaseStorage extends StatefulWidget {
  @override
  _UploadingImageToFirebaseStorageState createState() =>
      _UploadingImageToFirebaseStorageState();
}

class _UploadingImageToFirebaseStorageState
    extends State<UploadingImageToFirebaseStorage> {
  
  
  File _video;
  File _imageFile;
  String name = '';
  PickedFile pickeFile;
  final picker = ImagePicker();
  Map<String, dynamic> userdetails;
  VideoPlayerController _controller;
  CollectionReference _userReference = FirebaseFirestore.instance.collection('Users');
  Authservice _authservice = new Authservice();
  String username="";

  userData() async{
    Map userdetails = await _authservice.getUserDetails();
    setState(() {
      username = userdetails['name'].toString();
    });
    print(userdetails.length);
  }

  Future<DocumentSnapshot> getSnapshot() async{
    return await _userReference.doc(FirebaseAuth.instance.currentUser.uid).get();
  }
 
  // ignore: non_constant_identifier_names
  void initState(){
    super.initState();
    userData();
  }
  // ignore: unused_element
  _pickVideo() async {
    pickeFile = await picker.getVideo(source: ImageSource.gallery);
    _video = File(pickeFile.path);
    _controller = VideoPlayerController.file(_video)
      ..initialize().then((_) => {setState(() {}), _controller.pause()});
  }

  _pickImage() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      _imageFile = File(pickedFile.path);
    });
  }

  Future uploadVideoToFirebase(BuildContext context) async {
    print(File(pickeFile.path).length());
    final info = await VideoCompress.compressVideo(pickeFile.path,
        quality: VideoQuality.LowQuality,
        deleteOrigin: false,
        includeAudio: true);

    File videofile = File(info.path);
    String fileName = basename(videofile.path);
    print(fileName);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(fileName);
    UploadTask uploadTask = firebaseStorageRef.putFile(
        videofile, SettableMetadata(contentType: 'video/mp4'));
    TaskSnapshot taskSnapshot = await uploadTask;
    taskSnapshot.ref.getDownloadURL().then((value) =>
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomeScreen();
        })));
  }

  Future uploadImageToFirebase(BuildContext context) async {
    String fileName = basename(_imageFile.path);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(fileName);
    UploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
    TaskSnapshot taskSnapshot = await uploadTask;
    taskSnapshot.ref.getDownloadURL().then((value) =>
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomeScreen();
        })));
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
                child: 
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child:Text(username)
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Name',
                            style: kLabelStyle,
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            alignment: Alignment.centerLeft,
                            decoration: kBoxDecorationStyle,
                            height: 60.0,
                            child: TextFormField(
                              obscureText: false,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'OpenSans',
                              ),
                              validator: (value) =>
                                  value.isEmpty ? 'Enter the Name' : null,
                              onChanged: (value) => name = value,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top: 14.0),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                ),
                                hintText: 'Enter your Name',
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
                          onPressed: () => {uploadImageToFirebase(context)},
                          padding: EdgeInsets.all(15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Colors.green,
                          child: Text('Login',
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

