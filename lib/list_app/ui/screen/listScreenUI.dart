import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_practice/api_app/presentation/bloc/post_api_bloc/postbloc_states.dart';
import 'package:flutter_project_practice/list_app/bloc/listBloc.dart';
import 'package:flutter_project_practice/list_app/bloc/listBloc_states.dart';
import 'package:flutter_project_practice/list_app/data/datamodel.dart';
import 'package:flutter_project_practice/list_app/ui/widget/listWidget.dart';
class ListScreenui extends StatelessWidget {
  ListScreenui({super.key});
  List<Datamodel> listdatamodel = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: BlocConsumer<Listbloc, ListblocStates>(
            builder: (context, state){
              if(state is loadingpostState){
                return Center(child: CircularProgressIndicator());
              }else if(state is listshowState){
                return Expanded(
                  child: ListView.builder(
                    itemCount: listdatamodel.length,
                      itemBuilder: (context, index){
                      final listitem = listdatamodel[index];
                        return Listwidget(datamodel: listitem);
                      }
                  ),
                );
              }
              return Container(child: Center(child: Text("No List Items are there currently!!"),));
            },
            listener: (context, state){

            }),
      ),
    );
  }
}
