import 'package:auto_select_candidate/app/features/candidate/model/candidate.dart';
import 'package:auto_select_candidate/app/features/candidate/repository/repository.dart';

class CandidateController {
  final Repository _repository;

  CandidateController(this._repository);

  //get
  Future<List<Candidate>> fetchCandidateList() async {
    return _repository.getCandidateList();
  }

  Future<Candidate> getCandidateController(String candidateId) {
    return _repository.getCandidate(candidateId);
  }
}
