
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/utils/constants.dart';
import '../../../common/models/task_model.dart';

import '../widgets/todo_title.dart';
import '../controllers/todo/todo_provider.dart';

class ComplatedTask extends ConsumerWidget {
  const ComplatedTask({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Task> listDate =ref.watch(todoStateProvider);
    List lastMonthTask = ref.read(todoStateProvider.notifier).last30days();
    var completedList = listDate.where((element) => element.isCompleted == 1 || lastMonthTask.contains(element.date!.substring(0,10))).toList();

    return ListView.builder(
        itemCount: completedList.length,
        itemBuilder: (context,index) {
          final data = completedList[index];
          dynamic color = ref.read(todoStateProvider.notifier).getRandomColor();
          return TodoTitle(
            delete: (){
              ref.read(todoStateProvider.notifier).deleteTodo(data.id ?? 0);
            },
            editWidget: const SizedBox.shrink(),
            title: data.title,
            color: color,
            description: data.desc,
            start: data.startTime,
            end: data.endTime,
            switcher: const Icon(AntDesign.checkcircle,color: AppConst.kGreen,)
          );
        });
  }
}