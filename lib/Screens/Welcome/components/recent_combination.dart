import 'package:auto_select_candidate/constants.dart';
import 'package:flutter/material.dart';

class RecentCombination extends StatefulWidget {
  final String combination;
  final String abbreviation;
  const RecentCombination(
      {Key? key, required this.combination, required this.abbreviation})
      : super(key: key);

  @override
  State<RecentCombination> createState() => _RecentCombinationState();
}

class _RecentCombinationState extends State<RecentCombination> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 400,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: backgroundColor.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            // padding: const EdgeInsets.only(left: 20, top: 15),
            // color: primaryColor,
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.class_rounded,
              color: primaryColor,
            ),
          ),
          Text(
            widget.combination,
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.w500, color: whiteColor),
          ),
          Text(
            widget.abbreviation.toUpperCase(),
            style: const TextStyle(
                fontSize: 17, fontWeight: FontWeight.w500, color: whiteColor),
          ),
        ],
      ),
    );
  }
}
