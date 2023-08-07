import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlflite_todo_app/widgets/add_edit_dialog.dart';
import 'package:sqlflite_todo_app/widgets/card.dart';

import '../cubit/todo_cubit.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.blue[50],
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueGrey[500],
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return MyDialog(
                    descriptionController: descriptionController,
                    fun: () {
                      if (titleController.text.isNotEmpty &&
                          descriptionController.text.isNotEmpty) {
                        BlocProvider.of<TodoCubit>(context).addTodo(data: {
                          "title": titleController.text.toString(),
                          "description": descriptionController.text.toString()
                        });
                        titleController.clear();
                        descriptionController.clear();
                        Navigator.of(context).pop();
                      }
                    },
                    titleController: titleController);
              },
            );
          },
          child: Icon(
            Icons.add,
            color: Colors.blue[50],
            size: 30,
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.blue[50],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "My",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                    fontSize: 30),
              ),
              Text(
                " Todos",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                    color: Colors.red[400],
                    fontSize: 30),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<TodoCubit, TodoState>(
                builder: (context, state) {
                  if (state is LoadedTodosState) {
                    return SizedBox(
                      width: size.width,
                      child: ListView.builder(
                        itemCount: state.todos.length,
                        itemBuilder: (context, index) {
                          return MyCard(
                            todoModel: state.todos[index],
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ));
  }
}
