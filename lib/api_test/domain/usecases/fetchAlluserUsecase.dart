import 'package:network_state/api_test/domain/responseEntity.dart';

import '../responseRepoInter.dart';

class Fetchalluserusecase {
  ResponseRepoInter respoinstance;
  Fetchalluserusecase({required this.respoinstance});

  Future<List<Responseentity>> call()async{
    return await respoinstance.getallusersdata();
  }
}