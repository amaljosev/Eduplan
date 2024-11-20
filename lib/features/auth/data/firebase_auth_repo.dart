import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduplan/admin/features/subjects/domain/entities/subject_model.dart';
import 'package:eduplan/features/auth/domain/auth_repo/auth_repo.dart';
import 'package:eduplan/features/auth/domain/entities/teacher.dart';

class FirebaseAuthRepo implements AuthRepo {
  final firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<Teacher> getCurrentTeacher() {
    // TODO: implement getCurrentTeacher
    throw UnimplementedError();
  }

  @override
  Future<Teacher> logIn(String username, String password) {
    // TODO: implement logIn
    throw UnimplementedError();
  }

  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<Teacher> teacherRegister(Teacher teacher) async {
    await firebaseFirestore
        .collection('teachers')
        .doc(teacher.uid)
        .set(teacher.toJson());
    return teacher;
  }

  @override
  Future<List<String>> getClasses() {
    // TODO: implement getClasses
    throw UnimplementedError();
  }

  @override
  Future<List<SubjectModel>?> getSubjects() async {
    try {
      QuerySnapshot<Map<String, dynamic>> subjectsDoc =
          await FirebaseFirestore.instance.collection('subjects').get();

      List<SubjectModel>? subjectList = subjectsDoc.docs
          .map((doc) => SubjectModel.fromJson(doc.data(), doc.id))
          .toList();

      return subjectList;
    } catch (e) {
      log("Error fetching classes: $e");
      return [];
    }
  }
}
