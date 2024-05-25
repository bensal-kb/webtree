

import 'package:equatable/equatable.dart';

import '../../data/utils/err.dart';

///Represents the status of the state
enum Status { initial, loading, success, error }

///The Base class for all the states.
///Every state class should extend from [BaseState]
abstract class BaseState extends Equatable {
  const BaseState({this.state, this.error});

  final Status? state;
  final Err? error;

  @override
  List<Object?> get props => [state];

  bool get isInitial => state == Status.initial;

  bool get isLoading => state == Status.loading;

  bool get isSuccess => state == Status.success;

  bool get isError => state == Status.error;
  bool get isSuccessOrError => isSuccess || isError;
  bool get isSuccessOrLoading => isSuccess || isLoading;

  T cast<T>() => this as T;
  T? tryCast<T>() => this is T ? this as T : null;

  Map<String, dynamic> toJson() => {};
}

///Represents initial state of the bloc
class InitialState extends BaseState {
  const InitialState() : super(state: Status.initial);
}

///Represents a state where some asynchronous operation is in progress
///and the UI should display a loader state
class LoadingState extends BaseState {
  const LoadingState() : super(state: Status.loading);
}

///Represents a state where an operation or data fetching is successful
class SuccessState extends BaseState {
  const SuccessState() : super(state: Status.success);
}

///Represents a state where an error or failure has occurred
///and the UI should display an error state
class ErrorState extends BaseState {
  const ErrorState({required super.error}) : super(state: Status.error);
}
