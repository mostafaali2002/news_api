import 'package:bloc/bloc.dart';

import 'package:news_api/feature/data/models/articles_model.dart';
import 'package:news_api/feature/pages/repo/repo/home_rebo_interface.dart';

part 'home_cubit_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit(this._homeRepoInterface) : super(HomeCubitInitial());
  final HomeRepoInterface _homeRepoInterface;
  Future<void> fetchNews() async {
    emit(HomeCubitLoading());
    var response = await _homeRepoInterface.getNews();
    if (response != null) {
      emit(HomeCubitSuccess(articles: response.articles!));
    } else {
      emit(HomeCubitError(errorMessage: "Error"));
    }
  }
}
