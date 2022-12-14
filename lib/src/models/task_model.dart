class TaskModel{

  String title;
  String description;

  String? id;

  TaskModel({required this.title,required this.description, this.id});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      title: json["title"],
      description: json["description"],
      id: json["id"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": this.title,
      "description": this.description,
      "id": this.id
    };
  }
//

}