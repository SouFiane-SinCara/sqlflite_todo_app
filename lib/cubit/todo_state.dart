// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_cubit.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {}

class GettingTodosState extends TodoState {}

class LoadedTodosState extends TodoState {
  final List<TodoModel> todos;
  const LoadedTodosState({
    required this.todos,
  });
}

class ErrorTodosState extends TodoState {
  final String error;
  const ErrorTodosState({
    required this.error,
  });
}
