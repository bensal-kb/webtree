import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../res/app_theme.dart';
import '../../../res/theme.dart';
import '../../utils/log.dart';

export 'package:flutter/material.dart';
export 'package:flutter_bloc/flutter_bloc.dart';

///A Base class for all Stateful & Stateless classes with a type of [Bloc] or [Cubit].
mixin BaseUI<B extends StateStreamableSource> {
  ///Returns the [Bloc] or [Cubit] of type [B]
  B bloc(BuildContext context, {bool listen = false}) =>
      BlocProvider.of<B>(context, listen: listen);

  ///Returns the [Bloc] or [Cubit] of type [T]
  T of<T extends StateStreamableSource>(BuildContext context,
          {bool listen = false}) =>
      BlocProvider.of<T>(context, listen: listen);

  Themes theme(BuildContext context) =>
      RepositoryProvider.of<AppTheme>(context).currentTheme;

  ///Returns a [TextStyle] with default configs and
  ///should be used instead of [TextStyle]
  TextStyle textStyle(
      {String? fontFamily,
      Color? color,
      double? fontSize,
      FontStyle? fontStyle,
      FontWeight? fontWeight,
      double? height,
      TextDecoration? decoration,
      Color? decorationColor,
      TextOverflow? overflow,
      bool inherit = true,
      double? letterSpacing}) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decorationColor: decorationColor,
        decoration: decoration,
        height: height,
        inherit: inherit,
        fontStyle: fontStyle,
        overflow: overflow ?? TextOverflow.ellipsis,
        letterSpacing: letterSpacing);
  }

  ///Removes the focus from the [TextField] if any
  removeFocus(context) => FocusManager.instance.primaryFocus?.unfocus();

  ///navigate to a new screen
  Future push(BuildContext context, String route, {Object? args}) async {
    logNavigation(route);
    return await context.push(route, extra: args);
  }

  ///navigate to a new screen by replacing the current screen
  Future pushReplacement(BuildContext context, String route,
      {Object? args}) async {
    logNavigation(route);
    return context.pushReplacement(route, extra: args);
  }

  ///pop from the current screen
  pop(BuildContext context, {Object? args}) {
    context.pop(args);
  }


  ///navigate to a fresh screen
  go(BuildContext context, String route, {Object? args}) {
    logNavigation(route);
    context.go(route, extra: args);
  }

}
