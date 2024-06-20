import 'package:flutter/material.dart';
import 'package:practice_app/Activity/Home.dart';
import 'package:practice_app/Activity/Loading.dart';
import 'package:practice_app/Activity/Secondpage.dart';
import 'SecondPage.dart';
void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
    routes : {  // context=> current page
      // "/" : (context) => Loading(), // on opening the app it goes to loading page
      "/" : (context) => Homepage(),
      "/home" : (context) => Home(),
      "/loading" : (context)=> Loading(),
    },
  ));
}
