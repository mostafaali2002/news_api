import 'package:news_api/data/models/articles_model.dart';

class NewsModel {
  String? status;
  int? totalResults;
  List<ArticlesModel>? articles;
  NewsModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  NewsModel.fromjson(Map<String, dynamic> json) {
    status = json["status"];
    totalResults = json["totalResults"];
    if (json["articles"] != null) {
      articles = [];
      json["articles"].forEach((v) {
        articles!.add(ArticlesModel.fromjson(v));
      });
    }
  }
}
