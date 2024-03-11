
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

import '../../../common/utils/constants.dart';
import '../../../common/widgets/appstyle.dart';
import '../../../common/widgets/custom_text.dart';
import '../../../common/widgets/hieght_spacer.dart';
import '../../../common/widgets/custom_otn_button.dart';

import '../controllers/date/date_provider.dart';
import '../controllers/todo/todo_provider.dart';


class UpdateTask extends ConsumerStatefulWidget {
  const UpdateTask({super.key,required this.id});

  final int id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdateTaskState();
}

class _UpdateTaskState extends ConsumerState<UpdateTask> {

  final TextEditingController title =TextEditingController(text: titleVar);
  final TextEditingController desc =TextEditingController(text: descVar);

  @override
  Widget build(BuildContext context) {
    var scheduleDate = ref.watch(dateStateProvider);
    var start = ref.watch(startTimeStateProvider);
    var finish = ref.watch(finishTimeStateProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(padding: EdgeInsets.symmetric(horizontal:20.w),
      child: ListView(
          children: [
            const HieghtSpacer(hieght: 20),
            CustomTextField(
          hintText: "Add title",
          controller: title,
          hintStyle: appstyle(16, AppConst.kGreyLight, FontWeight.w600),),

            const HieghtSpacer(hieght: 20),
            CustomTextField(
              hintText: "Add description",
              controller: desc,
              hintStyle: appstyle(16, AppConst.kGreyLight, FontWeight.w600),),

            const HieghtSpacer(hieght: 20),

            CustomOtlButton(
              onTap: (){
                DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(2023, 1, 1),
                    maxTime: DateTime(2030, 12, 31),
                    theme: const DatePickerTheme(
                        doneStyle:
                        TextStyle(color:AppConst.kGreen, fontSize: 16)),
                     onConfirm: (date) {
                  ref.read(dateStateProvider.notifier).setDate(date.toString());
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
              },
                width: AppConst.kWidth,
                height: 52.h,
                color: AppConst.kLight,
                color2: AppConst.kBlueLight,
                text: scheduleDate =="" ? "Set Date":scheduleDate.substring(0,10)),

            const HieghtSpacer(hieght: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomOtlButton(
                  onTap: (){
                    DatePicker.showDateTimePicker(context,
                        showTitleActions: true,
                        onConfirm: (date) {
                      ref.read(startTimeStateProvider.notifier).setStart(date.toString());
                        }, locale: LocaleType.en);
                  },
                    width: AppConst.kWidth*0.4,
                    height: 52.h,
                    color: AppConst.kLight,
                    color2: AppConst.kBlueLight,
                    text: start =="" ? "Start Time":start.substring(10,16)),

                CustomOtlButton(
                    onTap: (){
                      DatePicker.showDateTimePicker(context,
                          showTitleActions: true,
                          onConfirm: (date) {
                            ref.read(finishTimeStateProvider.notifier).setFinish(date.toString());
                          }, locale: LocaleType.en);
                    },
                    width: AppConst.kWidth*0.4,
                    height: 52.h,
                    color: AppConst.kLight,
                    color2: AppConst.kBlueLight,
                    text: finish =="" ? "End Time":finish.substring(10,16)),
              ],
            ),
            const HieghtSpacer(hieght: 20),

            CustomOtlButton(
              onTap: (){
                if(
                title.text.isNotEmpty&&
                    desc.text.isNotEmpty&&
                    scheduleDate.isNotEmpty&&
                    start.isNotEmpty&&
                    finish.isNotEmpty
                ){

                  ref.read(todoStateProvider.notifier).updateItem(widget.id,title.text,desc.text,0,scheduleDate,start.substring(10,16),finish.substring(10,16));

                  Navigator.pop(context);
                }else{
                  print("Failed to add task");
                }

              },
                width: AppConst.kWidth,
                height: 52.h,
                color: AppConst.kLight,
                color2: AppConst.kGreen,
                text: "Submit")
          ],
      ),
      ),
    );
  }
}
