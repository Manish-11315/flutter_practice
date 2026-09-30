import 'package:injectable/injectable.dart';

import '../repository/userrepo.dart';

@lazySingleton
class Deleteuseraccountusecase {
  final UserRepo userRepoinstance;
  Deleteuseraccountusecase({required this.userRepoinstance});

  Future<void> call({required String email, required String password}) async{
    return await userRepoinstance.deleteUserAccount(email: email, password: password);
  }
}