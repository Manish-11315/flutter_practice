import '../repository/userrepo.dart';

class Changeusernameusecase {
  final UserRepo userRepoinstance;
  Changeusernameusecase({required this.userRepoinstance});

  Future<void> call({required String newusername}) async{
    return await userRepoinstance.changeUsername(newusername: newusername);
  }
}