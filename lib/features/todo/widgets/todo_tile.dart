import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:riv_task/common/utils/constants.dart';
import 'package:riv_task/common/widgets/appstyle.dart';
import 'package:riv_task/common/widgets/heightspacer.dart';
import 'package:riv_task/common/widgets/reusable_text.dart';
import 'package:riv_task/common/widgets/widthspacer.dart';

class TodoTile extends StatelessWidget {
  final String? title;
  final String? description;
  final String? start;
  final String? end;
  final Color? color;
  final Widget? editWidget;
  final Widget? switcher;
  final void Function()? deleteTap;

  const TodoTile(
      {super.key,
      this.color,
      this.title,
      this.description,
      this.start,
      this.end,
      this.editWidget,
      this.deleteTap,
      this.switcher});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            width: AppConst.kWidth,
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 5,
                      decoration: BoxDecoration(
                        //TODO: add dynamic color
                        color: color ?? Colors.purple,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    const WidthSpacer(wdth: 10),
                    Padding(
                      padding: EdgeInsets.all(8.h),
                      child: SizedBox(
                        width: AppConst.kWidth * 0.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReusableText(
                              text: title ?? "Title random",
                              style:
                                  appstyle(18, Colors.black, FontWeight.normal),
                            ),
                            const HeightSpacer(hght: 3),
                            ReusableText(
                              text: description ?? "Description random",
                              style:
                                  appstyle(15, Colors.black, FontWeight.normal),
                            ),
                            const HeightSpacer(hght: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: AppConst.kWidth * 0.3,
                                  height: 25.h,
                                  decoration: BoxDecoration(
                                    // border: Border.all(
                                    //   width: 0.3,
                                    //   // color: Colors.pink,
                                    // ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    color: Colors.grey.shade300,
                                  ),
                                  child: Center(
                                    child: ReusableText(
                                      text: "$start || $end",
                                      style: appstyle(
                                          13, Colors.black, FontWeight.normal),
                                    ),
                                  ),
                                ),
                                const WidthSpacer(wdth: 20),
                                Row(
                                  children: [
                                    SizedBox(
                                      child: editWidget,
                                    ),
                                    const WidthSpacer(wdth: 20),
                                    GestureDetector(
                                      onTap: deleteTap,
                                      child: const Icon(
                                        FontAwesome.trash_o,
                                        size: 18,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 0.h),
                  child: switcher,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
