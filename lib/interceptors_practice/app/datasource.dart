import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_project_practice/interceptors_practice/app/data_entity.dart';

class interceptorAppDatasource {
  final Connectivity connectivityinstance = Connectivity();
  StreamSubscription? streamSubscription;
  late final Dio dioobj = Dio()
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestOptions, handler) {
          print("=============================================== +++++++ On request log Printed ++++++++ ===================");
          handler.next(requestOptions);
        },
        onResponse: (options, handler) {
          print("=============================================== +++++++ On Response log Printed ++++++++ ===================");
          handler.next(options);
        },
        onError: (error, handler)async {
          if (error.type == DioExceptionType.connectionError) {
            print(
              "=============================================== +++++++ Connection Error log Printed ++++++++ ===================",
            );
            streamSubscription = connectivityinstance.onConnectivityChanged.listen((onData){
              if(onData.contains(ConnectivityResult.wifi) || onData.contains(ConnectivityResult.mobile)){
                streamSubscription?.cancel();
                dioobj.fetch(error.requestOptions).then((dioerror){
                  handler.resolve(dioerror);
                });
              }
            });
          }else{
            handler.next(error);
          }
        },
      ),
    );

  Future<List<DataModel>> getdata() async {
    final returndata = await dioobj.post(
      "https://quickmock.dev/m/rBDBHTB7gYYN/users/post",
      data: DataModel(
        id: "111101",
        name: "Erwin",
        email: "rj@email.com",
        creationTime: "17 - SEP - 2026",
      ).toJson(),
    );
    final datalist = returndata.data as List;
    return datalist.map((data) => DataModel.fromJson(data)).toList();
  }
}
