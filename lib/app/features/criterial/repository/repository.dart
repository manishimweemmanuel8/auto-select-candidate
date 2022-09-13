import 'package:auto_select_candidate/app/features/criterial/model/criterial.dart';

abstract class Repository {
  //get criterial
  Future<List<Criterial>> getCriterialList(String scholorshipId);

    //get 2 latest criterial
  Future<List<Criterial>> getTwoLatestCriterialList();

  //create new criterial
  Future<bool> createCriterial(Criterial criterial);

  //create new criterial
  Future<bool> updateCriterial(Criterial criterial, String criterialId);

  // delete criterial

  Future<Criterial> getCriterial(String criterialId);
}
