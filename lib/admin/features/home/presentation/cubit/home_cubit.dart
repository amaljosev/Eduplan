import 'dart:developer';

import 'package:eduplan/admin/features/home/domain/class_repo/class_repo.dart';
import 'package:eduplan/admin/features/home/domain/class_repo/teacher_repo.dart';
import 'package:eduplan/admin/features/home/domain/entities/class_model.dart';
import 'package:eduplan/features/auth/domain/entities/teacher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.classesRepo, required this.teacherRepo})
      : super(HomeInitial());
  final ClassRepo classesRepo;
  final TeacherRepo teacherRepo;
  Future<void> fetchClasses() async {
    try {
      emit(ClassesLoadingState());
      final classesList = await classesRepo.fetchClasses();
      emit(ClassesLoadedState(classes: classesList ?? []));
    } catch (e) {
      log(e.toString());
      emit(ClassesErrorState());
    }
  }

  Future<void> addSubject(ClassModel classData) async {
    try {
      emit(AddClassesLoadingState());
      final String result = await classesRepo.createNewClass(classData);
      if (result == 'Success') {
        emit(AddClassesLoadedState());
      } else {
        emit(AddClassesFailedState(
            msg:
                'Class with name "${classData.className}" and division "${classData.division}" already exists.'));
      }
    } catch (e) {
      log(e.toString());
      emit(AddClassesErrorState());
    }
  }

  Future<void> deleteSubject(String id) async {
    try {
      emit(DeleteClassesLoadingState());
      await classesRepo.deleteClass(id);
      emit(DeleteClassesSuccessState());
    } catch (e) {
      log(e.toString());
      emit(DeleteClassesFailedState());
    }
  }

  Future<void> fetchTeachers() async {
    try {
      emit(TeachersLoadingState());
      final teachersList = await teacherRepo.fetchTeachers();
      emit(TeachersLoadedState(teacahers: teachersList ?? []));
    } catch (e) {
      log(e.toString());
      emit(TeachersErrorState());
    }
  }
}
