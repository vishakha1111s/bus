import 'package:dio/dio.dart';
import 'package:untitled2/data/mapper/news_mapper.dart';
import 'package:untitled2/data/model/news_response.dart';
import 'package:untitled2/domain/entities/news_model.dart';
import 'package:untitled2/utils/core.dart';


class GetNewsDataSource {
  var errorStr = "Something Went Wrong";

  Future<NewsResponse> getNews() async {
    try {
      var response = await CoreApplication().dio.get("/v2/everything",
          queryParameters: {
            "q": "bitcoin",
            "apiKey": "11d4cd5e95b54423901d72b8167fe73a"
          });
      return NewsResponse.fromJson(response.data);
    } on Exception catch (e) {
      AppLogger.log("News - Dio Error: $e");
      return NewsResponse.withError(errorStr);
    } on Error catch (e) {
      AppLogger.log("TNews - Error: $e");
      return NewsResponse.withError(errorStr);
    }
  }
}
