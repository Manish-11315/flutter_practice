// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../api_app/core/api/apimodule.dart' as _i454;
import '../api_app/data/datasources/userDataSource.dart' as _i250;
import '../api_app/data/repo_impl/userRepoImpl.dart' as _i729;
import '../api_app/domain/repo/userRepo.dart' as _i898;
import '../api_app/domain/usecases/fetchallusers_usecase.dart' as _i1041;
import '../api_app/domain/usecases/fetchsingleuser_usecase.dart' as _i740;
import '../api_app/domain/usecases/getUserUseCase.dart' as _i104;
import '../api_app/presentation/bloc/order_bloc/userBloc.dart' as _i1007;
import '../api_app/presentation/bloc/post_api_bloc/postBloc.dart' as _i489;
import 'classes_demo.dart' as _i866;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt DemoDi({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final apimodule = _$Apimodule();
    gh.lazySingleton<_i361.Dio>(
      () => apimodule.postdio,
      instanceName: 'postdioinstance',
    );
    gh.lazySingleton<_i866.demo1>(() => _i866.demo2());
    gh.lazySingleton<_i361.Dio>(
      () => apimodule.getdio,
      instanceName: 'getdioinstance',
    );
    gh.lazySingleton<_i866.demo3>(
      () => _i866.demo3(demo2instance: gh<_i866.demo2>()),
    );
    gh.lazySingleton<_i250.Userdatasource>(
      () => _i250.Userdatasource(
        dioinstance: gh<_i361.Dio>(instanceName: 'getdioinstance'),
        postinstancedio: gh<_i361.Dio>(instanceName: 'postdioinstance'),
      ),
    );
    gh.singleton<_i898.Userrepo>(
      () => _i729.Userrepoimpl(userdatasourceobj: gh<_i250.Userdatasource>()),
    );
    gh.lazySingleton<_i866.demo4>(
      () => _i866.demo4(demo3instance: gh<_i866.demo3>()),
    );
    gh.lazySingleton<_i866.demo5>(
      () => _i866.demo5(demo3instance: gh<_i866.demo3>()),
    );
    gh.singleton<_i740.FetchsingleuserUsecase>(
      () => _i740.FetchsingleuserUsecase(repoobj: gh<_i898.Userrepo>()),
    );
    gh.singleton<_i1041.FetchallusersUsecase>(
      () => _i1041.FetchallusersUsecase(userrepoobj: gh<_i898.Userrepo>()),
    );
    gh.singleton<_i104.Getuserusecase>(
      () => _i104.Getuserusecase(userrepoobj: gh<_i898.Userrepo>()),
    );
    gh.factory<_i1007.Userbloc>(
      () => _i1007.Userbloc(
        fetchsingleuserUsecase: gh<_i740.FetchsingleuserUsecase>(),
        fetchallusersUsecase: gh<_i1041.FetchallusersUsecase>(),
      ),
    );
    gh.factory<_i489.Postbloc>(
      () => _i489.Postbloc(getuserusecaseinstance: gh<_i104.Getuserusecase>()),
    );
    return this;
  }
}

class _$Apimodule extends _i454.Apimodule {}
