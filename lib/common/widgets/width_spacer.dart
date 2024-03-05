
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidthSpacer extends StatelessWidget {
  final double wydth;
  const WidthSpacer({
    super.key, required this.wydth,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: wydth.w,
    );
  }
}