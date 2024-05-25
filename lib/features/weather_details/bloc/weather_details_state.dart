part of 'weather_details_cubit.dart';

class WeatherDetailsState extends SuccessState {
  final WeatherModel weather;
  const WeatherDetailsState({required this.weather});

  @override
  List<Object?> get props => [weather];
}
