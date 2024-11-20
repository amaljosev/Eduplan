import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduplan/admin/features/subjects/domain/entities/subject_model.dart';
import 'package:eduplan/admin/features/subjects/domain/subjects_repo/subjects_repo.dart';

class SubjectsRepoImpli extends SubjectsRepo {
  final firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<void> addSubject(String subject) async {
    try {
      await firebaseFirestore.collection('subjects').add({'subject': subject});
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<List<SubjectModel>?> fetchSubjects() async {
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

  @override
  Future<void> deleteSubject(String id) async {
    try {
      await FirebaseFirestore.instance.collection('subjects').doc(id).delete();
    } catch (e) {
      log("Error fetching classes: $e");
    }
  }
}
