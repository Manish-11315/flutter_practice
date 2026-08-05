import 'package:network_state/api_test/domain/responseEntity.dart';

abstract class ResponseRepoInter {
  Future<List<Responseentity>> getallusersdata();
  Future<Responseentity> getuserdata(int userId);
}