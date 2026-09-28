import '../repository/userrepo.dart';

class Changeuserpassword {
  final UserRepo userRepoinstance;
  Changeuserpassword({required this.userRepoinstance});

  Future<void> call({required String email, required String currentpassword, required String newpassword}) async{
    return userRepoinstance.changeUserPassword(email: email, currentpassword: currentpassword, newpassword: newpassword);
  }
}