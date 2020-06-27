class News {
  String status;
  int totalResults;
  List<Article> articles;

  News({
      this.status,
      this.totalResults,
      this.articles,
    });

  factory News.fromJson(Map<String, dynamic> json) => News(
    status: json['status'],
    totalResults: json['totalResults'],
    // articles: List<Article>.from(json['articles']).map((x) => Article.fromJson(json)).toList(),
    articles: (json['articles'] as List)?.map((json) => Article.fromJson(json))?.toList() ?? [],
  );
}

class Article {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  Article ({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
    });

  factory Article.fromJson(Map<String, dynamic> json) => Article (
    source: json['source'] != null ? Source.fromJson(json["source"]) : null,
    author: json['author'] == null ? null : json['author'],
    title: json['title'],
    description: json['description'] == null ? '' : json['description'],
    url: json['url'],
    urlToImage: json["urlToImage"] == null ? 'https://firebasestorage.googleapis.com/v0/b/chatflutter-36b9a.appspot.com/o/2.png?alt=media&token=03dc5578-dd4d-4084-ab92-38ad1c151a42' : json["urlToImage"],
    // publishedAt: DateTime.parse(json["publishedAt"]),
    content: json["content"] == null ? null : json["content"],
  );
}

class Source {

    String id;
    String name;

    Source({
        this.id,
        this.name,
    });

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] == null ? null : json["id"],
        name: json["name"],
    );
}