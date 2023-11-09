import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riv_task/common/utils/constants.dart';
import 'package:riv_task/common/widgets/appstyle.dart';
import 'package:riv_task/common/widgets/custom_btn.dart';
import 'package:riv_task/common/widgets/custom_textfield.dart';
import 'package:riv_task/common/widgets/heightspacer.dart';
import 'package:riv_task/common/widgets/reusable_text.dart';
import 'package:riv_task/common/widgets/widthspacer.dart';

class AddTask extends ConsumerStatefulWidget {
  const AddTask({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTaskState();
}

class _AddTaskState extends ConsumerState<AddTask> {
  final TextEditingController title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: ReusableText(
          text: "Add tasks",
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
              controller: title,
              keyboardType: TextInputType.text,
              hintStyle: appstyle(
                15,
                Colors.black,
                FontWeight.normal,
              ),
            ),
            HeightSpacer(hght: 30),
            CustomOutlnBtn(
              width: AppConst.kWidth,
              color2: Colors.yellow,
              height: 53,
              color: Colors.blue,
              text: "Set Date",
              style: appstyle(17, Colors.white, FontWeight.normal),
            ),
            HeightSpacer(hght: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomOutlnBtn(
                    width: AppConst.kWidth * 0.4,
                    color2: Colors.yellow,
                    height: 53,
                    color: Colors.blue,
                    text: "Start time",
                    style: appstyle(17, Colors.white, FontWeight.normal)),
                WidthSpacer(wdth: 10),
                CustomOutlnBtn(
                  width: AppConst.kWidth * 0.4,
                  color2: Colors.yellow,
                  height: 53,
                  color: Colors.blue,
                  text: "End time",
                  style: appstyle(17, Colors.white, FontWeight.normal),
                ),
              ],
            ),
            HeightSpacer(hght: 20),
            CustomOutlnBtn(
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
