import 'package:untitled2/data/datasource/news_api_provider.dart';
import 'package:untitled2/domain/entities/news_model.dart';
import 'package:untitled2/domain/repositories/news_repository.dart';
import 'package:untitled2/utils/repo_response.dart';

class NewsRepositoryImpl extends NewsRepository {
  GetNewsDataSource getNewsDataSource;
  NewsRepositoryImpl({required this.getNewsDataSource});
  @override

  Future<BaseResponse<NewsModel>> fetchNews(NewsModel newsModel) async{
    return await getNewsDataSource.getNews(newsModel);
  }
}
