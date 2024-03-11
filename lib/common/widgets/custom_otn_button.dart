
import 'package:flutter/material.dart';

import 'appstyle.dart';
import 'reusable_text.dart';

class CustomOtlButton extends StatelessWidget {
  const CustomOtlButton({Key? key, this.onTap, required this.width, required this.height, this.color2, required this.color, required this.text}) : super(key: key);

  final void Function()? onTap;
  final double width;
  final double height;
  final Color? color2;
  final Color color;
  final String text;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color2,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          border: Border.all(width: 1,color: color),
        ),
        child: Center(
          child: ReusableText(
            text: text ,style: appstyle(18, color, FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
