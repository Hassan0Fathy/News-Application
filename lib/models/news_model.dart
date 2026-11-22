class Source {
  final String? id;
  final String name;

  Source({this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(id: json['id'], name: json['name']);
  }
}

class Article {
  final Source source;
  final String title;
  final String? description;
  final String? urlToImage;

  Article({
    required this.source,
    required this.title,
    this.description,
    this.urlToImage,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      title: json['title'],
      description: json['description'],
      urlToImage: json['urlToImage'],
    );
  }
}

class NewsModel {
  final List<Article> news;
  NewsModel({required this.news});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      news: (json['articles'] as List).map((e) => Article.fromJson(e)).toList(),
    );
  }
}
