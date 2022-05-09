
import 'package:balbinew/Service/color_service.dart';
import 'package:flutter/material.dart';

var standarText = TextStyle(
  fontFamily: 'Monsterrat',
  fontSize: 14,
  color: black,
);

var smallGreyText = TextStyle(
  fontFamily: 'Monsterrat',
  fontSize: 12,
  color: grey,
);

var smallSecondary = TextStyle(
  fontFamily: 'Monsterrat',
  fontSize: 12,
  color: colorButton,
);

var standarBoldText = const TextStyle(
  fontFamily: 'Monsterrat',
  fontSize: 14,
  fontWeight: FontWeight.bold,
);

var mediumText = TextStyle(
  fontFamily: 'Monsterrat',
  fontSize: 16,
  color: black,
);

var mediumBoldText = const TextStyle(
  fontFamily: 'Monsterrat',
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

var largePatrickText = TextStyle(
  fontFamily: 'PatrickHand',
  fontSize: 24,
  color: textLogin,
);

changeFontColor(TextStyle style, Color color) {
  return style.copyWith(color: color);
}
