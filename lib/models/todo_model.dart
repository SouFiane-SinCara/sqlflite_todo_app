class TodoModel {
  final String title;
  final String descreption;
  final int id;
  TodoModel({
    required this.title,
    required this.descreption,
    required this.id
  });
  factory TodoModel.fromJson(Map map) {
    return TodoModel(title: map['title'], descreption: map['description'],id:  map['id']);
  }
}
