import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_practice/connectivity_app/presentation/bloc/connectivity_bloc.dart';
import 'package:flutter_project_practice/connectivity_app/presentation/bloc/connectivity_states.dart';

class ConnectivityHomescreen extends StatelessWidget {
  const ConnectivityHomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child: BlocConsumer<ConnectivityBloc, ConnectivityStates>(
                builder: (context, state) {
                  if (state is connectedState) {
                    return Icon(Icons.wifi, color: Colors.black,);
                  } else if (state is notConnectedState) {
                    return Icon(Icons.wifi_off, color: Colors.black,);
                  }else if(state is initialConnectivityState){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Center(
                    child: Text("Checking", style:  TextStyle(fontSize: 20),),
                  );
                },
                listener: (context, state) {
                  if (state is connectedState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Connected to internet successfully"),
                        backgroundColor: Colors.lightGreen,
                      ),
                    );
                  } else if (state is notConnectedState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Not connected to internet"),
                        backgroundColor: Colors.redAccent,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
