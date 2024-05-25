import 'package:dio/dio.dart';

import 'err.dart';

///Author: Kaviraghul
///Date: 02/04/2024
///
/// Custom [Response] for handling all the [API] states
class Res<M> {
  Res();

  ResStatus status = ResStatus.nothing;
  int? statusCode;
  M? data;
  Err? err;

  bool isNothing() => status == ResStatus.nothing;

  bool isLoading() => status == ResStatus.loading;

  bool isSuccess() => status == ResStatus.success;

  bool isNotSuccess() => status != ResStatus.success;

  bool isError() => status == ResStatus.error;

  bool isNothingOrSuccess() => isNothing() || isSuccess();

  startLoading() {
    reset();
    status = ResStatus.loading;
  }

  reset() {
    status = ResStatus.nothing;
    statusCode = null;
    data = null;
    err = null;
  }

  Res.success([M? val, int? code]) {
    data = val;
    statusCode = code;
    status = ResStatus.success;
    err = null;
  }

  Res.error(Err? error) {
    reset();
    err = error;
    status = ResStatus.error;
  }
}

enum ResStatus { nothing, loading, success, error }
