import 'package:daryouz_clone/components/models/source_model.dart';

class Article {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Article(
      {required this.source,
      required this.description,
      required this.title,
      required this.url,
      required this.publishedAt,
      required this.author,
      required this.content,
      required this.urlToImage});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      description: json["description"]??"no data",
      title: json["title"]??"no data",
      url: json['url']??"",
      publishedAt: json["publishedAt"]??"no data",
      author: json["author"]??"Nobody",
      content: json["content"]??"no content",
      urlToImage: json["urlToImage"]??"https://source.unsplash.com/random/300x200",
    );
  }
}
