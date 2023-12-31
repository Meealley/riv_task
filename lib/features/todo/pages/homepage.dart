import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:intl/intl.dart';
// import 'package:riv_task/common/models/task_model.dart';
import 'package:riv_task/common/utils/constants.dart';
import 'package:riv_task/common/widgets/appstyle.dart';
import 'package:riv_task/common/widgets/custom_textfield.dart';
// import 'package:riv_task/common/widgets/expansiontile.dart';
import 'package:riv_task/common/widgets/heightspacer.dart';
import 'package:riv_task/common/widgets/reusable_text.dart';
import 'package:riv_task/common/widgets/widthspacer.dart';
import 'package:riv_task/features/todo/controllers/todo/todo_provider.dart';
// import 'package:riv_task/features/todo/controllers/xpansion_provider.dart';
import 'package:riv_task/features/todo/pages/add_todo.dart';
import 'package:riv_task/features/todo/pages/completed_task.dart';
import 'package:riv_task/features/todo/pages/dayAfterTomorrow.dart';
import 'package:riv_task/features/todo/pages/tomorrow_list.dart';
// import 'package:riv_task/features/todo/widgets/todo_tile.dart';

import 'todays_task.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  late final TabController tabController =
      TabController(length: 2, vsync: this);
  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.watch(todoStateProvider.notifier).refresh();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(85),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      text: "Dashboard",
                      style: appstyle(19, Colors.black, FontWeight.w500),
                    ),
                    Container(
                      width: 25.w,
                      height: 25.h,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AddTask()));
                        },
                        child: const Icon(
                          FontAwesome.plus,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const HeightSpacer(hght: 12),
              CustomTextField(
                keyboardType: TextInputType.name,
                hintText: "Search",
                preffixIcon: Container(
                  padding: const EdgeInsets.all(1),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      FontAwesome.search,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
                suffixIcon: const Icon(
                  Ionicons.filter,
                  color: Colors.black,
                ),
                hintStyle: appstyle(17, Colors.black, FontWeight.normal),
                controller: search,
              ),
              const HeightSpacer(hght: 20),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: ListView(
            children: [
              const HeightSpacer(hght: 20),
              Row(
                children: [
                  const Icon(FontAwesome.calendar),
                  const WidthSpacer(wdth: 5),
                  ReusableText(
                    text: "Today's Tasks",
                    style: appstyle(
                      18,
                      Colors.black,
                      FontWeight.normal,
                    ),
                  )
                ],
              ),
              const HeightSpacer(hght: 20),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    color: Colors.purple.shade200,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  controller: tabController,
                  labelPadding: EdgeInsets.zero,
                  labelStyle: appstyle(19, Colors.black, FontWeight.normal),
                  isScrollable: false,
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      child: SizedBox(
                        width: AppConst.kWidth * 0.5,
                        child: Center(
                          child: ReusableText(
                            text: "Pending",
                            style: appstyle(17, Colors.black, FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: const EdgeInsets.only(left: 10),
                        width: AppConst.kWidth * 0.5,
                        child: Center(
                          child: ReusableText(
                            text: "Completed",
                            style: appstyle(17, Colors.black, FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const HeightSpacer(
                hght: 20,
              ),
              SizedBox(
                height: AppConst.kHeight * 0.3,
                width: AppConst.kWidth,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Container(
                        color: Colors.purple.shade100,
                        height: AppConst.kHeight * 0.4,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TodayTask(),
                        ),
                      ),
                      Container(
                        color: Colors.green.shade100,
                        height: AppConst.kHeight * 0.3,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CompletedTask(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const HeightSpacer(hght: 15),
              const TomorrowList(),
              const HeightSpacer(hght: 18),
              const DayAfterTomorrowList(),
              const HeightSpacer(hght: 18),
            ],
          ),
        ),
      ),
    );
  }
}
