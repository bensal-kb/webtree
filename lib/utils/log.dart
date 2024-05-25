import 'dart:io';

import 'package:flutter/foundation.dart';


///This file contains log functions for different purposes that can be used across the app

///For general logging
logInfo(dynamic message, [dynamic content]) {
  _printStr('ℹ️ $message .\t${content??''}', _blue);
}

///For navigation logging
logNavigation(String screen) {
  _printStr('Inside screen: $screen', _magenta);
}

///For error logging
logError(dynamic message, [dynamic content]) {
  _printStr('$message ❗\t${content??''}', _red);
}

///For api request logging
logApiRequest(dynamic message) {
  _printStr('${message??''}', _yellow);
}

///For api response logging
logApiResponse(dynamic message) {
  _printStr('${message??''}', _cyan);
}

///For store to [Prefs] logging
logPrefsStore(String key, dynamic data) {
  _printStr('💾 Writing $key: ${data??''}', _black);
}

/// function for printing formatted log messages with colors
_printStr(String message, int color) {
  /// Check if the application is running in [kDebugMode]
  /// To log in [release] mode, replace [kDebugMode] with [true]
  if(kDebugMode) {
    print('${_getColor(color)} $message ${_getColor(_reset)}');
    if(message.length>200){
      print(_getColor(_reset));
   }
  }
}

/// Returns a formatted color code from an integer code
String _getColor(int code) {
  String m = 'm';
  return Platform.isAndroid?'\x1B[$code$m':'';
}


///Color codes for logging
const int _black = 30; //less thick
const int _red = 31; //error, API error
// const int _green = 32; //success
const int _yellow = 33; //API request
const int _blue = 34; //info
const int _magenta = 35; //screen
const int _cyan = 36; //API response
// const int _white = 37; ///dull than normal
const int _reset = 0; //reset to default