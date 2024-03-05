

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpod_todo2/common/utils/constants.dart';
import 'package:riverpod_todo2/common/widgets/appstyle.dart';
import 'package:riverpod_todo2/common/widgets/hieght_spacer.dart';
import 'package:riverpod_todo2/common/widgets/reusable_text.dart';
import 'package:riverpod_todo2/common/widgets/width_spacer.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key, this.payload}) : super(key: key);

  final String? payload;
  @override
  Widget build(BuildContext context) {
    var title = payload!.split('|')[0];
    var desc = payload!.split('|')[1];
    var date = payload!.split('|')[2];
    var start = payload!.split('|')[3];
    var finish = payload!.split('|')[4];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
            child: Container(
              width: AppConst.kWidth,
              height: AppConst.kHeight*0.7,
              decoration:BoxDecoration(
                color: AppConst.kBkLight,
                borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius))
              ),
              child: Padding(
                padding: EdgeInsets.all(12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(text: "Reminder",
                        style: appstyle(40, AppConst.kLight, FontWeight.bold)),

                    HieghtSpacer(hieght: 5),

                    Container(
                      width: AppConst.kWidth,
                      padding: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        color: AppConst.kYellow,
                        borderRadius: BorderRadius.all(Radius.circular(9.h),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ReusableText(text:"Today => ",
                              style: appstyle(12, AppConst.kBkDark, FontWeight.bold)),

                          ReusableText(text: "From: $start   To: $finish",
                              style: appstyle(15, AppConst.kBkDark, FontWeight.w600))
                        ],
                      ),
                    ),

                    HieghtSpacer(hieght: 10),

                    ReusableText(text: title,
                        style: appstyle(30, AppConst.kBkDark, FontWeight.bold)),

                    HieghtSpacer(hieght: 10),

                    Text(desc,
                        maxLines: 8,
                        textAlign: TextAlign.justify,
                        style: appstyle(16, AppConst.kLight, FontWeight.bold)),
                  ],
                ),
              ),
            ),
            ),

            Positioned(
                right: 12.w,
                top: -10,
                child: Image.asset("assets/icons/bell.png",
                  width: 70.w,
                  height: 70.h,)),
            Positioned(
                bottom:-AppConst.kHeight*0.143,
                left: 0,
                right: 0,
                child: Image.asset("assets/img/notification2.png",
                  width: AppConst.kWidth*0.8,
                  height: AppConst.kHeight*0.5,)),
          ],
        ),
      ),
    );
  }
}
