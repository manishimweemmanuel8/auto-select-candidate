
import 'package:auto_select_candidate/app/features/combination/model/combination.dart';
import 'package:auto_select_candidate/app/features/combination/repository/repository.dart';

class CombinationController {
  final Repository _repository;

  CombinationController(this._repository);

  //get
  Future<List<Combination>> fetchCombinationList() async {
    return _repository.getCombinationList();
  }

    //get 2 latest
  Future<List<Combination>> fetchtwoLatestCombinationList() async {
    return _repository.getTwoLatestCombinationList();
  }

  Future<bool> createCombinationController(Combination combination) async {
    return _repository.createCombination(combination);
  }
  

  Future<bool> updateCombinationController(
      Combination combination, String combinationId) async {
    return _repository.updateCombination(combination, combinationId);
  }

  Future<Combination> getCombinationController(String combinationId) {
    return _repository.getCombination(combinationId);
  }
}
