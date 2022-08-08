import 'dart:ui';

import 'package:bakka/shared/core/color_manger.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../valuse_manger.dart';

void showToast({
  required String message,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: choseToastColors(state),
      textColor: ColorManger.white,
      fontSize: AppSize.s16,
    );

enum ToastStates { SUCCESS, ERROR, WARNING }

Color choseToastColors(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = ColorManger.greenColor;
      break;
    case ToastStates.ERROR:
      color = ColorManger.error;
      break;
    case ToastStates.WARNING:
      color = ColorManger.greenColor;
      break;
  }
  return color;
}
