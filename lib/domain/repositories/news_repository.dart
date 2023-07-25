import 'package:untitled2/domain/entities/news_model.dart';
import 'package:untitled2/utils/repo_response.dart' as baseResponse;

abstract class NewsRepository{
  Future<baseResponse.BaseResponse<NewsModel>> fetchNews(NewsModel newsModel);
}