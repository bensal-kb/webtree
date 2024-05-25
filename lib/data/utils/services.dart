import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retry/retry.dart';
import 'package:webtree/data/utils/res.dart';

import '../../utils/delays.dart';
import '../../utils/log.dart';
import 'err.dart';

///Author: Kaviraghul
///Date: 02/04/2024
///Services class handles all the api request and error catching,
///with retry and refresh token logic
class Services {
  late final dio = Dio();
  final retry = const RetryOptions(
    maxAttempts: 3,
    delayFactor: Delays.mill500,
    maxDelay: Duration(milliseconds: 1125),
  );

  ///Creating a [Singleton] class
  factory Services() {
    return _services;
  }

  Services._internal() {
    ///add [Dio] interceptors to log request & response handle refresh token logic
    _addDioInterceptor();
  }

  static final Services _services = Services._internal();

  ///adding dio interceptor to handle tokens expiry
  ///and logs
  _addDioInterceptor() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: _logRequest,
        onResponse: _logResponse,
        onError: (DioException error, ErrorInterceptorHandler handler) async {
          logError('API error', error.requestOptions.path);
          logError(error.message, error.response);
          return handler.next(error);
        },
      ),
    );
  }

  ///Get request
  Future<Res<T>> get<T>(
    String url, {
    Map<String, String>? extraHeaders,
    Map<String, dynamic>? queryParameters,
    Function? fromJson,
  }) async {
    try {
      Response response = await retry.retry(
          () => dio
              .get(
                url,
                queryParameters: queryParameters,
                options: Options(
                  headers: _getHeaders(extraHeaders),
                ),
              )
              .timeout(Delays.sec3),
          retryIf: retryIf);
      _throwErrorIfExists(response: response);
      return _convertToModel<T>(response: response, fromJson: fromJson);
    } on DioException catch (e, stacktrace) {
      return _onException<T>(e, url, stacktrace);
    } catch (e, stacktrace) {
      return _onException<T>(e, url, stacktrace);
    }
  }

  ///Post request
  Future<Res<T>> post<T>(
    String url, {
    required Map<String, dynamic> jsonBody,
    Map<String, String>? extraHeaders,
    Map<String, dynamic>? queryParameters,
    Function? fromJson,
  }) async {
    try {
      Response response = await dio
          .post(
            url,
            queryParameters: queryParameters,
            options: Options(headers: _getHeaders(extraHeaders)),
            data: jsonEncode(jsonBody),
          )
          .timeout(Delays.apiTimeout);

      _throwErrorIfExists(response: response);
      return _convertToModel<T>(response: response, fromJson: fromJson);
    } on DioException catch (e, stacktrace) {
      return _onException<T>(e, url, stacktrace);
    } catch (e, stacktrace) {
      return _onException<T>(e, url, stacktrace);
    }
  }

  ///Logs the request with url, headers and body
  _logRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logApiRequest("<< ${options.method} request: ${options.path} >>");
    logApiRequest(options.headers);
    if (options.data != null) {
      logApiRequest(options.data);
    }
    if (options.queryParameters.isNotEmpty) {
      logApiRequest(options.queryParameters);
    }
    return handler.next(options);
  }

  ///Logs the response with url, status code and response data
  _logResponse(Response res, ResponseInterceptorHandler handler) {
    logApiResponse("<< Response: ${res.requestOptions.path} >>");
    logApiResponse('status code: ${res.statusCode}');
    logApiResponse(res.data);
    return handler.next(res);
  }

  ///constant headers
  static const Map<String, String> _staticHeaders = {
    'Content-Type': 'application/json; charset=utf-8',
    'Accept': 'application/json;',
  };

  ///Returns all the basic [headers] combined with additional [headers] if required
  Map<String, String> _getHeaders([Map<String, String>? extraHeaders]) {
    Map<String, String> header = Map.from(_staticHeaders);
    if (extraHeaders != null) {
      header.addAll(extraHeaders);
    }
    return header;
  }

  bool retryIf(Exception e) {
    if (e is SocketException || e is TimeoutException) {
      return true;
    }
    if (e is DioException) {
      int? statusCode = e.response?.statusCode;
      if (statusCode != null && statusCode >= 500 && statusCode < 600) {
        return true;
      }
    }
    return false;
  }

  ///throws error is not accurate
  ///refreshes token if expired
  _throwErrorIfExists({required Response response}) {
    int? statusCode = response.statusCode;
    if (!successCodes.contains(statusCode)) {
      throw Err(type: ErrorType.apiError, res: response);
    }
  }

  ///Convert data to type [T] and throw if error
  Res<T> _convertToModel<T>(
      {required Response response, required Function? fromJson}) {
    T? data;
    if (fromJson != null) {
      try {
        data = fromJson(response.data);
        if (data is! T) {
          throw 'Missing';
        }
      } catch (e) {
        throw Err(type: ErrorType.modelCast, res: response, exception: e);
      }
    }
    return Res<T>.success(data, response.statusCode);
  }

  ///return [Res] with exception
  Res<T> _onException<T>(Object e, String url, stacktrace) {
    logError('API error', url);
    logError(e, stacktrace);
    Err error;

    if (e is DioException) {
      logError('${e.error} (${e.response?.statusCode}) ${e.response?.data}');
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.connectionError:
          error =
              Err(type: ErrorType.connection, exception: e, res: e.response,);
          break;
        case DioExceptionType.badResponse:
          error =
              Err(type: ErrorType.badResponse, exception: e, res: e.response);
          break;
        default:
          error = Err();
          break;
      }
    } else if (e is Err) {
      error = e;
    } else if (e is TimeoutException) {
      error = Err(type: ErrorType.connection, exception: e);
    } else if (e is SocketException) {
      error = Err(type: ErrorType.connection, exception: e);
    } else {
      error = Err(
        exception: e,
      );
    }
    return Res<T>.error(error);
  }
}

///list of status codes which represents success
const List<int> successCodes = [200, 201];
