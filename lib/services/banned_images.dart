import 'dart:convert';
import 'package:nature_wallpaper/services/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class BannedImages {
  //Singleton
  List<int> _bannedImages;

  static final BannedImages _instance = BannedImages._privateConstructor();

  factory BannedImages() {
    return _instance;
  }

  BannedImages._privateConstructor() {
    _bannedImages = [];

//    while (_bannedImages.isEmpty) {
    setSharedPreferences();
    readListFromDB();
//    print('currently banned: $_bannedImages');
//    }
  }

  void setSharedPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//    sharedPreferences.remove('banned');
    if (!sharedPreferences.containsKey(kKeyBanned)) {
      print('creando key $kKeyBanned en DB');

      saveListInDB();
    }
    banImage(int.parse(lastBanned()));
  }

  readListFromDB() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> mList = (prefs.getStringList(kKeyBanned) ?? List<String>());

    _bannedImages = mList.map((i) => int.parse(i)).toList();

    print(_bannedImages);
  }

  saveListInDB() async {
    SharedPref sharedPref = SharedPref();
    sharedPref.saveListInt(kKeyBanned, _bannedImages);
  }

  void banImage(int img) async {
    if (!isBanned(img)) {
      _bannedImages.add(img);
      print('the image $img was banned');
      saveListInDB();
    }
  }

  bool isBanned(int img) {
    print('currently banned: $_bannedImages');

    return _bannedImages.contains(img);
  }

  String lastBanned() {
    return _bannedImages.last.toString();
  }
}
