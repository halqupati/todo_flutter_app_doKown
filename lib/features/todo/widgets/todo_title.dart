
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:riverpod_todo2/common/utils/constants.dart';
import 'package:riverpod_todo2/common/widgets/appstyle.dart';
import 'package:riverpod_todo2/common/widgets/hieght_spacer.dart';
import 'package:riverpod_todo2/common/widgets/reusable_text.dart';
import 'package:riverpod_todo2/common/widgets/width_spacer.dart';

class TodoTitle extends StatelessWidget {
  const TodoTitle({Key? key, this.color, this.title, this.description, this.start, this.end, this.editWidget, this.delete, this.switcher}) : super(key: key);

  final Color? color;
  final String? title;
  final String? description;
  final String? start;
  final String? end;
  final Widget? editWidget;
  final void Function()? delete;
  final Widget? switcher;



  @override
  Widget build(BuildContext context) {
    return Padding(padding:
    EdgeInsets.only(bottom: 8.h),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(8.h),
            width: AppConst.kWidth,
            decoration: BoxDecoration(
              color: AppConst.kGreyLight,
              borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius)),
                        //ToTo latter //
                        color: color ?? AppConst.kRed,
                      ),
                    ),

                    WidthSpacer(wydth: 15),

                    Padding(padding: EdgeInsets.all(8.h),
                    child: SizedBox(
                      width: AppConst.kWidth*0.6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(text: title ?? "Title of Task",
                              style: appstyle(18, AppConst.kLight, FontWeight.bold)),

                          const HieghtSpacer(hieght: 3),

                          ReusableText(text: description ?? "Description of Task",
                              style: appstyle(12, AppConst.kLight, FontWeight.normal)),

                          const HieghtSpacer(hieght: 10),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: AppConst.kWidth*0.3,
                                height: 25,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 0.3,
                                    color: AppConst.kGreyLight,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius)),
                                  color: AppConst.kBkDark,
                                ),

                                child:
                                Center(
                                  child: ReusableText(text: "$start | $end ",
                                      style: appstyle(12, AppConst.kLight, FontWeight.normal)),
                                ),
                              ),

                              WidthSpacer(wydth: 20),

                              Row(
                                children: [

                                  SizedBox(
                                    child: editWidget,
                                  ),
                                  
                                  WidthSpacer(wydth: 20),
                                  
                                  GestureDetector(
                                    onTap: delete,
                                    child: const Icon(MaterialCommunityIcons.delete_circle,),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),)
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 0.h),
                  child: switcher,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
