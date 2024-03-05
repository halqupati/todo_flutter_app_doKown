import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo2/features/todo/controllers/todo/todo_provider.dart';
import 'package:riverpod_todo2/features/todo/widgets/todo_title.dart';

import '../../../common/utils/constants.dart';
import '../../../common/widgets/expansion_tile.dart';
import '../controllers/xpantion_provider.dart';
import '../pages/update_task.dart';

class TomorrowList extends ConsumerWidget {
  const TomorrowList({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref){

  final todos = ref.watch(todoStateProvider);
  var color = ref.read(todoStateProvider.notifier).getRandomColor();
  String tomorrow = ref.read(todoStateProvider.notifier).getTomorrow();
  var tomorrowTasks = todos.where((element) => element.date!.contains(tomorrow));

    return XpansionTile(
        text: "Tomorrow's Task",
        text2: "Tomorrow's Tasks shown here",
        onExpansionChange: (bool expanded){
          ref.read(xpantionState0Provider.notifier).setStart(!expanded);
        },
        trailing:  Padding(
          padding:  EdgeInsets.only(right:12.0.w),
          child: ref.watch(xpantionState0Provider)?
          const Icon(AntDesign.circledown,color:
          AppConst.kLight,):
          const Icon(AntDesign.closecircleo,color:
          AppConst.kLight,),
        ),
        childern: [
          for(final todo in tomorrowTasks)
          TodoTitle(
            title: todo.title,
            description: todo.desc,
            color: color,
            start:todo.startTime,
            end:todo.endTime,
            delete: (){
              ref.read(todoStateProvider.notifier).deleteTodo(todo.id ?? 0);
            },
            editWidget: GestureDetector(
              onTap: (){
                titleVar =todo.title.toString();
                descVar = todo.desc.toString();
                Navigator.push(context,
                    MaterialPageRoute(builder: (contex)=> UpdateTask(id: todo.id??0)));
              },
              child: const Icon(MaterialCommunityIcons.circle_edit_outline),
            ),
            switcher: const SizedBox.shrink(),
          ),
        ]);
  }
}
