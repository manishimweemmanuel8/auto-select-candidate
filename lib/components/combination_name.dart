import 'package:auto_select_candidate/app/features/combination/controller/combination_controller.dart';
import 'package:auto_select_candidate/app/features/combination/model/combination.dart';
import 'package:auto_select_candidate/app/features/combination/repository/combination_repository.dart';
import 'package:auto_select_candidate/app/features/program/model/program.dart';
import 'package:flutter/material.dart';

class CombinationName extends StatefulWidget {
  final String combintaionId;
  const CombinationName({Key? key, required this.combintaionId})
      : super(key: key);

  @override
  State<CombinationName> createState() => _CombinationNameState();
}

class _CombinationNameState extends State<CombinationName> {
  var combinationController = CombinationController(CombinationRepository());
  late Future<Combination> futureCombination;

  @override
  void initState() {
    futureCombination = combinationController
        .getCombinationController(widget.combintaionId.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<Combination>(
        future: futureCombination,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.name.toString());
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
