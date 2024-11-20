import 'package:eduplan/admin/features/subjects/domain/entities/subject_model.dart';

abstract class SubjectsRepo {
  Future<void> addSubject(String subject);
  Future<List<SubjectModel>?> fetchSubjects();
  Future<void> deleteSubject(String id);
}
