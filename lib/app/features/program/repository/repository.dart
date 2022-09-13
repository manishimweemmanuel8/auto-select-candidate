import 'package:auto_select_candidate/app/features/program/model/program.dart';

abstract class Repository {
  //get programs
  Future<List<Program>> getProgramList();

    //get last two programs
  Future<List<Program>> getLastTwoProgramList();

  //create new program
  Future<bool> createProgram(Program program);

  //create new program
  Future<bool> updateProgram(Program program, String programId);

  // get program

  Future<Program> getProgram(String id);

  
  Future<String?> getProgramName(String id);
}
