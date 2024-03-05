


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpod_todo2/common/utils/constants.dart';
import 'package:riverpod_todo2/common/widgets/appstyle.dart';
import 'package:riverpod_todo2/common/widgets/reusable_text.dart';

showAlertDialog({
  required BuildContext context,
  required String message,
  String? btnText,
}){
  return showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          content: ReusableText(text: message,
              style: appstyle(18, AppConst.kLight, FontWeight.w600)),
          contentPadding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0.h),
          actions: [
            TextButton(
                onPressed: ()=>Navigator.pop(context),
                child: Text(btnText?? "OK",
                style: appstyle(18, AppConst.kGreyLight, FontWeight.w600),))
          ],
        );
      });
}