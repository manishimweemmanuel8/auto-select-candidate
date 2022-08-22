import 'package:auto_select_candidate/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CandidateDashboard extends StatefulWidget {
  const CandidateDashboard({Key? key}) : super(key: key);

  @override
  State<CandidateDashboard> createState() => _CandidateDashboardState();
}

class _CandidateDashboardState extends State<CandidateDashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "potential candindate".toUpperCase(),
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "1000",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 120,
                height: 150,
                // padding: const EdgeInsets.only(left: 20),
                child: SvgPicture.asset("assets/icons/login.svg"),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: const Icon(
                  Icons.arrow_right_alt_outlined,
                  color: backgroundColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
