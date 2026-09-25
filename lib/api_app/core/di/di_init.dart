import 'package:flutter_project_practice/api_app/data/datasources/diosource.dart';
import 'package:flutter_project_practice/api_app/data/datasources/userDataSource.dart';
import 'package:flutter_project_practice/api_app/data/repo_impl/userRepoImpl.dart';
import 'package:flutter_project_practice/api_app/domain/repo/userRepo.dart';
import 'package:flutter_project_practice/api_app/domain/usecases/fetchallusers_usecase.dart';
import 'package:flutter_project_practice/api_app/domain/usecases/fetchsingleuser_usecase.dart';
import 'package:flutter_project_practice/api_app/domain/usecases/getUserUseCase.dart';
import 'package:flutter_project_practice/api_app/presentation/bloc/order_bloc/userBloc.dart';
import 'package:get_it/get_it.dart';

var getItInstance = GetIt.instance;

void setupApiDependency() {
  getItInstance.registerSingleton<Userdatasource>(
    Userdatasource(
      dioinstance: Diosource.create(
        url: "https://fake-store-api.mock.beeceptor.com/api/",
      ),
      postinstancedio: Diosource.create(
        url: "https://quickmock.dev/m/tBMReZjZXb2X/",
      ),
    ),
  );
  getItInstance.registerSingleton<Userrepo>(
    Userrepoimpl(userdatasourceobj: getItInstance<Userdatasource>()),
  );
  getItInstance.registerSingleton<FetchallusersUsecase>(
    FetchallusersUsecase(userrepoobj: getItInstance<Userrepo>()),
  );
  getItInstance.registerSingleton<FetchsingleuserUsecase>(
    FetchsingleuserUsecase(repoobj: getItInstance<Userrepo>()),
  );
  getItInstance.registerSingleton<Getuserusecase>(
    Getuserusecase(userrepoobj: getItInstance<Userrepo>()),
  );
  getItInstance.registerFactory<Userbloc>(
    () => Userbloc(
      fetchsingleuserUsecase: getItInstance<FetchsingleuserUsecase>(),
      fetchallusersUsecase: getItInstance<FetchallusersUsecase>(),
    ),
  );
}
