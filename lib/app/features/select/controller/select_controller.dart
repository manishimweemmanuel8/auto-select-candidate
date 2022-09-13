import 'package:auto_select_candidate/app/features/select/model/select.dart';
import 'package:auto_select_candidate/app/features/select/repository/repository.dart';

class SelectController {
  final Repository _repository;

  SelectController(this._repository);

  Future<List<Select>> fetchSelectList(String scholorshipId) async {
    return _repository.getSelectList(scholorshipId);
  }

  Future<bool> createSelectController(Select select) async {
    return _repository.createSelect(select);
  }

  Future<bool> updateSelectController(Select select, String selectId) async {
    return _repository.updateSelect(select, selectId);
  }

  Future<Select> getSelectController(String selectId) {
    return _repository.getSelect(selectId);
  }
}
