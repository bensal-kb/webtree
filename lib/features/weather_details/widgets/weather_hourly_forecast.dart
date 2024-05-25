import 'package:webtree/base/base_ui/base_ui.dart';
import 'package:webtree/data/models/weather_model.dart';
import 'package:webtree/utils/date_time_utils.dart';
import 'package:webtree/widgets/weather_icon.dart';

class WeatherHourlyForecast extends StatelessWidget with BaseUI {
  const WeatherHourlyForecast({super.key, required this.weatherModel});

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [
            theme(context).gradientTile1(),
            theme(context).gradientTile2(),
          ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Center(
            child: Container(
              width: 50, height: 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: theme(context).primaryLight(),

              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text('Hourly Forecast',
                style: textStyle(
                    fontSize: 16,
                    color: theme(context).textLight(),
                    fontWeight: FontWeight.w700)),
          ),
          const SizedBox(height: 2),
          Divider(
            thickness: 1,
            height: 1,
            color: theme(context).primaryLight(),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 100,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              children: [
                for (Hours i in weatherModel.days!.first.hours!)
                  Container(
                    width: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        color: theme(context).tile(),
                        border: Border.all(
                            color: theme(context).light().withOpacity(0.2)
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: theme(context).dark().withOpacity(0.25),
                              offset: const Offset(5, 4),
                              blurRadius: 10, spreadRadius: 0
                          )
                        ],
                        borderRadius: BorderRadius.circular(40)),
                    child: Column(
                      children: [
                        const Spacer(flex: 1),
                        Text(
                          DateTimeUtils.getFormattedTimeFromStr(i.datetime!),
                          style: textStyle(
                              color: theme(context).light(), fontSize: 12),
                        ),
                        const Spacer(flex: 1),
                        WeatherIcon(icon: i.icon!),
                        const Spacer(flex: 1),
                        Text(
                          '${i.temp}°',
                          style: textStyle(color: theme(context).light()),
                        ),
                        const Spacer(flex: 1),
                      ],
                    ),
                  )
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
