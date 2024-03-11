
import 'package:flutter/material.dart';

import '../../../common/utils/constants.dart';
import 'titles.dart';

class XpansionTile extends StatelessWidget {
  const XpansionTile({Key? key,
    required this.text,
    required this.text2,
    this.onExpansionChange,
    this.trailing,
    required this.childern}) : super(key: key);

  final String text;
  final String text2;
  final void Function(bool)? onExpansionChange;
  final Widget? trailing;
  final List<Widget> childern;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppConst.kBkLight,
        borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius)),
      ),
      child: Theme(data: Theme.of(context).copyWith(dividerColor: Colors.transparent
      ), child: ExpansionTile(
        title: BottomTitles(
            text: text,
            text2: text2
        ),
        tilePadding: EdgeInsets.zero,
        childrenPadding: EdgeInsets.zero,
        onExpansionChanged: onExpansionChange,
        controlAffinity: ListTileControlAffinity.trailing,
        trailing: trailing,
        children: childern,
      ),
      ),
    );
  }
}
