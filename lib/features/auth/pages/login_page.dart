import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/utils/constants.dart';
import '../../../common/widgets/appstyle.dart';
import '../../../common/widgets/custom_otn_button.dart';
import '../../../common/widgets/hieght_spacer.dart';
import '../../../common/widgets/showDialogue.dart';
import '../../../common/widgets/custom_text.dart';
import '../../../common/widgets/reusable_text.dart';

import '../controllers/code_provider.dart';
import '../controllers/auth_controller.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController phone = TextEditingController();

  Country country = Country(
    phoneCode: "1",
    countryCode: "US",
    e164Sc:0,
    geographic: true,
    level: 1,
    name: "USA",
    example: "USA",
    displayName: "United States",
    displayNameNoCountryCode: "US",
    e164Key: "",
      );
  sendCodeToUser(){
    if(phone.text.isEmpty){
      return showAlertDialog(context: context, message: "Please enter your phone number");
    }else if(phone.text.length <8 ){
      return showAlertDialog(context: context, message: "Your phone nmuber is short");
    }else{
      ref.read(authControllerProvider).sendSms(
          context: context, phone: '+${country.phoneCode}${phone.text}');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: ListView(
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Image.asset("assets/img/3.png",width: 300,),),

              HieghtSpacer(hieght: 20),

              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 16.w),
                child: ReusableText(text:"Please enter your phone number", style: appstyle(17, AppConst.kLight, FontWeight.w500),),
              ),

              HieghtSpacer(hieght: 20),
              Center(
                child: CustomTextField(
                  controller: phone,
                  prefixIcon: Container(
                    padding: EdgeInsets.all(14),
                    child: GestureDetector(
                      onTap: (){
                        showCountryPicker(
                            context: context,
                            countryListTheme: CountryListThemeData(
                              backgroundColor: AppConst.kGreyLight,
                              bottomSheetHeight: AppConst.kHeight*0.6,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(AppConst.kRadius),
                                topRight: Radius.circular(AppConst.kRadius),
                              ),
                            ),
                            onSelect: (code){
                          setState(() {
                            setState(() {
                              country=code;
                            });
                          });
                          print(ref.read(codeStateProvider));
                            });
                      },
                      child: ReusableText(
                        text:"${country.flagEmoji}+ ${country.phoneCode}",
                        style: appstyle(18, AppConst.kBkDark, FontWeight.bold),
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  hintText: "Enter phone number",
                  hintStyle: appstyle(16, AppConst.kBkDark, FontWeight.w500),

                ),
              ),

              HieghtSpacer(hieght: 20),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomOtlButton(
                    onTap: (){
                      sendCodeToUser();
                    },
                    width: AppConst.kWidth*0.9, height: AppConst.kHeight*0.07,color2: AppConst.kLight, color: AppConst.kBkDark, text: "Send Code"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
