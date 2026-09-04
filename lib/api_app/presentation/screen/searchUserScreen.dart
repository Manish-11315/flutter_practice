import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_practice/api_app/presentation/bloc/userBloc.dart';
import 'package:flutter_project_practice/api_app/presentation/bloc/userbloc_states.dart';
import 'package:flutter_project_practice/api_app/presentation/widget/orderdatalist_widget.dart';

import '../bloc/userbloc_events.dart';
import '../widget/usersdatalist_widget.dart';

class Searchuserscreen extends StatelessWidget {
  final TextEditingController idcontroller = TextEditingController();

  Searchuserscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("This is new screen"),

            BlocConsumer<Userbloc, UserblocStates>(
              builder: (context, state) {
                if (state is loadingUserBloc) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is errorUserBloc) {
                  return Center(child: Text(state.errormsg));
                } else if (state is singleUserdataUserBloc) {
                  final userdata = state.userentity;
                  return Center(
                    child: OrderdatalistWidget(orderinfoEntity: userdata),
                  );
                }
                return Column(
                  children: [
                    TextFormField(
                      controller: idcontroller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hint: Text("Enter ID Number to search"),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        _onButtonTap(context);
                      }
                      ,child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.redAccent
                        ),
                        child: Text("Search"),
                      ),
                    )
                  ],
                );
              },
              listener: (context, state) {},
            ),
          ],
        ),
      ),
    );
  }

  void _onButtonTap(BuildContext context) {
    final idreq = int.parse(idcontroller.text);
    BlocProvider.of<Userbloc>(context).add(loadsingleuser_event(id: idreq));
  }
}
