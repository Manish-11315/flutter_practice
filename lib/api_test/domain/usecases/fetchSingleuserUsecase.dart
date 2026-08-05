import 'package:network_state/api_test/domain/responseEntity.dart';
import 'package:network_state/api_test/domain/responseRepoInter.dart';

class Fetchsingleuserusecase {
  ResponseRepoInter repoinstance;
  Fetchsingleuserusecase({required this.repoinstance});

  Future<Responseentity> call(int userId) async{
    return await repoinstance.getuserdata(userId);
  }
}