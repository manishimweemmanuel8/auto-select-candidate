import 'package:auto_select_candidate/app/features/account/model/user.dart';
import 'package:auto_select_candidate/app/features/combination/model/combination.dart';
import 'package:auto_select_candidate/app/features/program/model/program.dart';

abstract class Repository {
  //get combination
  Future<List<Combination>> getCombinationList();

    //get 2 latest combination
  Future<List<Combination>> getTwoLatestCombinationList();

  //create new Combination
  Future<bool> createCombination(Combination Combination);

  //create new Combination
  Future<bool> updateCombination(Combination Combination, String combinationId);

  // get Combination

  Future<Combination> getCombination(String id);
}
