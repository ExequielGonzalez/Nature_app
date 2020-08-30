import 'package:http/http.dart' as http;
import 'package:nature_wallpaper/constants.dart';
import 'package:nature_wallpaper/services/banned_images.dart';
import 'dart:convert';
import 'package:nature_wallpaper/services/images.dart';
import 'dart:math';

Future<PhotosModel> getTrendingWallpaper() async {
  PhotosModel photo;
  await http.get("https://api.pexels.com/v1/curated?per_page=1&page=1",
      headers: {"Authorization": kAPI}).then((value) {
    print(value.statusCode);
    print(value.body);
    if (value.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData["photos"].forEach((element) {
        //print(element);
//      return PhotosModel.fromMap(element);
        photo = PhotosModel.fromMap(element);
      });
    } else
      throw Exception(
          'Unable to get an image from the server. Check your internet connection');
  });
  return photo;
}

Future<PhotosModel> getSpecificWallpaper({String topic, String page}) async {
  PhotosModel photo;
  if (page == null) page = getRandomNumber(kTotalPhotos).toString();

  print("https://api.pexels.com/v1/search?query=$topic&per_page=1&page=$page");
  await http.get(
      "https://api.pexels.com/v1/search?query=$topic&per_page=1&page=$page",
      headers: {"Authorization": kAPI}).then((value) {
    print(value.statusCode);
    print(value.body);

    if (value.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      print(jsonData['total_results']);
      jsonData["photos"].forEach((element) {
        //print(element);
//      return PhotosModel.fromMap(element);
        photo = PhotosModel.fromMap(element);
      });
    } else
      throw Exception(
          'Unable to get an image from the server. Check your internet connection');
  });
  return photo;
}

Future<PhotosModel> getSpecificWallpaperById({String id}) async {
  PhotosModel photo;

  await http.get("https://api.pexels.com/v1/photos/$id",
      headers: {"Authorization": kAPI}).then((value) {
    print(value.statusCode);
    print(value.body);

    if (value.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      photo = PhotosModel.fromMap(jsonData);
    } else
      throw Exception(
          'Unable to get an image from the server. Check your internet connection');
  });
  return photo;
}

int getRandomNumber(int range) {
  BannedImages bannedImages = BannedImages();
  int newImage = Random().nextInt(range) + 1;
  if (bannedImages.isBanned(newImage)) {
    newImage = getRandomNumber(range);
  }
  bannedImages.banImage(newImage);
  return newImage;
}
