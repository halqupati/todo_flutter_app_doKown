import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/utils/constants.dart';
import '../../../common/widgets/custom_otn_button.dart';
import '../../../common/widgets/hieght_spacer.dart';

import '../../auth/pages/login_page.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

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
          const HieghtSpacer(hieght: 50),
          CustomOtlButton(
              onTap: (){
                Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context)=> const LoginPage()));
              },width: AppConst.kWidth*0.9, height: AppConst.kHeight*0.06, color: AppConst.kLight, text: "Login with phone number")
        ],
      ),
    );
  }
}
