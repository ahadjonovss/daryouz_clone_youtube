import 'article_model.dart';

class AllNews {
  String status;
  int totalResults;
  List articles;

  AllNews(
      {required this.articles,
      required this.status,
      required this.totalResults});

  factory AllNews.fromJson(Map<String, dynamic> json) {
    return AllNews(
      articles: json['articles'].map((e)=>Article.fromJson(e)).toList(),
      status: json["status"]??"",
      totalResults: json['totalResults']??0,
    );
  }
}
