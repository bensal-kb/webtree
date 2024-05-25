import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webtree/base/base_bloc/base_states.dart';
import 'package:webtree/data/models/weather_model.dart';
import 'package:webtree/data/repo/weather_repo.dart';
import 'package:webtree/data/utils/res.dart';
import 'package:webtree/main.dart';

part 'weather_details_state.dart';

///Cubit for loading weather details for a particular city
class WeatherDetailsCubit extends Cubit<BaseState> {
  WeatherDetailsCubit() : super(const InitialState());

  loadData(String city) async {
    emit(const LoadingState());
    Res<WeatherModel> res = await getIt<WeatherRepo>().getWeather(city);
    if (res.isSuccess()) {
      emit(WeatherDetailsState(weather: res.data!));
    } else {
      emit(ErrorState(error: res.err));
    }
  }
}
