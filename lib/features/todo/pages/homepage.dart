import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riv_task/common/widgets/appstyle.dart';
import 'package:riv_task/common/widgets/custom_textfield.dart';
import 'package:riv_task/common/widgets/heightspacer.dart';
import 'package:riv_task/common/widgets/reusable_text.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: Icon(
                          FontAwesome.plus,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              HeightSpacer(hght: 12),
              CustomTextField(
                keyboardType: TextInputType.name,
                hintText: "Search",
                preffixIcon: Container(
                  padding: EdgeInsets.all(1),
                  child: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      FontAwesome.search,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
                suffixIcon: Icon(
                  Ionicons.filter,
                  color: Colors.black,
                ),
                hintStyle: appstyle(17, Colors.black, FontWeight.normal),
                controller: search,
              ),
              HeightSpacer(hght: 20),
            ],
          ),
          preferredSize: Size.fromHeight(85),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
      )),
    );
  }
}
