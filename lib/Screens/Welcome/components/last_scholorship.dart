import 'package:auto_select_candidate/constants.dart';
import 'package:flutter/material.dart';

class LastScholorShip extends StatefulWidget {
  final String name;
  final String date;
  final String description;
  const LastScholorShip(
      {Key? key,
      required this.name,
      required this.date,
      required this.description})
      : super(key: key);

  @override
  State<LastScholorShip> createState() => _LastScholorShipState();
}

class _LastScholorShipState extends State<LastScholorShip> {
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
              Container(
                // padding: const EdgeInsets.only(left: 15, top: 15),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name.toString().toUpperCase().substring(0, 50),
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.date.toString().substring(0, 10),
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Container(
          //       height: 20,
          //       width: 80,
          //       decoration: BoxDecoration(
          //         color: primaryColor,
          //         borderRadius: BorderRadius.circular(20),
          //       ),
          //       child: const Center(
          //         child: Text(
          //           "PCB",
          //           style: TextStyle(
          //             color: whiteColor,
          //             fontSize: 10,
          //           ),
          //         ),
          //       ),
          //     ),
          //     const SizedBox(
          //       width: 4,
          //     ),
          //     Container(
          //       height: 20,
          //       width: 80,
          //       decoration: BoxDecoration(
          //         color: primaryColor,
          //         borderRadius: BorderRadius.circular(20),
          //       ),
          //       child: const Center(
          //         child: Text(
          //           "MCB",
          //           style: TextStyle(
          //             color: whiteColor,
          //             fontSize: 10,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 110, right: 22),
            child: Text(
              widget.description.toString(),
              style: const TextStyle(fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}
