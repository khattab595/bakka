import 'package:bakka/features/auth/view/login/login_view.dart';
import 'package:bakka/features/home/view/home_view.dart';
import 'package:bakka/features/onboarding/view/onboarding_view.dart';
import 'package:bakka/shared/app/app.dart';
import 'package:bakka/shared/core/constant_manager.dart';
import 'package:bakka/shared/core/widget/my_app_drawer.dart';
import 'package:bakka/shared/data/service/cache_helper.dart';
import 'package:bakka/shared/data/service/dio_helper.dart';
import 'package:flutter/material.dart';



void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: "isDark");
  bool? onBoarding = CacheHelper.getData(key: "onBoarding");

 token  = CacheHelper.getData(key:"token");

    print("token ${token.toString()}");
  Widget widget;
  if(onBoarding!= null){

    if( token!= null) {
      widget=const MainHome();
    } else {
      widget=LoginView();
    }
  }else{
    widget=const OnBoardingView();
  }
  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,

    //onBoarding: onBoarding,
  ));
}
