import 'package:auto_select_candidate/app/features/criterial/model/criterial.dart';
import 'package:auto_select_candidate/app/features/criterial/repository/repository.dart';

class CriterialController {
  final Repository _repository;

  CriterialController(this._repository);

  //get
  Future<List<Criterial>> fetchCriterialList(String scholorshipId) async {
    return _repository.getCriterialList(scholorshipId);
  }

  Future<bool> createCriterialController(Criterial criterial ) async {
    return _repository.createCriterial(criterial);
  }

  Future<bool> updateCriterialController(
      Criterial criterial, String criterialId) async {
    return _repository.updateCriterial(criterial, criterialId);
  }

  Future<Criterial> getCriterialController(String criterialId) {
    return _repository.getCriterial(criterialId);
  }
}
