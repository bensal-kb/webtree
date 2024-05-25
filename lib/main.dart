import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:webtree/app.dart';

import 'bloc/bloc_observer.dart';

/// [Singleton] instance of the [GetIt] service locator.
final getIt = GetIt.instance;

void main() {
  ///Ensures Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  ///add bloc observer
  Bloc.observer = const MyBlocObserver();
  runApp(const App());
}



