import 'package:auto_select_candidate/app/features/candidate/model/candidate.dart';

abstract class Repository {
  //get Candadate
  Future<List<Candidate>> getCandidateList();
  Future<Candidate> getCandidate(String candidateId);
}
