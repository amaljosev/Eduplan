import 'dart:developer';

import 'package:eduplan/admin/features/subjects/domain/entities/subject_model.dart';
import 'package:eduplan/admin/features/subjects/domain/subjects_repo/subjects_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'subjects_state.dart';

class SubjectsCubit extends Cubit<SubjectsState> {
  SubjectsCubit({required this.subjectRepo}) : super(SubjectsInitial());
  final SubjectsRepo subjectRepo;
  Future<void> fetchSubjects() async {
    try {
      emit(SubjectsLoading());
      final subjectsList = await subjectRepo.fetchSubjects();
      if (subjectsList != null) {
        emit(SubjectsLoaded(subjects: subjectsList));
      } else {
        emit(Subjectsfailed());
      }
    } catch (e) {
      log(e.toString());
      emit(Subjectsfailed());
    }
  }

  Future<void> addSubject(String subject) async {
    try {
      emit(SubjectsLoading());
      await subjectRepo.addSubject(subject);
      emit(AddSubjectSuccess());
    } catch (e) {
      log(e.toString());
      emit(AddSubjectFaild());
    }
  }

  Future<void> deleteSubject(String id) async {
    try {
      emit(SubjectsLoading());
      await subjectRepo.deleteSubject(id);
      emit(AddSubjectSuccess());
    } catch (e) {
      log(e.toString());
      emit(AddSubjectFaild());
    }
  }
}
