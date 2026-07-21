import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_api/feature/data/models/news_model.dart';
import 'package:news_api/feature/pages/repo/data_source/home_data_source_remote_interface.dart';

class HomeDataSourceRemoteImplement implements HomeDataSourceRemoteInterface {
  @override
  Future<NewsModel> getNews() async {
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
      throw Exception(
        "Error in HomeDataSourceRemoteImplement: ${e.toString()}",
      );
    }
  }
}
