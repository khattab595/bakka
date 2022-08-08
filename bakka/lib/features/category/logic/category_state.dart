part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class LoadingCategoryDataState extends CategoryState {}

class SuccessCategoryDataState extends CategoryState {}

class ErrorCategoryDataState extends CategoryState {
  final String error;

  ErrorCategoryDataState(this.error);
}
