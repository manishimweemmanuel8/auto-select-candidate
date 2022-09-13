import 'package:auto_select_candidate/app/features/account/model/user.dart';

abstract class Repository {
  //get users
  Future<List<User>> getUserList();

  //create new user
  Future<bool> createUser(User user);

  //Login

  Future<bool> loginRepository(User user);

  //Signout

  Future<void> signoutRepository();

  // Count user

  Future<bool> deleteUser(String id);
}
