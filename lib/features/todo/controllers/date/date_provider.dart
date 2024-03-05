import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'date_provider.g.dart';

@riverpod
class DateState extends _$DateState{
  @override
  String build(){
    return "";
  }

  void setDate(String NewState){
    state = NewState;
  }
}


@riverpod
class StartTimeState extends _$StartTimeState{
  @override
  String build(){
    return "";
  }

  void setStart(String NewState){
    state = NewState;
  }

  List<int> dates(DateTime startDate){
    DateTime now=DateTime.now();
    Duration difference = startDate.difference(now);

    int days = difference.inDays;
    int hours = difference.inHours % 24;
    int minutes = difference.inMinutes % 60;
    int seconds = difference.inSeconds % 60;
    print("dayssssdddddddddddddddddddddddddddd $days");
    return[days,hours,minutes,seconds];
  }
}



@riverpod
class FinishTimeState extends _$FinishTimeState{
  @override
  String build(){
    return "";
  }

  void setFinish(String NewState){
    state = NewState;
  }
}

