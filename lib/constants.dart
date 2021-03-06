import 'package:flutter/material.dart';

String kAPI = '563492ad6f917000010000017070ee497ec64313a7552a5527b4c75f ';
int kTotalPhotos = 5000;
String kTopic = 'nature';
int kCantNewPhotos = 3;
String kTextShare = """Hey, try this app!
    https://play.google.com/store/apps/details?id=com.goingsmartly.nature_wallpaper
     You can use the next code to see the same wallpaper as me.
You'll love it! """;

String kKeyNewPhotos = 'cantNewPhotos';
String kKeyDate = 'date';
String kKeyBanned = 'banned';
String kKeyPhoto = 'photo';

BoxDecoration kBackgroundGradient = BoxDecoration(
  gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[
        Colors.black,
        Colors.grey,
      ]),
);

TextStyle kDialogTitleStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  letterSpacing: 1.5,
  color: Colors.grey.shade100,
);

TextStyle kDialogSubTitleStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  letterSpacing: 1.5,
  color: Colors.grey.shade100,
);

TextStyle kDialogContentStyle = TextStyle(
  fontSize: 16,
  fontStyle: FontStyle.italic,
  color: Colors.grey.shade100,
);

TextStyle kTextUrl = TextStyle(
  fontSize: 16,
  fontStyle: FontStyle.italic,
  color: Colors.blue.shade100,
);

TextStyle kTextPexel = TextStyle(
    fontSize: 20,
    fontStyle: FontStyle.italic,
    color: Colors.black,
    fontWeight: FontWeight.bold);
