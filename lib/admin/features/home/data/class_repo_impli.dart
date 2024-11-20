import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduplan/admin/features/home/domain/class_repo/class_repo.dart';
import 'package:eduplan/admin/features/home/domain/entities/class_model.dart';

class ClassRepoImpli extends ClassRepo {
  final firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<String> createNewClass(ClassModel classData) async {
    try {
      // Query Firestore to check if a class with the same name and division exists
      final querySnapshot = await FirebaseFirestore.instance
          .collection('classes')
          .where('class_name', isEqualTo: classData.className)
          .where('division', isEqualTo: classData.division)
          .get();

      // If the query result is not empty, a class with the same name and division already exists
      if (querySnapshot.docs.isNotEmpty) {
        log('Class with name "${classData.className}" and division "${classData.division}" already exists.');
        return 'Class with name "${classData.className}" and division "${classData.division}" already exists.';
      }

      // Add the new class to Firestore
      await FirebaseFirestore.instance
          .collection('classes')
          .add(classData.toJson());
      log('Class created successfully.');
      return 'Success';
    } catch (e) {
      log('Error creating class: $e');
      return 'Error';
    }
  }

  @override
  Future<void> deleteClass(String id) async {
    try {
      await FirebaseFirestore.instance.collection('classes').doc(id).delete();
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<List<ClassModel>?> fetchClasses() async {
    try {
      QuerySnapshot<Map<String, dynamic>> classesDoc =
          await FirebaseFirestore.instance.collection('classes').get();
      List<ClassModel>? classList = classesDoc.docs
          .map((doc) => ClassModel.fromJson(doc.data(), doc.id))
          .toList();

      return classList;
    } catch (e) {
      log("Error fetching classes: $e");
      return [];
    }
  }
}
