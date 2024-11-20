import 'package:eduplan/features/auth/domain/entities/teacher.dart';

import '../../../../admin/features/subjects/domain/entities/subject_model.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthenticatedState extends AuthState {
  final Teacher teacher;

  AuthenticatedState({required this.teacher});
}

class UnAuthenticatedState extends AuthState {}

class AuthErrorState extends AuthState {
  final String msg;

  AuthErrorState({required this.msg});
}

final class SubjectsLoading extends AuthState {}

final class SubjectsLoaded extends AuthState {
  final List<SubjectModel>? subjects;

  SubjectsLoaded({required this.subjects});
}

final class SubjectsLoadingFaild extends AuthState {}
