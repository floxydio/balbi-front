import 'package:flutter/material.dart';

class ImageService {
  var intro1 = "assets/intro1.png";
  var intro2 = "assets/intro2.png";
  var intro3 = "assets/intro3.png";
  var splashScreen = "assets/splashscreen.png";
  var logo = "assets/logo.png";
  var dummyLogin = "assets/dummylogin.png";
  var icon1 = "assets/Khursus.png";
  var icon2 = "assets/Kelas Olahraga.png";
  var icon3 = "assets/Coding Class.png";
  var icon4 = "assets/Learing kit.png";
  var icon5 = "assets/day care.png";
}

getImageBoxFit(String image, BoxFit fit) {
  return Image.asset(
    image,
    fit: fit,
  );
}

Widget buildImage(String assetName, [double width = 300]) {
  return Image.asset(assetName, width: width);
}
