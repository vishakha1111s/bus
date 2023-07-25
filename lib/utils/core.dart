import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:flutter/services.dart';
export '../utils/logger.dart';
import 'dart:convert' as convert;
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'logger.dart';


const int connectTimeout = 20000;
const int sendTimeout = 40000;
const int receiveTimeout = 20000;

class CoreApplication {
  factory CoreApplication() {
    return _instance;
  }

  static const TAG = "Core Application";

  static final CoreApplication _instance = CoreApplication._internal();
  late Dio dio;

  Future<Map<String, dynamic>> get(
      String uri, Map<String, dynamic>? queryParams) async {
    var url = Uri.https('https://newsapi.org',
        '/v2/everything', queryParams);

    var response = await http.get(url, headers: {
      'apiKey': "11d4cd5e95b54423901d72b8167fe73a"
    });
    if (response.statusCode == 200) {
      return convert.jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      return {};
    }
  }

  CoreApplication._internal() {
    dio = Dio(BaseOptions(
        connectTimeout: connectTimeout,
        //ms
        sendTimeout: sendTimeout,
        receiveTimeout: 20000,
        //ms
        baseUrl: "https://newsapi.org"));

    dio.interceptors.add(AppInterceptors());

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient dioClient) {
      dioClient.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };

    const int _maxCharactersPerLine = 200;
    //Print the string wrapped
    void printWrapped(String value) {
      if (value.length > _maxCharactersPerLine) {
        int iterations = (value.length / _maxCharactersPerLine).floor();
        for (int i = 0; i <= iterations; i++) {
          int endingIndex = i * _maxCharactersPerLine + _maxCharactersPerLine;
          if (endingIndex > value.length) {
            endingIndex = value.length;
          }
          AppLogger.log(value.substring(i * _maxCharactersPerLine, endingIndex),
              tag: "API logger");
        }
      } else {
        AppLogger.log(value, tag: "API logger");
      }
    }

    resetDioTimeouts() {
      dio.options.sendTimeout = sendTimeout;
      dio.options.connectTimeout = connectTimeout;
    }
  }


}
class AppInterceptors extends InterceptorsWrapper {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    AppLogger.log("<===========================================>",
        tag: "API logger");
    AppLogger.log("<==============Request Started==============>",
        tag: "API logger");
    AppLogger.log("<===========================================>",
        tag: "API logger");
    if (!options.headers.containsKey("Authorization")) {
      options.headers["apiKey"] =
          "11d4cd5e95b54423901d72b8167fe73a";
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    AppLogger.log("<===========================================>",
        tag: "API logger");
    AppLogger.log("<==============Request Success==============>",
        tag: "API logger");
    AppLogger.log("<===========================================>",
        tag: "API logger");
    printWrapped(response.data.toString(), "API logger");
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    AppLogger.log("<===========================================>",
        tag: "API logger");
    AppLogger.log("<==============Request Error================>",
        tag: "API logger");
    AppLogger.log("<===========================================>",
        tag: "API logger");
    printWrapped(err.toString(), "API logger");
  }

  void printWrapped(String text, String tag) {
    final pattern = RegExp('.{1,800}');
    if (pattern.hasMatch(text)) {
      // 800 is the size of each chunk
      pattern
          .allMatches(text)
          .forEach((match) => AppLogger.log(match.group(0) ?? "", tag: tag));
    } else {
      AppLogger.log(text, tag: tag);
    }
  }
}


