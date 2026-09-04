import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_practice/api_app/presentation/bloc/userBloc.dart';
import 'package:flutter_project_practice/api_app/presentation/bloc/userbloc_events.dart';
import 'package:flutter_project_practice/api_app/presentation/bloc/userbloc_states.dart';
import 'package:flutter_project_practice/api_app/presentation/screen/searchUserScreen.dart';
import 'package:flutter_project_practice/connectivity_app/presentation/bloc/connectivity_bloc.dart';
import 'package:flutter_project_practice/connectivity_app/presentation/bloc/connectivity_states.dart';

import '../widget/usersdatalist_widget.dart';

class Displayuserlistscreen extends StatelessWidget {
  const Displayuserlistscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Data Fetch Application"),
        actions: [
          GestureDetector(
            onTap: () async {
              final userbloc = context.read<Userbloc>();
              userbloc.add(initialuserdata_event());
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                    value: userbloc,
                    child: Searchuserscreen(),
                  ),
                ),
              );
              userbloc.add(getdata_list_event());
            },
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: BlocConsumer<ConnectivityBloc, ConnectivityStates>(
                builder: (context, state) {
                  if (state is connectedState) {
                    return BlocConsumer<Userbloc, UserblocStates>(
                      builder: (context, state) {
                        if (state is loadingUserBloc) {
                          return Center(child: CircularProgressIndicator());
                        } else if (state is listAllUserdataUserBloc) {
                          final datacount = state.userentity.length;
                          return Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  itemCount: datacount,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                        final datauser =
                                            state.userentity[index];
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: UsersdatalistWidget(
                                           products: datauser,
                                          ),
                                        );
                                      },
                                ),
                              ),
                            ],
                          );
                        } else if (state is errorUserBloc) {
                          return Text("An error occurred : ${state.errormsg}");
                        }
                        return Container(child: Text("New data is not coming"));
                      },
                      listener: (context, state) {},
                    );
                  } else if (state is notConnectedState) {
                    return Center(child: Icon(Icons.wifi_off));
                  }
                  return Center(child: Text("Loading network status"));
                },
                listener: (context, state) {
                  if (state is connectedState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Connected"),
                        backgroundColor: Colors.greenAccent,
                      ),
                    );
                  } else if (state is notConnectedState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Not Connected"),
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
