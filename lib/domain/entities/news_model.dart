class NewsModel {
  String? status;
  int? totalResults;
  List<Article>? articles;

  NewsModel({
    this.status,
    this.totalResults,
    this.articles,
  });
}

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });
}

class Source {
  int? id;
  String? name;

  Source({
    this.id,
    this.name,
  });
}
