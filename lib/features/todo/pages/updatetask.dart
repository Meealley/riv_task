import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
// import 'package:riv_task/common/models/task_model.dart';
import 'package:riv_task/common/utils/constants.dart';
import 'package:riv_task/common/widgets/appstyle.dart';
import 'package:riv_task/common/widgets/custom_btn.dart';
import 'package:riv_task/common/widgets/custom_textfield.dart';
import 'package:riv_task/common/widgets/heightspacer.dart';
import 'package:riv_task/common/widgets/reusable_text.dart';
import 'package:riv_task/common/widgets/widthspacer.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import 'package:riv_task/features/todo/controllers/dates/dates_provider.dart';
import 'package:riv_task/features/todo/controllers/todo/todo_provider.dart';

class UpdateTask extends ConsumerStatefulWidget {
  final int id;

  const UpdateTask({super.key, required this.id});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdateTaskState();
}

class _UpdateTaskState extends ConsumerState<UpdateTask> {
  final TextEditingController title = TextEditingController(text: titles);
  final TextEditingController desc = TextEditingController(text: descs);

  @override
  Widget build(BuildContext context) {
    var scheduledDate = ref.watch(dateStateProvider);
    var startTime = ref.watch(startTimeStateProvider);
    var endTime = ref.watch(finishTimeStateProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade100,
        elevation: 1,
        title: ReusableText(
          text: "Update tasks",
          style: appstyle(
            18,
            Colors.black,
            FontWeight.normal,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          children: [
            const HeightSpacer(hght: 10),
            CustomTextField(
              keyboardType: TextInputType.text,
              hintText: 'Title',
              hintStyle: appstyle(16, Colors.black, FontWeight.normal),
              controller: title,
            ),
            const HeightSpacer(hght: 20),
            CustomTextField(
              hintText: "Description",
              controller: desc,
              keyboardType: TextInputType.text,
              hintStyle: appstyle(
                15,
                Colors.black,
                FontWeight.normal,
              ),
            ),
            const HeightSpacer(hght: 30),
            CustomOutlnBtn(
              width: AppConst.kWidth,
              color2: Colors.yellow,
              height: 53,
              color: Colors.purple,
              text: scheduledDate == ""
                  ? "Set Date"
                  : DateFormat.yMMMMEEEEd().format(
                      DateTime.parse(scheduledDate),
                    ),
              style: appstyle(17, Colors.white, FontWeight.normal),
              onTap: () {
                picker.DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(2023, 3, 5),
                    maxTime: DateTime(2030, 6, 7),
                    theme: picker.DatePickerTheme(
                      // headerColor: Colors.blue,
                      // backgroundColor: Colors.grey,
                      itemStyle: appstyle(17, Colors.black, FontWeight.normal),
                      doneStyle: appstyle(16, Colors.black, FontWeight.normal),
                    ),
                    //     onChanged: (date) {
                    //   print('change $date in time zone ' +
                    //       date.timeZoneOffset.inHours.toString());
                    // },
                    onConfirm: (date) {
                  // print('confirm $date');
                  ref.read(dateStateProvider.notifier).setDate(date.toString());
                }, currentTime: DateTime.now(), locale: picker.LocaleType.en);
              },
            ),
            const HeightSpacer(hght: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomOutlnBtn(
                  width: AppConst.kWidth * 0.4,
                  color2: Colors.yellow,
                  height: 53,
                  color: Colors.purple,
                  text: startTime == ""
                      ? "Start time"
                      : DateFormat.Hm().format(DateTime.parse(startTime)),
                  style: appstyle(17, Colors.white, FontWeight.normal),
                  onTap: () {
                    picker.DatePicker.showTime12hPicker(context,
                        showTitleActions: true, onConfirm: (date) {
                      ref.read(startTimeStateProvider.notifier).setStart(
                            date.toString(),
                          );
                    }, currentTime: DateTime.now());
                  },
                ),
                const WidthSpacer(wdth: 10),
                CustomOutlnBtn(
                  width: AppConst.kWidth * 0.4,
                  color2: Colors.yellow,
                  height: 53,
                  color: Colors.purple,
                  text: endTime == ""
                      ? "End time"
                      : DateFormat.Hm().format(DateTime.parse(endTime)),
                  style: appstyle(17, Colors.white, FontWeight.normal),
                  onTap: () {
                    picker.DatePicker.showTime12hPicker(context,
                        showTitleActions: true, onConfirm: (date) {
                      ref.read(finishTimeStateProvider.notifier).setStart(
                            date.toString(),
                          );
                    }, currentTime: DateTime.now());
                  },
                ),
              ],
            ),
            const HeightSpacer(hght: 20),
            CustomOutlnBtn(
              onTap: () {
                if (title.text.isNotEmpty &&
                    desc.text.isNotEmpty &&
                    startTime.isNotEmpty &&
                    endTime.isNotEmpty) {
                  // Task task = Task(
                  //   title: title.text,
                  //   desc: desc.text,
                  //   isCompleted: 0,
                  //   date: scheduledDate,
                  //   startTime: startTime,
                  //   endTime: endTime,
                  //   remind: 0,
                  //   repeat: 'yes',
                  // );
                  ref.read(todoStateProvider.notifier).updateItem(
                        widget.id,
                        title.text,
                        desc.text,
                        0,
                        scheduledDate,
                        startTime.substring(10, 16),
                        endTime.substring(10, 16),
                      );
                  // ref.read(todoStateProvider.notifier).addItem(task);
                  ref.read(dateStateProvider.notifier).setDate("");
                  ref.read(startTimeStateProvider.notifier).setStart("");
                  ref.read(finishTimeStateProvider.notifier).setStart("");
                  Navigator.pop(context);
                } else {
                  print("Failed to add task");
                }
              },
              width: AppConst.kWidth,
              color2: Colors.yellow,
              height: 53,
              color: Colors.green,
              text: "Add task",
              style: appstyle(17, Colors.white, FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
