
import 'package:flutter/material.dart';

class HieghtSpacer extends StatelessWidget {
  const HieghtSpacer({
    super.key, required this.hieght,
  });
  final double hieght;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hieght,
    );
  }
}
