import 'package:flutter/material.dart';

getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

getWidthCalculate(BuildContext context, double value) {
  return getWidth(context) * value;
}

getHeightCalculate(BuildContext context, double value) {
  return getHeight(context) * value;
}

var crossStart = CrossAxisAlignment.start;
var spaceBetween = MainAxisAlignment.spaceBetween;
