import 'package:webtree/base/base_bloc/base_states.dart';
import 'package:webtree/base/base_ui/base_page.dart';
import 'package:webtree/base/base_ui/base_ui.dart';
import 'package:webtree/base/base_ui/state_widget.dart';
import 'package:webtree/data/models/weather_model.dart';
import 'package:webtree/features/weather_details/bloc/weather_details_cubit.dart';
import 'package:webtree/features/weather_details/widgets/weather_details.dart';
import 'package:webtree/features/weather_details/widgets/weather_hourly_forecast.dart';
import 'package:webtree/features/weather_details/widgets/weather_weekly_forecast.dart';

class WeatherDetailsView extends StatelessWidget with BaseUI<WeatherDetailsCubit> {
  const WeatherDetailsView({super.key, required this.city});
  final String city;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      onRefresh: ()=>bloc(context).loadData(city),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                theme(context).gradient1(),
                theme(context).gradient2()
              ])),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(color: theme(context).light(),),
      ),
      child: BlocBuilder<WeatherDetailsCubit, BaseState>(
        builder: (context, state) {
          return StateWidget<WeatherDetailsCubit>(
            builder: (context, state) {
              WeatherModel weather = state.cast<WeatherDetailsState>().weather;
              return ListView(
                children: [
                  WeatherDetails(weather: weather),
                  const SizedBox(height: 30),
                  WeatherHourlyForecast(weatherModel: weather,),
                  const SizedBox(height: 20),
                  WeatherWeeklyForecast(weatherModel: weather,),
                ],
              );
            }
          );
        },
      ),
    );
  }
}
