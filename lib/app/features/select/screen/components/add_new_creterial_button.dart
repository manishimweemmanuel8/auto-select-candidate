import 'package:auto_select_candidate/app/features/combination/screen/components/add_combination_form.dart';
import 'package:auto_select_candidate/app/features/criterial/screen/components/add_criterial_form.dart';
import 'package:auto_select_candidate/constants.dart';
import 'package:flutter/material.dart';

class AddNewSelectedButton extends StatelessWidget {
  final String scholorshipId;
  const AddNewSelectedButton({Key? key, required this.scholorshipId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: primaryColor),
      child: ElevatedButton(
        child: const Text(
          'Add new',
          style: TextStyle(
            color: whiteColor,
          ),
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            isDismissible: false,
            backgroundColor: whiteColor,
            builder: (BuildContext context) {
              return Container(
                padding: const EdgeInsets.only(left: 500, top: 20, right: 500),
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
                        'Add new Criterial',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: primaryColor),
                      ),
                    ),
                    const SizedBox(
                      height: defaultPadding,
                    ),
                    CriterialForm(scholorshipId: scholorshipId),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
