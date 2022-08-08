import 'package:bakka/shared/core/color_manger.dart';
import 'package:bakka/shared/core/font_manager.dart';
import 'package:bakka/shared/core/style_manger.dart';
import 'package:bakka/shared/core/valuse_manger.dart';
import 'package:flutter/material.dart';

ThemeData getLightTheme() {
  return ThemeData(
    primaryColor: ColorManger.primary,
    primaryColorLight: ColorManger.primary,
    primaryColorDark: ColorManger.darkPrimary,
    disabledColor: ColorManger.grey1,
    splashColor: ColorManger.primary,
    //-----
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorManger.darkPrimary,
      focusColor: ColorManger.darkPrimary,
    ),
    //------------
    cardTheme: CardTheme(
      color: ColorManger.white,
      shadowColor: Colors.grey,
      elevation: AppSize.s4,
    ),
    //---------
    appBarTheme: AppBarTheme(
      color: ColorManger.primary,
      centerTitle: true,
      shadowColor: ColorManger.primary,
      actionsIconTheme: IconThemeData(color: ColorManger.darkPrimary),
      elevation: 0,
      titleTextStyle:
          getRegularStyle(color: ColorManger.darkPrimary, fontSize: FontSize.s18),
      iconTheme: IconThemeData(color: ColorManger.darkPrimary, size: AppSize.s22),
    ),
    //----------
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManger.grey1,
      buttonColor: ColorManger.primary,
      splashColor: ColorManger.primary,
    ),
    //--------------
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle: getRegularStyle(
            color: ColorManger.white,
            fontSize: FontSize.s16,
          ),
          primary: ColorManger.primary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s16))),
    ),

    //------------------
    textTheme: TextTheme(
      displayLarge: getRegularStyle(
        color: ColorManger.darkGrey,
        fontSize: FontSize.s16,
      ),
      headlineLarge: getRegularStyle(
        color: ColorManger.grey,
        fontSize: FontSize.s16,
      ),
      titleMedium: getRegularStyle(
        color: ColorManger.grey1,
        fontSize: FontSize.s14,
      ),
      bodyLarge: getRegularStyle(
        color: ColorManger.grey,
        fontSize: FontSize.s12,
      ),
      bodySmall: getRegularStyle(
        color: ColorManger.grey,
      ),
    ),
    //-------------
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(
        color: ColorManger.grey,
        fontSize: FontSize.s16,
      ),
      labelStyle: getMediumStyle(
        color: ColorManger.grey,
        fontSize: FontSize.s14,
      ),
      errorStyle: getRegularStyle(
        color: ColorManger.error,
        fontSize: FontSize.s14,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManger.primary,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.circular(
          AppPadding.p8,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.grey,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.circular(
          AppPadding.p8,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManger.error, width: AppSize.s1_5),
        borderRadius: BorderRadius.circular(AppPadding.p8),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManger.primary, width: AppSize.s1_5),
        borderRadius: BorderRadius.circular(AppPadding.p8),
      ),
    ),
    //-----------
  );
}

ThemeData getDarkTheme() {
  return ThemeData(
    primaryColor: ColorManger.darkPrimary,
    primaryColorLight: ColorManger.darkPrimary,
    primaryColorDark: ColorManger.primary,
    disabledColor: ColorManger.grey1,
    splashColor: ColorManger.darkPrimary,
    //-----
    //-----
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorManger.darkPrimary,
      focusColor: ColorManger.darkPrimary,
    ),
    cardTheme: CardTheme(
      color: ColorManger.white,
      shadowColor: Colors.grey,
      elevation: AppSize.s4,
    ),
    //---------
    appBarTheme: AppBarTheme(
      color: ColorManger.grey1,
      centerTitle: true,
      shadowColor: ColorManger.darkPrimary,
      elevation: 0,
      actionsIconTheme: IconThemeData(color: ColorManger.primary),
      titleTextStyle:
          getRegularStyle(color: ColorManger.white, fontSize: FontSize.s18,),
      iconTheme: IconThemeData(color: ColorManger.white, size: AppSize.s22,),
    ),
    //----------
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManger.grey1,
      buttonColor: ColorManger.primary,
      splashColor: ColorManger.primary,
    ),
    //--------------
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle: getRegularStyle(
            color: ColorManger.white,
            fontSize: FontSize.s16,
          ),
          primary: ColorManger.primary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s16))),
    ),

    //------------------
    textTheme: TextTheme(
      displayLarge: getRegularStyle(
        color: ColorManger.darkGrey,
        fontSize: FontSize.s16,
      ),
      headlineLarge: getRegularStyle(
        color: ColorManger.grey,
        fontSize: FontSize.s16,
      ),
      titleMedium: getRegularStyle(
        color: ColorManger.grey1,
        fontSize: FontSize.s14,
      ),
      bodyLarge: getRegularStyle(
        color: ColorManger.grey,
        fontSize: FontSize.s12,
      ),
      bodySmall: getRegularStyle(
        color: ColorManger.grey,
      ),
    ),
    //-------------
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(
        color: ColorManger.grey,
        fontSize: FontSize.s16,
      ),
      labelStyle: getMediumStyle(
        color: ColorManger.grey,
        fontSize: FontSize.s14,
      ),
      errorStyle: getRegularStyle(
        color: ColorManger.error,
        fontSize: FontSize.s14,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManger.primary,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.circular(
          AppPadding.p8,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.grey,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.circular(
          AppPadding.p8,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManger.error, width: AppSize.s1_5),
        borderRadius: BorderRadius.circular(AppPadding.p8),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManger.primary, width: AppSize.s1_5),
        borderRadius: BorderRadius.circular(AppPadding.p8),
      ),
    ),
    //-----------
  );
}
