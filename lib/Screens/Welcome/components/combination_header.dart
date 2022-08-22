import 'package:auto_select_candidate/constants.dart';
import 'package:flutter/material.dart';

class CombinationHeaderPage extends StatefulWidget {
  const CombinationHeaderPage({Key? key}) : super(key: key);

  @override
  State<CombinationHeaderPage> createState() => _CombinationHeaderPageState();
}

class _CombinationHeaderPageState extends State<CombinationHeaderPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Combinations'.toUpperCase(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {},
              child: const Text("View all : 20",
                  style: TextStyle(fontSize: 15, color: primaryColor)),
            ),
          ],
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(22),
          ),
          child: const Icon(
            Icons.add,
            color: backgroundColor,
          ),
        ),
      ],
    );
  }
}
