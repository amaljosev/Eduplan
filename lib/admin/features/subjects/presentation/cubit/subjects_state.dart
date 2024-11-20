part of 'subjects_cubit.dart';

abstract class SubjectsState {}

final class SubjectsInitial extends SubjectsState {}

final class SubjectsLoading extends SubjectsState {}

final class SubjectsLoaded extends SubjectsState {
  final List<SubjectModel>? subjects;

  SubjectsLoaded({required this.subjects});
}

final class Subjectsfailed extends SubjectsState {}

final class AddSubjectLoading extends SubjectsState {}

final class AddSubjectSuccess extends SubjectsState {}

final class AddSubjectFaild extends SubjectsState {}
