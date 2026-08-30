import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_practice/api_app/presentation/bloc/userbloc_states.dart';

import '../widget/usersdatalist_widget.dart';
class Displayuserlistscreen extends StatelessWidget {
  const Displayuserlistscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocConsumer(
                builder: (context, state){
                  if(state is loadingUserBloc){
                    return Center(child: CircularProgressIndicator());
                  }else if(state is listAllUserdataUserBloc){
                    final datacount = state.userentity.length;
                    ListView.builder(
                        itemCount: datacount,
                      itemBuilder: (BuildContext context, int index) {
                          final datauser = index
                        return UsersdatalistWidget(userId: index, id: index, title: index, iscompleted: index,);
                      },

                    );
                  }
                  return Container();
                },
                listener: (context, state){

                }
            )
          ],
        ),
      ),
    );
  }
}
