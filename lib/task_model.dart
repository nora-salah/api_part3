class TaskModel {
  final int id;
  final String title;
  final String note;
  final String date;

  TaskModel(
      {required this.id,
      required this.title,
      required this.note,
      required this.date});

  //named constructor
  factory TaskModel.fromJson(Map<String, dynamic> jsonData) {
    return TaskModel(
      id: jsonData["id"],
      title: jsonData["title"],
      note: jsonData["note"],
      date: jsonData["date"],
    );
  }
}
