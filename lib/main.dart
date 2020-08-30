import 'package:flutter/material.dart';
import 'package:nature_wallpaper/screens/home.dart';
import 'package:nature_wallpaper/screens/starting.dart';

void main() => runApp(NatureWallpaper());

class NatureWallpaper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nature Wallpaper',
      initialRoute: '/',
      routes: {
        '/home': (context) => Home(),
        '/': (context) => Starting(),
      },
    );
  }
}
