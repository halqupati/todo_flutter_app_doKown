

import 'package:flutter/material.dart';

import '../../common/utils/constants.dart';
import 'appstyle.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, this.keyboardType, required this.hintText, this.suffixIcon, this.prefixIcon, this.hintStyle, required this.controller, this.onChanged}) : super(key: key);

  final TextInputType? keyboardType;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? hintStyle;
  final TextEditingController controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConst.kWidth*0.9,
      decoration: BoxDecoration(
        color: AppConst.kLight,
        borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius)),
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        cursorHeight: 25,
        onChanged: onChanged,
        style: appstyle(18, AppConst.kBkDark, FontWeight.w700),
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          suffixIconColor: AppConst.kBkDark,
          hintStyle: hintStyle,
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: AppConst.kRed,width: 0.5)
          ),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: Colors.transparent,width: 0.5)
          ),
          focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: AppConst.kRed,width: 0.5)
          ),
          disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: AppConst.kGreyDk,width: 0.5)
          ),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: AppConst.kBkDark,width: 0.5)
          ),
        ),
      ),
    );
  }
}
