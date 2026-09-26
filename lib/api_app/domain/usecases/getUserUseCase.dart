import 'package:flutter_project_practice/api_app/domain/entities/post_api_entities/post_api_order.dart';
import 'package:flutter_project_practice/api_app/domain/repo/userRepo.dart';
import 'package:injectable/injectable.dart';

@singleton
class Getuserusecase {
  final Userrepo userrepoobj;

  Getuserusecase({required this.userrepoobj});

  Future<PostApiOrderEntity> call({
    required String id,
    required String name,
    required String email,
    required String created_at,
  }) {
    return userrepoobj.postOrderData(
      id: id,
      name: name,
      email: email,
      created_at: created_at,
    );
  }
}
