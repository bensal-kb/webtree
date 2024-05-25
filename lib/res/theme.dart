import 'package:flutter/material.dart';

/// An abstract class representing a set of [Colors] with default value.
abstract class Themes {
  Color primary() => const Color(0xFF170a24);
  Color primaryDark() => const Color(0xFF170a24);
  Color primaryLight() => const Color(0xFF153b84);
  Color secondary() => const Color(0xFFD2EFE8);

  Color light() => const Color(0xFFFFFFFF);
  Color dark() => const Color(0xFF000000);
  Color gradient1() => const Color(0xff180222);
  Color gradient2() => const Color(0xFF1C1B33);
  Color gradientTile1() => const Color(0xff45278B);
  Color gradientTile2() => const Color(0xFF2E335A);
  Color tile() => const Color(0xFF48319D);

  Color textFieldFillColor() => const Color(0xff313E55).withOpacity(0.7);
  Color textLight() => const Color(0xffEBEBF5);

}

/// A concrete class representing a light color theme.
class LightTheme extends Themes {}
