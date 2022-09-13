import 'package:auto_select_candidate/app/features/candidate/controller/candidate_controller.dart';
import 'package:auto_select_candidate/app/features/candidate/model/candidate.dart';
import 'package:auto_select_candidate/app/features/candidate/repository/candidate_repository.dart';
import 'package:auto_select_candidate/app/features/combination/controller/combination_controller.dart';
import 'package:auto_select_candidate/app/features/combination/model/combination.dart';
import 'package:auto_select_candidate/app/features/combination/repository/combination_repository.dart';
import 'package:auto_select_candidate/app/features/program/model/program.dart';
import 'package:flutter/material.dart';

class CandidateName extends StatefulWidget {
  final String candidateId;
  const CandidateName({Key? key, required this.candidateId}) : super(key: key);

  @override
  State<CandidateName> createState() => _CandidateNameState();
}

class _CandidateNameState extends State<CandidateName> {
  var candidateController = CandidateController(CandidateRepository());
  late Future<Candidate> futureCandidate;

  @override
  void initState() {
    futureCandidate = candidateController
        .getCandidateController(widget.candidateId.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<Candidate>(
        future: futureCandidate,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(
                '${snapshot.data!.names.toString()} => ${snapshot.data!.marks} ');
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
