import 'dart:developer';

import 'package:eduplan/features/auth/domain/auth_repo/auth_repo.dart';
import 'package:eduplan/features/auth/domain/entities/teacher.dart';
import 'package:eduplan/features/auth/presentation/cubits/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepo}) : super(AuthInitialState());
  final AuthRepo authRepo;

  Future<void> register(Teacher teacher) async {
    try {
      emit(AuthLoadingState());
      final currentTeacher = await authRepo.teacherRegister(teacher);
      if (currentTeacher != null) {
        emit(AuthenticatedState(teacher: currentTeacher));
      } else {
        emit(UnAuthenticatedState());
      }
    } catch (e) {
      emit(AuthErrorState(msg: 'Registration Failed'));
    }
  }

  Future<void> fetchSubjects() async {
    try {
      emit(SubjectsLoading());
      final subjectsList = await authRepo.getSubjects();
      if (subjectsList != null) {
        emit(SubjectsLoaded(subjects: subjectsList));
      } else {
        emit(SubjectsLoadingFaild());
      }
    } catch (e) {
      log(e.toString());
      emit(SubjectsLoadingFaild());
    }
  }
}
