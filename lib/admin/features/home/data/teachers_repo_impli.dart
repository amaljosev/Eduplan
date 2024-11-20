import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduplan/admin/features/home/domain/class_repo/teacher_repo.dart';
import 'package:eduplan/features/auth/domain/entities/teacher.dart';

class TeachersRepoImpli implements TeacherRepo {
  final firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<List<Teacher>?> fetchTeachers() async {
    try {
      QuerySnapshot<Map<String, dynamic>> teachersDoc =
          await FirebaseFirestore.instance.collection('teachers').get();
      List<Teacher>? teachersList =
          teachersDoc.docs.map((doc) => Teacher.fromJson(doc.data())).toList();
      return teachersList;
    } catch (e) {
      log("Error fetching classes: $e");
      return [];
    }
  }
}
