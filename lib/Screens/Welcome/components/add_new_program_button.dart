import 'package:auto_select_candidate/constants.dart';
import 'package:flutter/material.dart';

class AddNewProgramButton extends StatelessWidget {
  const AddNewProgramButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
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
              Icons.add,
              color: whiteColor,
            ),
          ),
          const Text(
            "ADD NEW SCHOLARSHIP",
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
          const Visibility(
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            visible: false,
            child: Text(
              "Invisible Widget",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
