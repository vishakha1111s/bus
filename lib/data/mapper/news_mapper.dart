import 'package:untitled2/data/model/news_response.dart';
import 'package:untitled2/domain/entities/news_model.dart' as entities;

extension GetNewsMapper on NewsResponse {
  entities.NewsModel toMapEntity() {
    return entities.NewsModel(
        status: this.status,
        totalResults: this.totalResults,
        articles: this.articles?.map((e) => e.toMapEntity()).toList());
  }
}

extension GetArticleMapper on Article {
  entities.Article toMapEntity() {
    return entities.Article(
        source: this.source?.toMapEntity(),
        author: this.author,
        title: this.title,
        description: this.description,
        url: this.url,
        urlToImage: this.urlToImage,
        publishedAt: this.publishedAt);
  }
}

extension GetSourceMapper on Source {
  entities.Source toMapEntity() {
    return entities.Source(name: this.name, id: this.id);
  }
}
