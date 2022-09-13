import 'package:auto_select_candidate/app/features/account/model/user.dart';
import 'package:auto_select_candidate/app/features/scholorship/model/scholorship.dart';

abstract class Repository {
  //get scholorship
  Future<List<Scholorship>> getScholorshipList();

    //get 3 latest scholorship
  Future<List<Scholorship>> getRecentScholorshipList();

  //get last scholorship
  Future<List<Scholorship>> getLastScholorshipList();

  //create new Scholorship
  Future<bool> createScholorship(Scholorship scholorship);

  //create new Scholorship
  Future<bool> updateScholorship(Scholorship scholorship, String scholorshipId);

  // delete Scholorship

  Future<Scholorship> getScholorship(String scholorshipId);
}
