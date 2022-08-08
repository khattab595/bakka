import 'package:bakka/shared/core/assets_manager.dart';
import 'package:bakka/shared/core/strings_manager.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../data/model/onboarding_model.dart';

part 'onbarding_state.dart';

class OnbardingCubit extends Cubit<OnbardingState> {
  OnbardingCubit() : super(OnbardingInitial());
  static OnbardingCubit get(context) => BlocProvider.of(context);
  List<OnBoardingModel> boarding = [
    OnBoardingModel(
        image: ImageAssets.onBoardingLogo1,
        title: AppStrings.onBoardingTitle1,
        body: AppStrings.onBoardingSubTitle1),
    OnBoardingModel(
        image: ImageAssets.onBoardingLogo2,
        title: AppStrings.onBoardingTitle2,
        body: AppStrings.onBoardingSubTitle2),
    OnBoardingModel(
        image: ImageAssets.onBoardingLogo3,
        title: AppStrings.onBoardingTitle3,
        body: AppStrings.onBoardingSubTitle3),
    OnBoardingModel(
        image: ImageAssets.onBoardingLogo4,
        title: AppStrings.onBoardingTitle4,
        body: AppStrings.onBoardingSubTitle4),
  ];

  var boardController = PageController();
  bool isLast = false;
}
