import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_project_practice/interceptors_practice/app/data_entity.dart';

class Datasource {
  late final Connectivity connectivityinstance;
  late final StreamSubscription streamSubscription;
  late final Dio dioobj = Dio()
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestOptions, handler) {},
        onResponse: (options, handler) {},
        onError: (error, handler)async {
          if (error.type == DioExceptionType.connectionError) {
            print(
              "=============================================== +++++++ Connection Error log Printed ++++++++ ===================",
            );
            streamSubscription = connectivityinstance.onConnectivityChanged.listen((connectivitydata){
              if(connectivitydata.contains(ConnectivityResult.wifi) || connectivitydata.contains(ConnectivityResult.mobile)){
                streamSubscription.cancel();
                dioobj.fetch(error.requestOptions);
                handler.next(error);
              }
            });
          }
          handler.next(error);
        },
      ),
    );

  Future<List<DataModel>> getdata({required String id, required String name, required String email, required String creation_time}) async {
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
