import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_practice/api_app/presentation/bloc/post_api_bloc/postbloc_states.dart';
import 'package:flutter_project_practice/list_app/bloc/listBloc.dart';
import 'package:flutter_project_practice/list_app/bloc/listBloc_states.dart';
import 'package:flutter_project_practice/list_app/data/datamodel.dart';
import 'package:flutter_project_practice/list_app/ui/widget/listWidget.dart';

import '../../bloc/listBloc_events.dart';
import '../widget/textviewWidget.dart';

class ListScreenui extends StatelessWidget {
  ListScreenui({super.key});

  final TextEditingController idcontroller = TextEditingController();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController salarycontroller = TextEditingController();
  List<Datamodel> listdatamodel = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View App"),
      ),
      body: BlocConsumer<Listbloc, ListblocStates>(
        builder: (context, state) {
          if (state is loadingpostState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is listshowState) {
            return ListView.builder(
              itemCount: state.datamodel.length,
              // itemCount: 10,
              itemBuilder: (context, index) {
                final listitem = state.datamodel[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Listwidget(datamodel: listitem, ontapdelete: () {
                    BlocProvider.of<Listbloc>(context).add(deletelistEvent(id: state.datamodel[index].id));
                  },),
                );
              },
            );
          }
          return Container(
            child: Center(child: Text("No List Items are there currently!!")),
          );
        },
        listener: (context, state) {},
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final listbloccontext = BlocProvider.of<Listbloc>(context);
          showModalBottomSheet(
            enableDrag: true,
            showDragHandle: true,
            context: context,

            builder: (context) {
              // listbloccontext.add(initiallistEvent());
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: Column(
                    children: [
                      Textviewwidget(
                        hinttext: "Enter your ID",
                        textEditingController: idcontroller,
                        textInputType: TextInputType.numberWithOptions(
                          decimal: false,
                          signed: false,
                        ),
                      ),
                      Textviewwidget(
                        hinttext: "Enter your Name",
                        textEditingController: namecontroller,
                        textInputType: TextInputType.text,
                      ),
                      Textviewwidget(
                        hinttext: "Enter your Email",
                        textEditingController: emailcontroller,
                        textInputType: TextInputType.emailAddress,
                      ),
                      Textviewwidget(
                        hinttext: "Enter your Salary",
                        textEditingController: salarycontroller,
                        textInputType: TextInputType.numberWithOptions(
                          decimal: true,
                          signed: false,
                        ),
                      ),
                      SizedBox(height: 50,),
                      GestureDetector(
                        onTap: (){
                          final name = namecontroller.text;
                          print("printing value of name : $name");
                          final int id = int.parse(idcontroller.text.toString());
                          print("printing value of id : $id");

                          final email = emailcontroller.text;
                          print("printing value of email : $email");

                          final double salary = double.parse(salarycontroller.text.toString());
                          print("printing value of salary : $salary");
                          // listdatamodel.add(Datamodel(id: id, name: name, email: email, salary: salary));
                          listbloccontext.add(addListEvent(datamodel: Datamodel(id: id, name: name, email: email, salary: salary)));
                          Navigator.pop(context);
                          idcontroller.clear();
                          emailcontroller.clear();
                          namecontroller.clear();
                          salarycontroller.clear();
                          },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.redAccent
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 30.0, right: 30.0),
                            child: Text("Add To List", style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
          // listdatamodel.add(Datamodel(id: 1, name: "Mohan", email: "mohan@test.com", salary: 43334.34));
          // BlocProvider.of<Listbloc>(context).add(addListEvent(datamodel: listdatamodel[0]));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
