import 'dart:convert';
import 'package:auto_select_candidate/app/features/candidate/model/candidate.dart';
import 'package:auto_select_candidate/app/features/candidate/repository/repository.dart';
import 'package:auto_select_candidate/constants.dart';
import 'package:http/http.dart' as http;

class CandidateRepository implements Repository {
  @override
  Future<List<Candidate>> getCandidateList() async {
    List<Candidate> candidateList = [];
    var url = Uri.parse('$apiUrl/candidate');
    var response = await http.get(url);
    var body = json.decode(response.body);

    //perse

    for (var i = 0; i < body.length; i++) {
      candidateList.add(Candidate.fromJson(body[i]));
    }
    return candidateList;
  }

  @override
  Future<Candidate> getCandidate(String candidateId) async {
    var url = Uri.parse('$apiUrl/candidate/$candidateId');
    print(url);

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return Candidate.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Candidate');
    }
  }
}
