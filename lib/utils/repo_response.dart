import 'dart:io';

import 'package:dio/dio.dart';

import 'logger.dart';

class BaseResponse<T> {
  T? _data;
  UseCaseError? _error;

  T? get data => _data;

  set data(T? value) {
    _data = value;
  } //Returns if the response is successful and has data

  bool isSuccess() {
    return _error == null;
  }

  UseCaseError? get error => _error;

  set error(UseCaseError? value) {
    _error = value;
  }
}

class UseCaseError {
  String errorMessage;
  ErrorType type;

  UseCaseError(this.errorMessage, this.type);

  bool isAuthError() {
    return type == ErrorType.UN_AUTHORIZED;
  }
}

enum ErrorType { SERVER_ERROR, TIME_OUT_ERROR, IO_ERROR, UN_AUTHORIZED, SPECIAL_CASE }
extension BaseResponseError on BaseResponse {
  BaseResponse<T> handleError<T>(Exception e) {
    BaseResponse<T> baseResponse = BaseResponse();
    if (e is DioError) {
      AppLogger.log("Dio Error: $e");
      switch (e.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.receiveTimeout:
          baseResponse.error = UseCaseError(
              "Please check your internet connection, and try again!",
              ErrorType.TIME_OUT_ERROR);
          break;
        case DioErrorType.response:
          baseResponse.error = UseCaseError(
              "Internal server error. Please try after sometime.",
              ErrorType.TIME_OUT_ERROR);
          break;
        default:
          {
            if (e.error is SocketException) {
              baseResponse.error = UseCaseError(
                  "Please check your internet connection.",
                  ErrorType.TIME_OUT_ERROR);
            } else {
              baseResponse.error = UseCaseError(
                  "Internal system error. Please try after sometime.",
                  ErrorType.TIME_OUT_ERROR);
            }
          }
      }
    } else {
      AppLogger.log("Exception: $e");
      baseResponse.error = UseCaseError(e.toString(), ErrorType.SPECIAL_CASE);
    }
    return baseResponse;
  }
}