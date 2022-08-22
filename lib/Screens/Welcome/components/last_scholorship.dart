import 'package:auto_select_candidate/constants.dart';
import 'package:flutter/material.dart';

class LastScholorShip extends StatefulWidget {
  const LastScholorShip({Key? key}) : super(key: key);

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
                children: const [
                  Text(
                    "CUBA-RWANDA GOVERNMENT SCHOLARSHIPS",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "15-Aug-2022 09:30",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 20,
                width: 80,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    "PCB",
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Container(
                height: 20,
                width: 80,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    "MCB",
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 110, right: 22),
            child: Text(
              "The higher education council (HEC) wishes to infomr the general public that through the bilateral cooperation between the Republic of CUBA and governmanet of Rwanda, the latter has offerde to the covernment of Rwanda one(1) partial scholarshp for Bachelor's levels, in the field of general medicine in academic year 2023"
                  .substring(0, 300),
              style: const TextStyle(fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}
