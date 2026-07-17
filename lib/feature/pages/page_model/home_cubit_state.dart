part of 'home_cubit_cubit.dart';

sealed class HomeCubitState {}

final class HomeCubitInitial extends HomeCubitState {}

final class HomeCubitError extends HomeCubitState {
  String errorMessage;
  HomeCubitError({required this.errorMessage});
}

final class HomeCubitLoading extends HomeCubitState {}

final class HomeCubitSuccess extends HomeCubitState {
  List<ArticlesModel> articles;
  HomeCubitSuccess({required this.articles});
}
