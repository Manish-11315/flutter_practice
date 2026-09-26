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

import '../../data/datasources/diosource.dart' as _i428;
import '../../data/datasources/userDataSource.dart' as _i181;
import '../../data/repo_impl/userRepoImpl.dart' as _i303;
import '../../domain/repo/userRepo.dart' as _i342;
import '../../domain/usecases/fetchallusers_usecase.dart' as _i117;
import '../../domain/usecases/fetchsingleuser_usecase.dart' as _i119;
import '../../domain/usecases/getUserUseCase.dart' as _i372;
import '../../presentation/bloc/order_bloc/userBloc.dart' as _i1052;
import '../../presentation/bloc/post_api_bloc/postBloc.dart' as _i74;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i428.Diosource>(() => _i428.Diosource());
    gh.singleton<_i181.Userdatasource>(
      () => _i181.Userdatasource(
        dioinstance: gh<_i361.Dio>(),
        postinstancedio: gh<_i361.Dio>(),
      ),
    );
    gh.singleton<_i342.Userrepo>(
      () => _i303.Userrepoimpl(userdatasourceobj: gh<_i181.Userdatasource>()),
    );
    gh.singleton<_i119.FetchsingleuserUsecase>(
      () => _i119.FetchsingleuserUsecase(repoobj: gh<_i342.Userrepo>()),
    );
    gh.singleton<_i117.FetchallusersUsecase>(
      () => _i117.FetchallusersUsecase(userrepoobj: gh<_i342.Userrepo>()),
    );
    gh.singleton<_i372.Getuserusecase>(
      () => _i372.Getuserusecase(userrepoobj: gh<_i342.Userrepo>()),
    );
    gh.factory<_i1052.Userbloc>(
      () => _i1052.Userbloc(
        fetchsingleuserUsecase: gh<_i119.FetchsingleuserUsecase>(),
        fetchallusersUsecase: gh<_i117.FetchallusersUsecase>(),
      ),
    );
    gh.factory<_i74.Postbloc>(
      () => _i74.Postbloc(getuserusecaseinstance: gh<_i372.Getuserusecase>()),
    );
    return this;
  }
}
