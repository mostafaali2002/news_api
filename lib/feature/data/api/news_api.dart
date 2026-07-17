import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_api/feature/data/models/news_model.dart';

abstract class NewsApi {
  static Future<NewsModel?> getNews() async {
    try {
      Uri url = Uri.https("newsapi.org", "/v2/top-headlines", {
        "country": "us",
        "apiKey": "9d6296063d6841b3a4a9176b1a35d47a",
      });

      var response = await http.get(url);
      var data = response.body;
      var json = jsonDecode(data);
      return NewsModel.fromjson(json);
    } on Exception catch (e) {
      throw (e);
    }
  }
}
