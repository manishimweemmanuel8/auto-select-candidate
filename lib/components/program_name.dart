import 'package:auto_select_candidate/app/features/program/controller/program_controller.dart';
import 'package:auto_select_candidate/app/features/program/model/program.dart';
import 'package:auto_select_candidate/app/features/program/repository/program_repository.dart';
import 'package:flutter/material.dart';

class ProgramName extends StatefulWidget {
  final String programId;
  const ProgramName({Key? key, required this.programId}) : super(key: key);

  @override
  State<ProgramName> createState() => _ProgramNameState();
}

class _ProgramNameState extends State<ProgramName> {
  var programController = ProgramController(ProgramRepository());
  late Future<Program> futureProgram;

  @override
  void initState() {
    futureProgram =
        programController.getProgramController(widget.programId.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<Program>(
        future: futureProgram,
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
