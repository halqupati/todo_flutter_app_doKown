
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:riverpod_todo2/common/utils/constants.dart';
import 'package:riverpod_todo2/common/widgets/appstyle.dart';
import 'package:riverpod_todo2/common/widgets/hieght_spacer.dart';
import 'package:riverpod_todo2/common/widgets/reusable_text.dart';

import '../controllers/auth_controller.dart';

class OtpPage extends ConsumerWidget {
  const OtpPage({Key? key, required this.phone,required this.smsCodeId}) : super(key: key);

  final String smsCodeId;
  final String phone;

  void verifyOtpCode(
      BuildContext context,WidgetRef ref,String smsCode
      ){
    ref.read(authControllerProvider).verifyOtpCode(
        context: context,
        smsCodeId: smsCodeId,
        smsCode: smsCode,
        mounted: true);
  }
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HieghtSpacer(hieght: AppConst.kHeight*0.15),
              Padding(padding: EdgeInsets.symmetric(horizontal: 30.w),
              child:Image.asset("assets/img/3.png",width: AppConst.kWidth*0.5,),),

              const HieghtSpacer(hieght: 26),

              ReusableText(text: "Enter your otp code",
                  style: appstyle(18, AppConst.kLight, FontWeight.bold)),

              const HieghtSpacer(hieght: 26),

              Pinput(
                length:6,
                showCursor: true,
                onCompleted: (value){
                  if(value.length == 6){
                    return verifyOtpCode(context, ref, value);
                  }
                },
                onSubmitted: (value){
                  if(value.length == 6){

                  }
                },
              )

            ],
          ),
        ),
      ),
    );
  }
}
