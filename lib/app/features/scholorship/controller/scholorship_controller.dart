import 'package:auto_select_candidate/app/features/scholorship/model/scholorship.dart';
import 'package:auto_select_candidate/app/features/scholorship/repository/repository.dart';

class ScholorshipController {
  final Repository _repository;

  ScholorshipController(this._repository);

  //get
  Future<List<Scholorship>> fetchScholorShipList() async {
    return _repository.getScholorshipList();
  }

  //get recent
  Future<List<Scholorship>> fetchRecentScholorShipList() async {
    return _repository.getRecentScholorshipList();
  }

  //get last
  Future<List<Scholorship>> fetchLastScholorShipList() async {
    return _repository.getLastScholorshipList();
  }

  Future<bool> createScholoshipController(Scholorship scholorship) async {
    return _repository.createScholorship(scholorship);
  }

  Future<bool> updateScholorShipController(
      Scholorship scholorship, String scholorshipId) async {
    return _repository.updateScholorship(scholorship, scholorshipId);
  }

  Future<Scholorship> getScholorshipController(String scholorshipId) {
    return _repository.getScholorship(scholorshipId);
  }
}
