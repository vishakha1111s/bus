import 'package:untitled2/domain/entities/news_model.dart';

abstract class NewsRepository {
  Future<NewsModel> fetchNews();
}
