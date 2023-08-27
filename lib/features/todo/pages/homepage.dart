
import 'package:flutter/material.dart';
import 'package:riverpod_todo2/common/utils/constants.dart';
import 'package:riverpod_todo2/common/widgets/reusable_text.dart';

import '../../../common/widgets/appstyle.dart';
import '../../../common/widgets/hieght_spacer.dart';
import '../../../common/widgets/width_spacer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ReusableText(text:"Todo" ,style:appstyle(26,AppConst.kBlueLight,FontWeight.bold)
    ),
          //const HieghtSpacer(hieght:30),
          //const WidthSpacer(wydth: 20),
          ReusableText(text:"Todo" ,style:appstyle(26,AppConst.kBlueLight,FontWeight.bold)
          ),
        ],
      ));
  }
}


