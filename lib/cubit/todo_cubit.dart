import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlflite_todo_app/db/db_sql.dart';
import 'package:sqlflite_todo_app/models/todo_model.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());
  Future<void> getTodos() async {
    emit(GettingTodosState());
    Database? db = await SqlHelper().getDb;
    List<Map> dataMap = await db!.query("TODOS");
    List<TodoModel> todos = dataMap.map((e) {
      return TodoModel.fromJson(e);
    }).toList();
    emit(LoadedTodosState(todos: todos));
  }

  Future<void> delete(int id) async {
    int response = await SqlHelper().deleteElement(id: id);
    if (response == 0) {
      emit(const ErrorTodosState(error: "try again !"));
    } else {
      getTodos();
    }
  }

  Future<void> addTodo({required Map<String, dynamic> data}) async {
    int response = await SqlHelper().add(data: data);
    if (response == 0) {
      emit(const ErrorTodosState(error: "try again !"));
    } else {
      getTodos();
    }
  }

  Future<void> editTodo(
      {required int id, required Map<String, dynamic> newData}) async {
    int response = await SqlHelper().editElement(id: id, newData: newData);
    if (response == 0) {
      emit(const ErrorTodosState(error: "try again !"));
    } else {
      getTodos();
    }
  }
}
