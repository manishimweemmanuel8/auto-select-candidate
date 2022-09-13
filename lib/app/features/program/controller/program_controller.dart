import 'package:auto_select_candidate/app/features/account/model/user.dart';
import 'package:auto_select_candidate/app/features/program/model/program.dart';
import 'package:auto_select_candidate/app/features/program/repository/repository.dart';

class ProgramController {
  final Repository _repository;

  ProgramController(this._repository);

  //get
  Future<List<Program>> fetchProgramList() async {
    return _repository.getProgramList();
  }

  Future<List<Program>> fetchLastTwoProgramList() async {
    return _repository.getLastTwoProgramList();
  }

  Future<bool> createProgramController(Program program) async {
    return _repository.createProgram(program);
  }

  Future<bool> updateProgramController(
      Program program, String programId) async {
    return _repository.updateProgram(program, programId);
  }

  Future<Program> getProgramController(String id) {
    return _repository.getProgram(id);
  }

  Future<String?> getProgramNameController(String id) {
    return _repository.getProgramName(id);
  }
}
