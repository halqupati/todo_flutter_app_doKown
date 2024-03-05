

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo2/common/widgets/appstyle.dart';
import 'package:riverpod_todo2/common/widgets/reusable_text.dart';
import 'package:riverpod_todo2/features/auth/controllers/code_provider.dart';

class TestPage extends ConsumerWidget{
  const TestPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref){
    String code = ref.watch(codeStateProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ReusableText(text: code, style: appstyle(18, Colors.white, FontWeight.bold)),
            TextButton(
              onPressed: (){
                ref.read(codeStateProvider.notifier).setString("Hello Hussien2");
              },
              child: Text("Press Me"))
          ],
        ),
      ),
    );
  }
}