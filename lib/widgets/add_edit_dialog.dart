import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sqlflite_todo_app/widgets/field.dart';

class MyDialog extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final bool dataisempty = false;
 final void Function() fun;

  const MyDialog(
      {super.key,
      required this.descriptionController,
      required this.fun,
      required this.titleController});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      backgroundColor: Colors.blue[50],
      shadowColor: Colors.blueGrey[900],
      scrollable: true,
      elevation: 5,
      actions: [
        Container(
          padding: EdgeInsets.only(top: size.height * 0.01),
          width: size.width,
          height: size.height * 0.45,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              Myfield(
                titleText: "title",
                textEditingController: titleController,
                hintText: 'enter your todo title',
              ),
              SizedBox(
                height: size.height * 0.015,
              ),
              Myfield(
                titleText: "description",
                textEditingController: descriptionController,
                hintText: 'enter your description',
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: fun,
                    child: Container(
                      height: size.height * 0.05,
                      alignment: Alignment.center,
                      width: size.width * 0.3,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey[900],
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black,
                                offset: Offset(0, 0),
                                blurRadius: 7)
                          ],
                          borderRadius: BorderRadius.circular(15)),
                      child: AutoSizeText(
                        "submit",
                        style: TextStyle(
                            color: Colors.blue[50],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
