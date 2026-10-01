import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_practice/api_app/domain/usecases/fetchallusers_usecase.dart';
import 'package:flutter_project_practice/api_app/domain/usecases/fetchsingleuser_usecase.dart';
import 'package:flutter_project_practice/api_app/domain/usecases/getUserUseCase.dart';
import 'package:flutter_project_practice/api_app/presentation/bloc/order_bloc/userBloc.dart';
import 'package:flutter_project_practice/api_app/presentation/bloc/order_bloc/userbloc_events.dart';
import 'package:flutter_project_practice/api_app/presentation/bloc/post_api_bloc/postBloc.dart';
import 'package:flutter_project_practice/connectivity_app/presentation/bloc/connectivity_bloc.dart';
import 'package:flutter_project_practice/firebase_options.dart';
import 'package:flutter_project_practice/firebase_practice/core/di/firedi.dart';
import 'package:flutter_project_practice/firebase_practice/domain/usecases/changeusernameusecase.dart';
import 'package:flutter_project_practice/firebase_practice/domain/usecases/changeuserpassword.dart';
import 'package:flutter_project_practice/firebase_practice/domain/usecases/deleteuseraccountusecase.dart';
import 'package:flutter_project_practice/firebase_practice/domain/usecases/loginusecase.dart';
import 'package:flutter_project_practice/firebase_practice/domain/usecases/logoutusecase.dart';
import 'package:flutter_project_practice/firebase_practice/domain/usecases/registerusecase.dart';
import 'package:flutter_project_practice/firebase_practice/presentation/bloc/firebloc.dart';
import 'package:flutter_project_practice/interceptors_practice/app/datasource.dart';
import 'package:flutter_project_practice/list_app/bloc/listBloc.dart';
import 'package:flutter_project_practice/list_app/data/datamodel.dart';

import 'api_app/core/di/di_init.dart';
import 'firebase_practice/presentation/screens/loginscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // setupApiDependency();
  setupfirebaseAppDependency();
  List<Datamodel> datamodelobj = [];
  final interceptorAppDatasource interceptorobj = interceptorAppDatasource();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MyApp(datamodel: datamodelobj, interceptorappdatasourceobj: interceptorobj),
  );
}

class MyApp extends StatelessWidget {
  final List<Datamodel> datamodel;
  final interceptorAppDatasource interceptorappdatasourceobj;

  const MyApp({
    super.key,
    required this.datamodel,
    required this.interceptorappdatasourceobj,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ConnectivityBloc()),
        BlocProvider(
          create: (context) => Userbloc(
            fetchsingleuserUsecase: getItInstance<FetchsingleuserUsecase>(),
            fetchallusersUsecase: getItInstance<FetchallusersUsecase>(),
          )..add(getallusersdata_event()),
        ),
        BlocProvider(
          create: (context) =>
              Postbloc(getuserusecaseinstance: getItInstance<Getuserusecase>()),
        ),
        BlocProvider(create: (context) => Listbloc(datamodel: datamodel)),
        BlocProvider(
          create: (context) => Firebloc(
            loginusecaseinstance: firediinstance<Loginusecase>(),
            registerusecaseinstance: firediinstance<Registerusecase>(),
            deleteuseraccountusecaseinstance:
                firediinstance<Deleteuseraccountusecase>(),
            changeusernameusecaseinstance:
                firediinstance<Changeusernameusecase>(),
            changeuserpasswordinstance: firediinstance<Changeuserpassword>(),
            logoutusecaseinstance: firediinstance<Logoutusecase>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home:
            /*ScreenUi(interceptorappdatasourceobj: interceptorAppDatasource(),)),Displayuserlistscreen()*/
            loginScreen(),
      ),
    );
  }
}
