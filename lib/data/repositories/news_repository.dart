import 'package:untitled2/data/datasource/news_remote_storage_api_provider.dart';
import 'package:untitled2/data/model/news_response.dart';
import 'package:untitled2/domain/entities/news_model.dart' as entity;
import 'package:untitled2/domain/repositories/news_repository.dart';

class NewsRepositoryImpl extends NewsRepository {
  @override
  Future<entity.NewsModel> fetchNews() async {
    NewsResponse newsResponse = await GetNewsDataSource().getNews();

    String? name, url, description, author, title;
    String? urlToImage, publishedAt, content, id;
    List<entity.Article> article = [];

    for (int i = 0; i < (newsResponse.articles?.length ?? 0); i++) {
      id = newsResponse.articles?[i].source?.id ?? "";
      name = newsResponse.articles?[i]?.source?.name ?? "";
      author = newsResponse.articles?[i].author ?? "";
      title = newsResponse.articles?[i].title ?? "";
      description = newsResponse.articles?[i].description ?? "";
      url = newsResponse.articles?[i].url ?? "";
      urlToImage = newsResponse.articles?[i].urlToImage ?? "";
      publishedAt = newsResponse.articles?[i].publishedAt ?? "";
      content = newsResponse.articles?[i].content ?? "";
      article.add(entity.Article(
          title: title,
          urlToImage: urlToImage,
          url: url,
          description: description,
          publishedAt: publishedAt,
          author: author,
          content: content,
          source: entity.Source(id: id, name: name)));
    }

    return entity.NewsModel(
      status: newsResponse.status,
      articles: article,
      totalResults: newsResponse.totalResults,
    );
  }
}
