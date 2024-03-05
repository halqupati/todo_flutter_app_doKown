import 'dart:math';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_todo2/common/helpers/db_helpers.dart';
import 'package:riverpod_todo2/common/utils/constants.dart';

import '../../../../common/models/task_model.dart';
part 'todo_provider.g.dart';

@riverpod
class TodoState extends _$TodoState{
  @override
  List<Task> build(){
    return [];
  }

  List<dynamic> colors = const [
    Color(0xFFd80000),
    Color(0xFF027eb5),
    Color(0xFF20a31E),
    Color(0xFFF9F900),
    Color(0xFF330949),
  ];

  void refresh() async {
    final data = await DBHelper.getItems();

    state = data.map((e) => Task.fromJson(e)).toList();
  }

  void addItem(Task task) async{
    await DBHelper.createItem(task);
    refresh();
  }

  dynamic getRandomColor(){
    Random random = Random();
    int randomIndex = random.nextInt(colors.length);
    return colors[randomIndex];
  }

  void updateItem(int id,String title,String desc,int isCompleted,String date,String startTime,String endTime) async{
    await DBHelper.updateItem(id,title,desc,isCompleted,date,startTime, endTime);
    refresh();
  }

  Future<void> deleteTodo(int id) async{
    await DBHelper.deleteItem(id);
    refresh();
  }

  void markAsCompleted(int id,String title,String desc,int isCompleted,String date,String startTime,String endTime) async{
    await DBHelper.updateItem(id,title,desc,1,date,startTime, endTime);
    refresh();
  }
  // today
  String getToday(){
    DateTime today = DateTime.now();
    return today.toString().substring(0,10);
  }

  // tomorrow
  String getTomorrow(){
    DateTime tomorrow = DateTime.now().add(Duration(days: 1));
    return tomorrow.toString().substring(0,10);
  }

  // tomorrow
  String getDayAter(){
    DateTime tomorrow = DateTime.now().add(Duration(days: 2));
    return tomorrow.toString().substring(0,10);
  }
  
  List<String> last30days(){
    DateTime today = DateTime.now();
    DateTime oneMonthAgo = today.subtract(const Duration(days:30));
    
    List<String> dates =[];
    for(int i=0;i<30;i++){
      DateTime date = oneMonthAgo.add(Duration(days:1));
      dates.add(date.toString().substring(0,10));
    }
    return dates;
  }

  bool getStatus(Task data){
    bool? isCompleted;

    if (data.isCompleted ==0) {
      isCompleted =false;
    }else{
      isCompleted = true;
    }

    return isCompleted;

  }

}
