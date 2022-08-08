import 'package:bakka/features/auth/data/model/login_model.dart';
import 'package:bakka/shared/core/url_manage.dart';
import 'package:bakka/shared/data/service/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/core/constant_manager.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);
  LoginModel? loginModel;
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(AuthLoginLoadingState());
    DioHelper.postData(
      url: AppUrl.login,
      data: {
        "email": email,
        "password": password,
      },
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);

      emit(AuthLoginSuccessState(loginModel!));
    }).catchError((error) {
      emit(AuthLoginErrorState(error.toString()));
    });
  }


  IconData suffix = Icons.visibility;
  bool isPassword = true;
  void changePasswordVisibility() {
    suffix = Icons.visibility_off_outlined;
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(AuthShowPasswordState());
  }

  LoginModel? userData;
  void getUserData() {
    emit(AuthProfileLoadingState());
    DioHelper.getData(url: AppUrl.profile, token: token).then((value) {
      userData = LoginModel.fromJson(value.data);

      emit(AuthProfileSuccessState(userData!));
    }).catchError((error) {
      emit(AuthProfileErrorState(error.toString()));
    });
  }
}
