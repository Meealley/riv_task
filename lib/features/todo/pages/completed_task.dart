import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/models/task_model.dart';
import '../controllers/todo/todo_provider.dart';
import '../widgets/todo_tile.dart';

class CompletedTask extends ConsumerWidget {
  const CompletedTask({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Task> listData = ref.watch(todoStateProvider);
    List lastMonth = ref.read(todoStateProvider.notifier).last30days();

    var completedList = listData
        .where((element) =>
            element.isCompleted == 1 ||
            lastMonth.contains(element.date!.substring(0, 10)))
        .toList();

    return ListView.builder(
      itemCount: completedList.length,
      itemBuilder: (context, index) {
        final data = completedList[index];

        // bool isCompleted = ref.read(todoStateProvider.notifier).getStatus(data);
        dynamic color = ref.read(todoStateProvider.notifier).getRandomColor();

        return TodoTile(
          deleteTap: () {
            ref.read(todoStateProvider.notifier).deleteTodo(data.id ?? 0);
          },
          editWidget: SizedBox.shrink(),
          color: color,
          title: data.title,
          description: data.desc,
          start: data.startTime,
          end: data.endTime,
          switcher: Icon(
            FontAwesome.check_circle,
            color: Colors.green,
          ),
        );
      },
    );
  }
}
