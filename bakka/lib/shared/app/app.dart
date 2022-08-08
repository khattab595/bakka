import 'package:bakka/features/setting/logic/cubit/settings_cubit.dart';
import 'package:bakka/shared/core/theme_manager.dart';
import 'package:bakka/shared/logic/cubit/home/home_cubit.dart';
import 'package:bakka/shared/logic/cubit/main/main_cubit.dart';
import 'package:bakka/features/onboarding/logic/onbarding_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/auth/logic/cubit/auth_cubit.dart';
import '../../features/auth/logic/cubit/register/register_cubit.dart';
import '../../features/category/logic/category_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.isDark, required this.startWidget})
      : super(key: key);
  final bool? isDark;
  final Widget startWidget;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainCubit()..changeMode(fromShared: isDark),
        ),
        BlocProvider(create: (context) => OnbardingCubit()),
        BlocProvider(create: (context) => SettingsCubit()..getSettingsData()),
        BlocProvider(
            create: (context) => RegisterCubit()..changePasswordVisibility()),
        BlocProvider(
            create: (context) => AuthCubit()
              ..getUserData()
              ..changePasswordVisibility()),
        BlocProvider(
            create: (context) => HomeCubit()
              ..getHomeData()
              ..getCartData()
              ..getFavoriteData()
              ..getUserData()),
        BlocProvider(create: (context) => CategoryCubit()..getCategoriesData()),
      ],
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: getLightTheme(),
            darkTheme: getDarkTheme(),
            themeMode: MainCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: startWidget,
          );
        },
      ),
    );
  }
}
