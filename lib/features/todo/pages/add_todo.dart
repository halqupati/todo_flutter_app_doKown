
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

import '../../../common/utils/constants.dart';
import '../../../common/widgets/appstyle.dart';
import '../../../common/widgets/custom_text.dart';
import '../../../common/widgets/hieght_spacer.dart';
import '../../../common/widgets/showDialogue.dart';
import '../../../common/helpers/notification_helper.dart';
import '../../../common/models/task_model.dart';
import '../../../common/widgets/custom_otn_button.dart';
import '../controllers/date/date_provider.dart';
import '../controllers/todo/todo_provider.dart';
import '../pages/homepage.dart';


class AddTask extends ConsumerStatefulWidget {
  const AddTask({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTaskState();
}

class _AddTaskState extends ConsumerState<AddTask> {

  final TextEditingController title =TextEditingController();
  final TextEditingController desc =TextEditingController();
  List<int> notification = [];
  late NotificationsHelper notifierHelper;
  late NotificationsHelper controller;
  final TextEditingController search = TextEditingController();

  @override

  @override
  void initState(){
    notifierHelper = NotificationsHelper(ref: ref);
    Future.delayed(const Duration(seconds: 0),
            (){
          controller = NotificationsHelper(ref: ref);
        });
    debugPrint("Notification");
    print("notificationnnnnnnnnnnnnnnnnnnnnnnnnnnnn");
    notifierHelper.initilizeNotification();
    super.initState();
  }

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
                          notification= ref.read(startTimeStateProvider.notifier).dates(date);
                          print("notificationnnnnnnnnnn $notification[1]");
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
                  Task task =Task(
                    title: title.text,
                    desc: desc.text,
                    isCompleted: 0,
                    date: scheduleDate,
                    startTime: start.substring(10,16),
                    endTime: finish.substring(10,16),
                    remind: 0,
                    repeat: "yes"
                  );
                  notifierHelper.scheduledNotification(
                      notification[0],
                      notification[1],
                      notification[2],
                      notification[3],
                      task
                    );
                  ref.read(todoStateProvider.notifier).addItem(task);
                  //ref.read(finishTimeStateProvider.notifier).setFinish('');
                  //ref.read(startTimeStateProvider.notifier).setStart('');
                  //ref.read(dateStateProvider.notifier).setDate('');

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => const HomePage()));
                }else{
                  showAlertDialog(
                      context: context,
                      message: 'Failed to add Task');
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
