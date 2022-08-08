import 'package:bakka/shared/core/color_manger.dart';
import 'package:bakka/shared/core/style_manger.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String? Function(String?)? validate;
  final Function(String?)? onChanged;
  final double? height, width;
  final TextEditingController? textCtrl;
  final String hint;
  final String? initVal;
  final int? maxLines;
  final TextInputType keyboard;
  final bool obscureText;
  final Widget? icon;
  final Widget? suffix;

  const CustomFormField(
      {Key? key,
      this.validate,
      this.height,
      this.textCtrl,
      this.maxLines,
      required this.hint,
      this.width,
      this.keyboard = TextInputType.text,
      this.initVal,
      this.onChanged,
      required this.obscureText,
      this.icon, this.suffix})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validate,
      obscureText: obscureText,
      controller: textCtrl,
      initialValue: initVal,
      textAlign: TextAlign.center,
      maxLength: maxLines,
      keyboardType: keyboard,
      style: TextStyle(color: ColorManger.grey),
      onChanged: onChanged,
      decoration: InputDecoration(
        prefix: icon,
        suffix: suffix,
        hintText: hint,
        fillColor: Colors.grey.shade500,
        hintStyle: getMediumStyle(color: ColorManger.grey1),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.black)
        ),
      ),
    );
  }
}
