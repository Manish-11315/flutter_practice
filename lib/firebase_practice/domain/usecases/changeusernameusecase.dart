import 'package:injectable/injectable.dart';

import '../repository/userrepo.dart';

@lazySingleton
class Changeusernameusecase {
  final UserRepo userRepoinstance;
  Changeusernameusecase({required this.userRepoinstance});

  Future<void> call({required String newusername}) async{
    return await userRepoinstance.changeUsername(newusername: newusername);
  }
}