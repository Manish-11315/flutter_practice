import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_practice/api_app/presentation/bloc/userBloc.dart';
import 'package:flutter_project_practice/api_app/presentation/bloc/userbloc_states.dart';
import 'package:flutter_project_practice/connectivity_app/presentation/bloc/connectivity_bloc.dart';

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
            onTap: () async{
              await Navigator.push(context, MaterialPageRoute(builder: (context) => Displayuserlistscreen()));
            },
              child: Icon(Icons.search)
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: BlocConsumer<Userbloc, UserblocStates>(
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
                            itemBuilder: (BuildContext context, int index) {
                              final datauser = state.userentity[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: UsersdatalistWidget(
                                  userId: datauser.userId,
                                  id: datauser.id,
                                  title: datauser.title,
                                  iscompleted: datauser.completed,
                                ),
                              );
                            },
                          ),
                        ),
                        GestureDetector(
                            onTap: () async{
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => Displayuserlistscreen()));
                            },
                            child: Icon(Icons.search)
                        )
                      ],
                    );

                  }else if(state is errorUserBloc){
                    return Text("An error occurred : ${state.errormsg}");
                  }
                  return Container(child:
                    Text("New data is not coming"),);
                },
                listener: (context, state) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
