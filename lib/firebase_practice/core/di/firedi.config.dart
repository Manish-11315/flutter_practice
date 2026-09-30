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

import '../../../api_app/core/api/apimodule.dart' as _i799;
import '../../../api_app/data/datasources/userDataSource.dart' as _i63;
import '../../../api_app/data/repo_impl/userRepoImpl.dart' as _i653;
import '../../../api_app/domain/repo/userRepo.dart' as _i589;
import '../../../api_app/domain/usecases/fetchallusers_usecase.dart' as _i455;
import '../../../api_app/domain/usecases/fetchsingleuser_usecase.dart' as _i341;
import '../../../api_app/domain/usecases/getUserUseCase.dart' as _i842;
import '../../../api_app/presentation/bloc/order_bloc/userBloc.dart' as _i211;
import '../../../api_app/presentation/bloc/post_api_bloc/postBloc.dart'
    as _i513;
import '../../data/datasource/firebaseappdatasource.dart' as _i381;
import '../../data/repoimpl/userrepoimpl.dart' as _i1043;
import '../../domain/repository/userrepo.dart' as _i597;
import '../../domain/usecases/changeusernameusecase.dart' as _i616;
import '../../domain/usecases/changeuserpassword.dart' as _i74;
import '../../domain/usecases/deleteuseraccountusecase.dart' as _i668;
import '../../domain/usecases/loginusecase.dart' as _i454;
import '../../domain/usecases/logoutusecase.dart' as _i964;
import '../../domain/usecases/registerusecase.dart' as _i502;
import '../../presentation/bloc/firebloc.dart' as _i724;
import '../services/auth_service.dart' as _i745;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt firebaseDiInit({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final apimodule = _$Apimodule();
    gh.lazySingleton<_i745.AuthService>(() => _i745.AuthService());
    gh.lazySingleton<_i361.Dio>(
      () => apimodule.postdio,
      instanceName: 'postdioinstance',
    );
    gh.lazySingleton<_i361.Dio>(
      () => apimodule.getdio,
      instanceName: 'getdioinstance',
    );
    gh.lazySingleton<_i381.firebaseappDatasource>(
      () => _i381.firebaseappDatasource(
        authServiceinstance: gh<_i745.AuthService>(),
      ),
    );
    gh.lazySingleton<_i63.Userdatasource>(
      () => _i63.Userdatasource(
        dioinstance: gh<_i361.Dio>(instanceName: 'getdioinstance'),
        postinstancedio: gh<_i361.Dio>(instanceName: 'postdioinstance'),
      ),
    );
    gh.singleton<_i589.Userrepo>(
      () => _i653.Userrepoimpl(userdatasourceobj: gh<_i63.Userdatasource>()),
    );
    gh.lazySingleton<_i597.UserRepo>(
      () => _i1043.Userrepoimpl(
        firebasedatasourceinstance: gh<_i381.firebaseappDatasource>(),
      ),
    );
    gh.singleton<_i341.FetchsingleuserUsecase>(
      () => _i341.FetchsingleuserUsecase(repoobj: gh<_i589.Userrepo>()),
    );
    gh.singleton<_i455.FetchallusersUsecase>(
      () => _i455.FetchallusersUsecase(userrepoobj: gh<_i589.Userrepo>()),
    );
    gh.singleton<_i842.Getuserusecase>(
      () => _i842.Getuserusecase(userrepoobj: gh<_i589.Userrepo>()),
    );
    gh.lazySingleton<_i616.Changeusernameusecase>(
      () => _i616.Changeusernameusecase(userRepoinstance: gh<_i597.UserRepo>()),
    );
    gh.lazySingleton<_i74.Changeuserpassword>(
      () => _i74.Changeuserpassword(userRepoinstance: gh<_i597.UserRepo>()),
    );
    gh.lazySingleton<_i668.Deleteuseraccountusecase>(
      () => _i668.Deleteuseraccountusecase(
        userRepoinstance: gh<_i597.UserRepo>(),
      ),
    );
    gh.lazySingleton<_i454.Loginusecase>(
      () => _i454.Loginusecase(userRepoinstance: gh<_i597.UserRepo>()),
    );
    gh.lazySingleton<_i964.Logoutusecase>(
      () => _i964.Logoutusecase(userRepoinstance: gh<_i597.UserRepo>()),
    );
    gh.lazySingleton<_i502.Registerusecase>(
      () => _i502.Registerusecase(userRepoinstance: gh<_i597.UserRepo>()),
    );
    gh.factory<_i211.Userbloc>(
      () => _i211.Userbloc(
        fetchsingleuserUsecase: gh<_i341.FetchsingleuserUsecase>(),
        fetchallusersUsecase: gh<_i455.FetchallusersUsecase>(),
      ),
    );
    gh.factory<_i513.Postbloc>(
      () => _i513.Postbloc(getuserusecaseinstance: gh<_i842.Getuserusecase>()),
    );
    gh.factory<_i724.Firebloc>(
      () => _i724.Firebloc(
        loginusecaseinstance: gh<_i454.Loginusecase>(),
        registerusecaseinstance: gh<_i502.Registerusecase>(),
        deleteuseraccountusecaseinstance: gh<_i668.Deleteuseraccountusecase>(),
        changeusernameusecaseinstance: gh<_i616.Changeusernameusecase>(),
        changeuserpasswordinstance: gh<_i74.Changeuserpassword>(),
        logoutusecaseinstance: gh<_i964.Logoutusecase>(),
      ),
    );
    return this;
  }
}

class _$Apimodule extends _i799.Apimodule {}
