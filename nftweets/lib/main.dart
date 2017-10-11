import 'package:flutter/material.dart';
import 'package:nftweets/ui/homepage.dart';



void main() {
  runApp(
    new MaterialApp(
      title: "NFLTweets",
      home: new HomePage(),
      theme: new ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.green,
      ),
    ),
  );
}
