

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo2/common/helpers/db_helpers.dart';
import 'package:riverpod_todo2/common/models/user_model.dart';

final userProvider= StateNotifierProvider<UserState,List<UserModel>>((ref){
  return UserState();
});

class UserState extends StateNotifier<List<UserModel>>{
  UserState():super([]);

  void refresh() async {
    final data =await DBHelper.getUsers();

    state = data.map((e) => UserModel.fromJson(e)).toList();
  }
}