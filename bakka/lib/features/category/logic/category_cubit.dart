import 'package:bakka/features/category/data/model/category_model.dart';
import 'package:bakka/shared/core/constant_manager.dart';
import 'package:bakka/shared/core/url_manage.dart';
import 'package:bakka/shared/data/service/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  static CategoryCubit get(context) => BlocProvider.of(context);

  CategoriesModel ? categoriesModel;


  void getCategoriesData(){
    emit(LoadingCategoryDataState());
    DioHelper.getData(url: AppUrl.category,token: token ).then((value){
      categoriesModel=CategoriesModel.fromJson(value.data);
      print(categoriesModel!.data.data[0].image);
      emit(SuccessCategoryDataState());

    }).catchError((error){
      emit(ErrorCategoryDataState(error.toString()));

    });

  }
}
