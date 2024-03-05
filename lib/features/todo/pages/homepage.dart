
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo2/common/helpers/notification_helper.dart';
import 'package:riverpod_todo2/common/utils/constants.dart';
import 'package:riverpod_todo2/common/widgets/expansion_tile.dart';
import 'package:riverpod_todo2/common/widgets/reusable_text.dart';
import 'package:riverpod_todo2/features/todo/controllers/todo/todo_provider.dart';
import 'package:riverpod_todo2/features/todo/controllers/xpantion_provider.dart';
import 'package:riverpod_todo2/features/todo/widgets/tomorrow_list.dart';

import '../../../common/models/task_model.dart';
import '../../../common/widgets/appstyle.dart';
import '../../../common/widgets/custom_text.dart';
import '../../../common/widgets/hieght_spacer.dart';
import '../../../common/widgets/width_spacer.dart';
import '../widgets/completed_task.dart';
import '../widgets/dayAfterTomorrow.dart';
import '../widgets/today_task.dart';
import '../widgets/todo_title.dart';
import 'add_todo.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>  with TickerProviderStateMixin{
  late final TabController tabController = TabController(length: 2, vsync: this);
  late NotificationsHelper notifierHelper;
  late NotificationsHelper controller;
  final TextEditingController search = TextEditingController();


  @override
  void initState(){
    notifierHelper = NotificationsHelper(ref: ref);
    Future.delayed(const Duration(seconds: 0),
        (){
      controller = NotificationsHelper(ref: ref);
        });
    notifierHelper.initilizeNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(todoStateProvider.notifier).refresh();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(text: "Dashboard", style: appstyle(18, AppConst.kLight, FontWeight.bold)),
                  Container(
                    width: 25.w,
                    height: 25.h,
                    decoration: const BoxDecoration(
                      color: AppConst.kLight,
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                    ),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddTask()));
                      },
                      child: const Icon(Icons.add,color: AppConst.kBkDark,),
                    ),
                  )
                ],
              ),
              ),
              const HieghtSpacer(hieght: 10),
              CustomTextField(
                hintText: "Search",
                controller: search,
                prefixIcon: Container(
                  padding: EdgeInsets.all(14.h),
                  child: GestureDetector(
                    onTap: null,
                    child: const Icon(
                      AntDesign.search1,
                      color: AppConst.kGreyLight,
                    ),
                  ),
                ),
                suffixIcon:const Icon(
                  FontAwesome.sliders,color: AppConst.kGreyLight,
                ),
              ),
              const HieghtSpacer(hieght: 15),
            ],
          ),
        ),
      ),
      body:SafeArea(
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            const HieghtSpacer(hieght: 25),
            Row(
              children: [
                const Icon(FontAwesome.tasks,size: 20,color: AppConst.kLight,),
                const WidthSpacer(wydth: 10),
                ReusableText(text: "Today's Tasks", style: appstyle(18, AppConst.kLight, FontWeight.bold))],
            ),
            const HieghtSpacer(hieght: 25),

            Container(
              decoration: BoxDecoration(
                color: AppConst.kLight,
                borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius))
              ),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                  color: AppConst.kGreyLight,
                  borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius))
                ),
                controller: tabController,
                labelPadding: EdgeInsets.zero,
                isScrollable: false,
                labelColor: AppConst.kBlueLight,
                labelStyle: appstyle(24, AppConst.kBlueLight, FontWeight.w700),
                unselectedLabelColor: AppConst.kLight,
                tabs: [
                  Tab(
                    child: SizedBox(
                      width: AppConst.kWidth*0.5,
                      child: Center(
                        child: ReusableText(text: "Pending",
                            style: appstyle(18, AppConst.kBkDark, FontWeight.bold)),
                      ),
                    ),
                  ),

                  Tab(
                    child: Container(
                      padding: EdgeInsets.only(left: 30.w),
                      width: AppConst.kWidth*0.5,
                      child: Center(
                        child: ReusableText(text: "Completed",
                            style: appstyle(18, AppConst.kBkDark, FontWeight.bold)),
                      ),
                    ),
                  )
                ],
              ),
            ),

            const HieghtSpacer(hieght: 20),

            SizedBox(
              height: AppConst.kHeight*0.3,
              width: AppConst.kWidth,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius)),
                child: TabBarView(
                  controller: tabController,
                  children: [
                    Container(
                      color: AppConst.kBkLight,
                      height: AppConst.kHeight*0.3,
                      child: const TodayTask()
                    ),

                    Container(
                      color: AppConst.kBkLight,
                      height: AppConst.kHeight*0.3,
                      child: const ComplatedTask(),
                    ),
                  ],
                ),
              ),

            ),

            const HieghtSpacer(hieght: 20),

            TomorrowList(),

            const HieghtSpacer(hieght: 20),

            AfterTomorrowList(),
          ],
        ),),
      ) );
  }
}



