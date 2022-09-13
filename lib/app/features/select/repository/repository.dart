import 'package:auto_select_candidate/app/features/select/model/select.dart';

abstract class Repository {
  //get select
  Future<List<Select>> getSelectList(String scholorshipId);

  //create new select
  Future<bool> createSelect(Select select);

  //create new select
  Future<bool> updateSelect(Select select, String selectId);

  // get select

  Future<Select> getSelect(String selectId);
}
