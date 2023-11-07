import 'package:flutter/material.dart';
import 'package:riv_task/common/utils/constants.dart';
import 'package:riv_task/common/widgets/appstyle.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType keyboardType;
  final String hintText;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final Widget? preffixIcon;
  final TextStyle hintStyle;
  final Color? suffixIconColor;
  final void Function(String)? onChanged;
  const CustomTextField(
      {super.key,
      required this.keyboardType,
      required this.hintText,
      this.suffixIcon,
      this.preffixIcon,
      this.suffixIconColor,
      required this.hintStyle,
      required this.controller,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConst.kWidth * 0.9,
      height: AppConst.kHeight * 0.06,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: TextFormField(
        style: appstyle(16, Colors.black, FontWeight.w500),
        onChanged: onChanged,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: preffixIcon,
          suffixIconColor: suffixIconColor,
          hintStyle: hintStyle,
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
