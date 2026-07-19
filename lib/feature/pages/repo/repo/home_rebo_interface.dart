import 'package:news_api/feature/data/models/news_model.dart';

abstract class HomeRepoInterface {
  Future<NewsModel?> getNews();
}
