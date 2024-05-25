import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webtree/features/home/bloc/home_cubit/data.dart';

part 'home_state.dart';

///Cubit to maintain list of cities which is filtered based on search query
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState(input: '',cities: cities));

  updateCity(String city) {
    //if empty, display all cities
    if (city.isEmpty) {
      emit(HomeState(input: '', cities: cities));
      return;
    }
    List<String> filteredCities = cities
        .where((element) => element.toLowerCase().contains(city.toLowerCase()))
        .toList();
    emit(HomeState(input: city, cities: filteredCities));
  }
}
