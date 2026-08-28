import 'package:flutter_project_practice/api_app/domain/entities/userEntity.dart';

abstract class Userrepo {
  Future<List<Userentity>> fetchallusers();
  Future<Userentity> getsingleUserdata({required int id});
}