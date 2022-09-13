import 'package:auto_select_candidate/app/features/scholorship/controller/scholorship_controller.dart';
import 'package:auto_select_candidate/app/features/scholorship/model/scholorship.dart';
import 'package:auto_select_candidate/app/features/scholorship/repository/scholorship_repository.dart';
import 'package:auto_select_candidate/constants.dart';
import 'package:flutter/material.dart';

class ScholorshipName extends StatefulWidget {
  final String scholorshipId;
  const ScholorshipName({Key? key, required this.scholorshipId})
      : super(key: key);

  @override
  State<ScholorshipName> createState() => _ScholorshipNameState();
}

class _ScholorshipNameState extends State<ScholorshipName> {
  var scholorshipController = ScholorshipController(ScholorshipRepository());

  late Future<Scholorship> fetchScholorship;

  @override
  void initState() {
    fetchScholorship = scholorshipController
        .getScholorshipController(widget.scholorshipId.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<Scholorship>(
        future: fetchScholorship,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.names.toString());
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const CircularProgressIndicator(
            color: primaryColor,
          );
        },
      ),
    );
  }
}
