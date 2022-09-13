import 'package:auto_select_candidate/app/features/account/model/user.dart';
import 'package:auto_select_candidate/app/features/account/repository/repository.dart';

class UserController {
  final Repository _repository;

  UserController(this._repository);

  //get

  Future<List<User>> fetchUserList() async {
    return _repository.getUserList();
  }


  // Login

  Future<bool> loginController(User user) async {
    return _repository.loginRepository(user);
  }

  //signout

  Future<void> signoutController() async {
    return _repository.signoutRepository();
  }

 

  Future<bool> createUserController(User user) async {
    return _repository.createUser(user);
  }

  Future<bool> deleteUserController(String id){
    return _repository.deleteUser(id);
  }
}
