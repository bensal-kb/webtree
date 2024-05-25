import 'package:webtree/res/constants.dart';

class Urls {
  String getWeather(String city) => 'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/$city?unitGroup=metric&key=${Constants.weatherAPIKey}&contentType=json';
}