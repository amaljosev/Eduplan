import 'package:eduplan/admin/features/home/presentation/admin_home_screen.dart';
import 'package:eduplan/admin/features/subjects/presentation/subjects_screen.dart';
import 'package:eduplan/features/auth/presentation/landing_screen.dart';
import 'package:eduplan/features/auth/presentation/login_screen.dart';
import 'package:eduplan/features/auth/presentation/teacher_register_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/landing': (context) => const ScreenLanding(),
    '/login': (context) => const ScreenLogin(),
    '/register': (context) => const ScreenTeacherRegister(),
    '/admin': (context) => const ScreenAdminHome(),
    '/subjects': (context) => const SubjectsScreen(),
  };
}
