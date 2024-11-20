part of 'home_cubit.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class ClassesLoadingState extends HomeState {}

final class ClassesLoadedState extends HomeState {
  final List<ClassModel> classes;
  ClassesLoadedState({required this.classes});
}

final class ClassesErrorState extends HomeState {}

final class AddClassesLoadingState extends HomeState {}

final class AddClassesLoadedState extends HomeState {}

final class AddClassesFailedState extends HomeState {
  final String msg;

  AddClassesFailedState({required this.msg});
}

final class AddClassesErrorState extends HomeState {}

final class DeleteClassesLoadingState extends HomeState {}

final class DeleteClassesSuccessState extends HomeState {}

final class DeleteClassesFailedState extends HomeState {}

final class TeachersLoadingState extends HomeState {}

final class TeachersLoadedState extends HomeState {
  final List<Teacher> teacahers;
  TeachersLoadedState({required this.teacahers});
}

final class TeachersErrorState extends HomeState {}
