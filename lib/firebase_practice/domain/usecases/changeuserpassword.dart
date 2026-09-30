import 'package:injectable/injectable.dart';

import '../repository/userrepo.dart';

@lazySingleton
class Changeuserpassword {
  final UserRepo userRepoinstance;
  Changeuserpassword({required this.userRepoinstance});

  Future<void> call({required String email, required String currentpassword, required String newpassword}) async{
    return userRepoinstance.changeUserPassword(email: email, currentpassword: currentpassword, newpassword: newpassword);
  }
}