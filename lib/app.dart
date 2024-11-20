import 'package:eduplan/admin/features/home/data/class_repo_impli.dart';
import 'package:eduplan/admin/features/home/data/teachers_repo_impli.dart';
import 'package:eduplan/admin/features/home/presentation/cubit/home_cubit.dart';
import 'package:eduplan/admin/features/subjects/data/subjects_repo_impli.dart';
import 'package:eduplan/admin/features/subjects/presentation/cubit/subjects_cubit.dart';
import 'package:eduplan/core/routes/app_routes.dart';
import 'package:eduplan/features/auth/data/firebase_auth_repo.dart';
import 'package:eduplan/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:eduplan/theme/lightmode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  final authRepo = FirebaseAuthRepo();
  final classRepo = ClassRepoImpli();
  final teacherRepo = TeachersRepoImpli();
  final subjectsRepo = SubjectsRepoImpli();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(authRepo: authRepo),
        ),
        BlocProvider(
          create: (context) =>
              HomeCubit(classesRepo: classRepo, teacherRepo: teacherRepo),
        ),
        BlocProvider(
          create: (context) => SubjectsCubit(subjectRepo: subjectsRepo),
        ),
      ],
      child: MaterialApp(
        title: 'EduPlan',
        theme: lightMode,
        routes: AppRoutes.routes,
        initialRoute: '/admin',
      ),
    );
  }
}
