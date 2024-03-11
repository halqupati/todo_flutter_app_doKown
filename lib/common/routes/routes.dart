
import 'package:flutter/material.dart';

import '../../features/auth/pages/login_page.dart';
import '../../features/auth/pages/otp_page.dart';
import '../../features/todo/pages/homepage.dart';
import '../../features/onborading/pages/onborading.dart';

class Routes{

  static const onboarding ='onboarding';
  static const login ='login';
  static const otp ='otp';
  static const home ='home';

  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case onboarding:
        return MaterialPageRoute(builder: (context) => OnBorading());
      case login:
        return MaterialPageRoute(builder: (context) =>LoginPage());
      case otp:
        final Map args = settings.arguments as Map;
        return MaterialPageRoute(builder: (context) => OtpPage(
          phone: args['phone'],
          smsCodeId: args['smsCodeId'],));
      case home:
        return MaterialPageRoute(builder: (context) =>HomePage());
      default:
        return MaterialPageRoute(builder: (context) =>HomePage());

    }
  }

}