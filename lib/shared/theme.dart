import 'package:flutter/material.dart';

//<color name="primaryColor">#c0ca33</color>
//<color name="primaryLightColor">#f5fd67</color>
//<color name="primaryDarkColor">#8c9900</color>
//<color name="secondaryColor">#80deea</color>
//<color name="secondaryLightColor">#b4ffff</color>
//<color name="secondaryDarkColor">#4bacb8</color>
//<color name="primaryTextColor">#000000</color>
//<color name="secondaryTextColor">#000000</color>
const kPrimaryColor = Color(0xff263238);
const kPrimaryColorLight = Color(0xff4f5b62);
const kPrimaryColorDark = Color(0xff000a12);
const kSecondaryColor = Color(0xff0097a7);
const kSecondaryColorLight = Color(0xff56c8d8);
const kSecondaryColorDark = Color(0xff006978);
const kHighlightColor = Color(0xff6c6f00);

const kHeroTextHeight = 13.0;

const kInactiveText = TextStyle(
  color: Colors.grey,
  fontSize: 16.0,
);

ThemeData basicTheme() {
  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
        headline6: base.headline6.copyWith(
          color: Colors.white,
          fontSize: kHeroTextHeight,
          wordSpacing: 1.2,
        ),
        headline4: base.headline4.copyWith(
          color: Colors.white,
          fontSize: 14.0,
        ));
  }

  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    primaryColor: kPrimaryColor,
    primaryColorLight: kPrimaryColorLight,
    primaryColorDark: kPrimaryColorDark,
    highlightColor: kHighlightColor,
//    backgroundColor: Color(0xff2d2d2d),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: kSecondaryColor,
      foregroundColor: Colors.white70,
    ),
  );
}