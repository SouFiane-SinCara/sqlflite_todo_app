import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlflite_todo_app/cubit/todo_cubit.dart';
import 'package:sqlflite_todo_app/models/todo_model.dart';
import 'package:sqlflite_todo_app/widgets/add_edit_dialog.dart';

class MyCard extends StatelessWidget {
 final TodoModel todoModel;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  MyCard({super.key, required this.todoModel});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        height: size.height * 0.1,
        decoration: BoxDecoration(
            color: Colors.blueGrey[900],
            boxShadow: const [
              BoxShadow(
                  color: Colors.black, offset: Offset(0, 0), blurRadius: 5)
            ],
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: double.infinity,
        child: InkWell(
          onTap: () {
            titleController.value = TextEditingValue(text: todoModel.title);
            descriptionController.value =
                TextEditingValue(text: todoModel.descreption);
            showDialog(
              context: context,
              builder: (context) {

                return MyDialog(
                    descriptionController: descriptionController,
                    fun: () {
                      BlocProvider.of<TodoCubit>(context)
                          .editTodo(id: todoModel.id, newData: {
                        
                        "title": titleController.text.toString(),
                        "description": descriptionController.text.toString()
                      });
                      Navigator.of(context).pop();
                    },
                    titleController: titleController);
              },
            );
          },
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: size.width * 0.02, top: size.height * 0.01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      todoModel.title,
                      style: TextStyle(
                        color: Colors.blue[100],
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.8,
                      height: size.height * 0.045,
                      child: AutoSizeText(
                        todoModel.descreption,
                        style: TextStyle(color: Colors.blue[50]),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width * 0.128,
                height: size.height * 0.1,
                alignment: Alignment.center,
                child: IconButton(
                  onPressed: () async {
                    await BlocProvider.of<TodoCubit>(context)
                        .delete(todoModel.id);
                  },
                  icon: const Icon(
                    Icons.delete_outline,
                    size: 35,
                  ),
                  color: Colors.red[200],
                ),
              )
            ],
          ),
        ));
  }
}
