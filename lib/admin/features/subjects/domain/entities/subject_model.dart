class SubjectModel {
  final String id;
  final String subject;

  SubjectModel({required this.id, required this.subject});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "subject": subject,
    };
  }

  factory SubjectModel.fromJson(Map<String, dynamic> teacherJson,String id) {
    return SubjectModel(
      id: id,
      subject: teacherJson['subject'],
    );
  }
}
