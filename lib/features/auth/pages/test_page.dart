import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riv_task/common/widgets/appstyle.dart';
import 'package:riv_task/common/widgets/reusable_text.dart';
import 'package:riv_task/features/auth/controllers/code_provider.dart';

class TestPage extends ConsumerWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String code = ref.watch(codeStateProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ReusableText(
              text: code,
              style: appstyle(
                20,
                Colors.black,
                FontWeight.normal,
              ),
            ),
            TextButton(
              onPressed: () {
                ref
                    .read(codeStateProvider.notifier)
                    .setStart("Hello, MujinPark");
              },
              child: const Text("Press Me"),
            ),
          ],
        ),
      ),
    );
  }
}
