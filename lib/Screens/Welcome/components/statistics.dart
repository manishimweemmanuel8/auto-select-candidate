import 'package:auto_select_candidate/constants.dart';
import 'package:flutter/material.dart';

class Statistic extends StatefulWidget {
  final String name;
  final String count;
  const Statistic({Key? key, required this.name, required this.count})
      : super(key: key);

  @override
  State<Statistic> createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 400,
      decoration: BoxDecoration(
        color: whiteColor,
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
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.data_exploration,
              color: whiteColor,
            ),
          ),
          Text(
            widget.name.toUpperCase(),
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.count,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
