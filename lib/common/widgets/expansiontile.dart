import 'package:flutter/material.dart';
import 'package:riv_task/common/widgets/bottomtiles.dart';

class XpansionTile extends StatelessWidget {
  final String text;
  final String text2;
  final void Function(bool)? onExpansionChanged;
  final Widget trailing;
  final List<Widget> children;

  const XpansionTile(
      {super.key,
      required this.text,
      required this.text2,
      this.onExpansionChanged,
      required this.trailing,
      required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.black),
        child: ExpansionTile(
          title: BottomTitles(
            text2: text2,
            text: text,
          ),
          tilePadding: const EdgeInsets.only(right: 10),
          childrenPadding: EdgeInsets.zero,
          onExpansionChanged: onExpansionChanged,
          controlAffinity: ListTileControlAffinity.trailing,
          trailing: trailing,
          children: children,
        ),
      ),
    );
  }
}
