import 'package:eduplan/features/auth/domain/entities/teacher.dart';

abstract class TeacherRepo {
  Future<List<Teacher>?>fetchTeachers();
}