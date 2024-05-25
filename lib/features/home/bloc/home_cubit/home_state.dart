part of 'home_cubit.dart';


class HomeState extends Equatable {
  final String input;
  final List<String> cities;

  const HomeState({required this.input, required this.cities});

  @override
  List<Object> get props => [input, ...cities];
}