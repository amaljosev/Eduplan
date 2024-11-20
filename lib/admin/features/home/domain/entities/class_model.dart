class ClassModel {
  final String id;
  final String className;
  final String division;
  final String classTeacher;
  final List<String> subjects;
  final List<String> teachers;
  final Map<String, List<String>> students;

  ClassModel(
      {required this.id,
      required this.className,
      required this.division,
      required this.classTeacher,
      required this.subjects,
      required this.teachers,
      required this.students});
  Map<String, dynamic> toJson() {
    return {
      "class_name": className,
      "division": division,
      "class_teacher": classTeacher,
      "subjects": subjects,
      "teachers": teachers,
      "students": students
    };
  }

  factory ClassModel.fromJson(Map<String, dynamic> json, String id) {
    return ClassModel(
      id: id,
      className: json['class_name'] as String,
      division: json['division'] as String,
      classTeacher: json['class_teacher'] as String,
      subjects: List<String>.from(json['subjects'] ?? []),
      teachers: List<String>.from(json['teachers'] ?? []),
      students: (json['students'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, List<String>.from(value as List)),
      ),
    );
  }
}
