
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/utils/constants.dart';
import '../../../common/widgets/appstyle.dart';
import '../../../common/widgets/hieght_spacer.dart';
import '../../../common/widgets/reusable_text.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConst.kHeight,
      width: AppConst.kWidth,
      color: AppConst.kBkDark,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Image.asset("assets/img/3.png"),
          ),
          const HieghtSpacer(hieght: 100),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ReusableText(text: "ToDo with Kown", style: appstyle(30, AppConst.kLight, FontWeight.w600)),
              const HieghtSpacer(hieght: 10),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 30.w),
                child: Text("Welcome ,Do you want to create a task fast and with ease",textAlign: TextAlign.center ,style: appstyle(16, AppConst.kGreyLight,FontWeight.normal)),
              ),
              ],

          )
        ],
      ),
    );
  }
}
