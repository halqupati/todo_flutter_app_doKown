

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo2/common/helpers/db_helpers.dart';
import 'package:riverpod_todo2/common/models/user_model.dart';
import 'package:riverpod_todo2/features/auth/repository/auh_repository.dart';
import 'package:riverpod_todo2/features/auth/controllers/code_provider.dart';

final authControllerProvider= Provider((ref){
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository:authRepository);
});

class AuthController{
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  void verifyOtpCode({
    required BuildContext context,
    required String smsCodeId,
    required String smsCode,
    required bool mounted,
}){
    authRepository.verifyOtp(
        context: context,
        smsCodeId: smsCodeId,
        smsCode: smsCode,
        mounted: mounted);
  }

  void sendSms({
    required BuildContext context,
    required String phone
}){
    authRepository.sendOtp(context: context, phone: phone);
  }

}

class UserState extends StateNotifier<List<UserModel>>{
  UserState():super([]);

  void refresh() async {
    final data =await DBHelper.getUsers();

    state = data.map((e) => UserModel.fromJson(e)).toList();
  }
}