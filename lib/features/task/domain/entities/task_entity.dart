
class TaskEntity {

  final String title;
  final String description;
  final bool isDone;

   const TaskEntity({
      required this.title,
      required this.description,
      required this.isDone,
    });


      Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'isDone': isDone,
      };

  factory TaskEntity.fromJson(Map<String, dynamic> json) => TaskEntity(
        title: json['title'],
        description: json['description'],
        isDone: json['isDone'],
      );

  TaskEntity copyWith({
    String? title,
    String? description,
    bool? isDone,
  }) {
    return TaskEntity(
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }

}