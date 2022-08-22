import 'package:auto_select_candidate/constants.dart';
import 'package:flutter/material.dart';

class ProgramCard extends StatefulWidget {
  final String program;
  final String country;
  final String studyYears;
  final String studyLanguage;
  const ProgramCard(
      {Key? key,
      required this.program,
      required this.country,
      required this.studyYears,
      required this.studyLanguage})
      : super(key: key);

  @override
  State<ProgramCard> createState() => _ProgramCardState();
}

class _ProgramCardState extends State<ProgramCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 400,
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.03),
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
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.schema_outlined,
                  color: whiteColor,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.program.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 150, right: 50),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Country :"),
                    Text(
                      widget.country,
                      style: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Language :"),
                    Text(
                      widget.studyLanguage,
                      style: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Year :"),
                    Text(
                      widget.studyYears,
                      style: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
