import 'package:news_api/feature/data/models/news_model.dart';

abstract class HomeDataSourceRemoteInterface {
  Future<NewsModel?> getNews();
}
