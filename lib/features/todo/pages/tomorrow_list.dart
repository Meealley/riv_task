import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riv_task/common/utils/constants.dart';
import 'package:riv_task/features/todo/controllers/todo/todo_provider.dart';

import '../../../common/widgets/expansiontile.dart';
import '../controllers/xpansion_provider.dart';
import '../widgets/todo_tile.dart';
import 'updatetask.dart';

class TomorrowList extends ConsumerWidget {
  const TomorrowList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoStateProvider);
    final color = ref.read(todoStateProvider.notifier).getRandomColor();
    String tomorrow = ref.read(todoStateProvider.notifier).getTomorrow();

    var tomorrowTasks =
        todos.where((element) => element.date!.contains(tomorrow));
    return XpansionTile(
      text: DateFormat.yMMMMEEEEd()
          .format(DateTime.now().add(const Duration(days: 1))),
      text2: "Tasks are shown here",
      onExpansionChanged: (bool expanded) {
        ref.read(xpansionStateProvider.notifier).setStart(!expanded);
      },
      trailing: ref.watch(xpansionStateProvider)
          ? const Icon(
              Icons.arrow_circle_down,
              color: Colors.purple,
            )
          : const Icon(
              Icons.arrow_circle_up,
              color: Colors.purple,
            ),
      children: [
        for (final todo in tomorrowTasks)
          TodoTile(
            title: todo.title,
            description: todo.desc,
            color: color,
            start: todo.startTime,
            end: todo.endTime,
            deleteTap: () {
              ref.read(todoStateProvider.notifier).deleteTodo(todo.id ?? 0);
            },
            editWidget: GestureDetector(
              onTap: () {
                titles = todo.title.toString();
                descs = todo.desc.toString();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateTask(
                      id: todo.id ?? 0,
                    ),
                  ),
                );
              },
              child: Icon(FontAwesome.edit),
            ),
            switcher: SizedBox.shrink(),
          ),
        // ReusableText(
        //     text: "I Plan to read my boooks all day long",
        //     style: appstyle(16, Colors.black, FontWeight.normal))
      ],
    );
  }
}
