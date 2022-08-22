import 'package:auto_select_candidate/constants.dart';
import 'package:flutter/material.dart';

class RecentScholorship extends StatefulWidget {
  const RecentScholorship({Key? key}) : super(key: key);

  @override
  State<RecentScholorship> createState() => _RecentScholorshipState();
}

class _RecentScholorshipState extends State<RecentScholorship> {
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
              Icons.school_outlined,
              color: whiteColor,
            ),
          ),
          Text(
            "CUBA-RWANDA GOVERNMENT SCHOLARSHIPS".substring(0, 30),
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
          const Text(
            "15-Aug-2022",
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
    
  }
}