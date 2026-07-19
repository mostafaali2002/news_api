import 'package:news_api/feature/data/models/news_model.dart';
import 'package:news_api/feature/pages/repo/data_source/home_data_source_remote_interface.dart';
import 'package:news_api/feature/pages/repo/repo/home_rebo_interface.dart';

class HomeRepoImplement implements HomeRepoInterface {
  final HomeDataSourceRemoteInterface _homeDataSourceRemoteInterface;
  HomeRepoImplement(this._homeDataSourceRemoteInterface);

  @override
  Future<NewsModel?> getNews() async {
    return await _homeDataSourceRemoteInterface.getNews();
  }
}
