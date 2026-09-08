import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_practice/api_app/presentation/bloc/post_api_bloc/postBloc.dart';
import 'package:flutter_project_practice/api_app/presentation/bloc/post_api_bloc/postbloc_events.dart';
import 'package:flutter_project_practice/api_app/presentation/bloc/post_api_bloc/postbloc_states.dart';

import '../widget/post_api_data_fields.dart';

class Postapiscreenui extends StatelessWidget {
  final TextEditingController idcontroller = TextEditingController();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController creationcontroller = TextEditingController();

  Postapiscreenui({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Post Api App"),),
      body: SingleChildScrollView(
        child: BlocConsumer<Postbloc, PostblocStates>(
          builder: (context, state){
            if(state is loadingpostState){
              return Container(child: Center(child: CircularProgressIndicator(),));
            }else if(state is errorpostState){
              return Center(child: Text(state.errormsg),);
            }else if(state is successpostState){
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.postApiOrderEntity.email),
                    Text(state.postApiOrderEntity.id),
                    Text(state.postApiOrderEntity.name),
                    Text(state.postApiOrderEntity.creation_time),
                  ],
                ),
              );
            }
            return Column(
              children: [
                textWidget(hinttext: "id", textEditingController: idcontroller),
                textWidget(hinttext: "name", textEditingController: namecontroller),
                textWidget(
                  hinttext: "email",
                  textEditingController: emailcontroller,
                ),
                textWidget(
                  hinttext: "creation time",
                  textEditingController: creationcontroller,
                ),
                MaterialButton(
                  color: Colors.redAccent,
                  child: Text("Send Data"),

                  onPressed: (){
                    _onpressed(context);
                  },
                ),
              ],
            );
          },
          listener: (context, state){

          },
        ),
      ),
    );
  }

  void _onpressed(BuildContext context){
    final String name = namecontroller.value.toString();
    final String email = emailcontroller.value.toString();
    final String id = idcontroller.value.toString();
    final String creationtime = creationcontroller.value.toString();
    if(name.isNotEmpty && email.isNotEmpty && id.isNotEmpty && creationtime.isNotEmpty){
      BlocProvider.of<Postbloc>(context).add(sendreqestEvent(id: id, name: name, email: email, creation_date: creationtime));
    }
  }
}
