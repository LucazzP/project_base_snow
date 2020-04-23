import 'dart:convert';

class TodoModel {
    final int userId;
    final int id;
    final String title;
    final bool completed;

    TodoModel({
        this.userId,
        this.id,
        this.title,
        this.completed,
    });

    TodoModel copyWith({
        int userId,
        int id,
        String title,
        bool completed,
    }) => 
        TodoModel(
            userId: userId ?? this.userId,
            id: id ?? this.id,
            title: title ?? this.title,
            completed: completed ?? this.completed,
        );

    factory TodoModel.fromJson(String str) => TodoModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TodoModel.fromMap(Map<String, dynamic> json) => TodoModel(
        userId: json["userId"] == null ? null : json["userId"],
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        completed: json["completed"] == null ? null : json["completed"],
    );

    Map<String, dynamic> toMap() => {
        "userId": userId == null ? null : userId,
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "completed": completed == null ? null : completed,
    };

    @override
    bool operator ==(Object other) =>
        identical(this, other) ||
            other is TodoModel &&
                runtimeType == other.runtimeType &&
                userId == other.userId &&
                id == other.id &&
                title == other.title &&
                completed == other.completed;

    @override
    int get hashCode =>
        userId.hashCode ^
        id.hashCode ^
        title.hashCode ^
        completed.hashCode;
}
