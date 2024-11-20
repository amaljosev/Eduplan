import 'package:eduplan/admin/features/home/domain/entities/class_model.dart';

abstract class ClassRepo {
  Future<String> createNewClass(ClassModel classData);
  Future<List<ClassModel>?> fetchClasses();
  Future<void> deleteClass(String id);
}
