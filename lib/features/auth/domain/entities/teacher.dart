class Teacher {
  final String uid;
  final String name;
  final String userName;
  final String contact;
  final String password;
  final List<String> subjects;

  Teacher(
      {required this.uid,
      required this.name,
      required this.userName,
      required this.contact,
      required this.password,
      required this.subjects});
  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "name": name,
      "userName": userName,
      "contact": contact,
      "password": password,
      "subjects": subjects
    };
  }

  factory Teacher.fromJson(Map<String, dynamic> teacherJson) {
    return Teacher(
        uid: teacherJson['uid'],
        name: teacherJson['name'],
        userName: teacherJson['userName'],
        contact: teacherJson['contact'],
        password: teacherJson['password'],
        subjects: List<String>.from(teacherJson['subjects']));
  }
}
