
import 'package:flutter/material.dart';
import 'package:webtree/res/theme.dart';

///An Util class which returns the current theme of the class
class AppTheme  {
  ///[Theme] defaults to [LightTheme]
  Themes currentTheme = LightTheme();

  ThemeData getTheme(context) {
    return ThemeData.light().copyWith(
      platform: TargetPlatform.iOS,
    );
  }
}
