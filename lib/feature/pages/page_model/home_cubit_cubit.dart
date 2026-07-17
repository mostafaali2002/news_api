import 'package:bloc/bloc.dart';

import 'package:news_api/feature/data/api/news_api.dart';
import 'package:news_api/feature/data/models/articles_model.dart';

part 'home_cubit_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit() : super(HomeCubitInitial());

  void featchNews() async {
    emit(HomeCubitLoading());
    var response = await NewsApi.getNews();
    if (response != null) {
      emit(HomeCubitSuccess(articles: response.articles!));
    } else {
      emit(HomeCubitError(errorMessage: "Error"));
    }
  }
}
