import 'package:eduplan/admin/features/subjects/domain/entities/subject_model.dart';
import 'package:eduplan/features/auth/domain/entities/teacher.dart';

abstract class AuthRepo {
  Future<Teacher?> logIn(String username, String password);
  Future<Teacher?> teacherRegister(Teacher teacher);
  Future<void> logOut();
  Future<Teacher> getCurrentTeacher();
  Future<List<String>> getClasses();
  Future<List<SubjectModel>?> getSubjects();
}
