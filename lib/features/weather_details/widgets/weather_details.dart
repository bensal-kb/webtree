import 'package:webtree/base/base_ui/base_ui.dart';
import 'package:webtree/data/models/weather_model.dart';
import 'package:webtree/widgets/weather_icon.dart';

class WeatherDetails extends StatelessWidget with BaseUI {
  const WeatherDetails({super.key, required this.weather});

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WeatherIcon(
          icon: weather.currentConditions!.icon!,
          size: 40,
        ),
        Text(
          weather.resolvedAddress!,
          style: textStyle(
              fontSize: 24,
              color: theme(context).light(),
              fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 5),
        Text(
          '${weather.currentConditions!.temp}° | ${weather.currentConditions!.conditions}',
          style: textStyle(
              color: theme(context).textLight(),
              fontSize: 24,
              fontWeight: FontWeight.w700),
          maxLines: 2,
        ),
        Text(
          '(min ${weather.days!.first.tempmin}°, max${weather.days!.first.tempmax})',
          style: textStyle(
            color: theme(context).textLight(),
            fontSize: 14,
          ),
          maxLines: 2,
        ),
        const SizedBox(height: 10),
        Text(
          'Humidity: ${weather.currentConditions!.humidity}°, Wind: ${weather.currentConditions!.windspeed}',
          style: textStyle(
            color: theme(context).textLight(),
            fontSize: 16,
          ),
          maxLines: 2,
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            weather.description!,
            style: textStyle(fontSize: 16, color: theme(context).light()),
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
