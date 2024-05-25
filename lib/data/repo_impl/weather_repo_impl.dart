import 'package:webtree/data/repo/weather_repo.dart';

import '../models/weather_model.dart';
import '../utils/res.dart';

class WeatherRepoImpl extends WeatherRepo {
  @override
  Future<Res<WeatherModel>> getWeather(String city) async {
    return services.get(urls.getWeather(city), fromJson: WeatherModel.fromJson);
  }
}
