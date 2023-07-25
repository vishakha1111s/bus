import 'package:dio/dio.dart';
import 'package:untitled2/data/mapper/news_mapper.dart';
import 'package:untitled2/data/model/news_response.dart';
import 'package:untitled2/domain/entities/news_model.dart';
import 'package:untitled2/utils/core.dart';
import 'package:untitled2/utils/repo_response.dart';


class GetNewsDataSource {

  CoreApplication coreApplication;
  GetNewsDataSource({required this.coreApplication});

  Future<BaseResponse<NewsModel>> getNews(NewsModel newsModel) async {
    BaseResponse<NewsModel> baseResponse = BaseResponse();
    try {
      var response = await CoreApplication().dio.get(
          "/v2/everything", queryParameters: {"q":"bitcoin"});
      final data = NewsResponse.fromJson(response.data).toMapEntity();
      baseResponse.data = data;
    } on Exception catch (e) {
      AppLogger.log("News - Dio Error: $e");
      baseResponse.error = baseResponse.handleError(e).error;
    } on Error catch (e) {
      AppLogger.log("TNews - Error: $e");
      baseResponse.error = UseCaseError(e.toString(), ErrorType.SPECIAL_CASE);
    }
    return baseResponse;
  }
}
