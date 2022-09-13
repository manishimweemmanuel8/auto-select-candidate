import 'package:auto_select_candidate/app/features/scholorship/screen/components/add_scholorship_form.dart';
import 'package:auto_select_candidate/constants.dart';
import 'package:flutter/material.dart';

class AddNewScholorShipButton extends StatelessWidget {
  const AddNewScholorShipButton({Key? key}) : super(key: key);

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
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                isDismissible: false,
                backgroundColor: whiteColor,
                builder: (BuildContext context) {
                  return Container(
                    padding:
                        const EdgeInsets.only(left: 500, top: 20, right: 500),
                    height: 600,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40)),
                      color: primaryColor.withOpacity(0.05),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.cancel_outlined,
                                  color: primaryColor,
                                )),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.all(defaultPadding),
                          child: Text(
                            'Add new scholorship',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: primaryColor),
                          ),
                        ),
                        const SizedBox(
                          height: defaultPadding,
                        ),
                        const ScholorshipForm(),
                      ],
                    ),
                  );
                },
              );
            },
            child: Container(
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
