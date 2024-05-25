import 'package:webtree/data/models/weather_model.dart';
import 'package:webtree/data/repo/base_repo.dart';

import '../utils/res.dart';

abstract class WeatherRepo extends BaseRepository {
  Future<Res<WeatherModel>> getWeather(String city);
}