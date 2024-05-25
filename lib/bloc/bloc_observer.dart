import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/log.dart';

///A Bloc observer which logs the state changes
class MyBlocObserver extends BlocObserver {
  const MyBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    logInfo(bloc.runtimeType, change);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    logInfo(bloc.runtimeType, event);
  }
}
