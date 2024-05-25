import 'package:webtree/base/base_ui/base_ui.dart';
import 'package:webtree/features/weather_details/bloc/weather_details_cubit.dart';
import 'package:webtree/features/weather_details/view/weather_details_view.dart';

///Page for displaying weather details for a particular city
class WeatherDetailsPage extends StatelessWidget with BaseUI{
  const WeatherDetailsPage({super.key, required this.city});
  final String city;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherDetailsCubit>(
          create: (context) => WeatherDetailsCubit()..loadData(city),
        ),
      ],
      child: WeatherDetailsView(city: city,),
    );
  }
}
