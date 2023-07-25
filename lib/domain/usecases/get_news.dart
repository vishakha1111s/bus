import 'package:untitled2/domain/entities/news_model.dart';
import 'package:untitled2/domain/repositories/news_repository.dart';
import 'package:untitled2/utils/repo_response.dart';

class GetNews {
  final NewsRepository repository;

  GetNews(this.repository);

  Future<BaseResponse<NewsModel>> call(NewsModel newsModel) async {
    return repository.fetchNews(newsModel);
  }
}
