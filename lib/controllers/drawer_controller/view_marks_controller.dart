import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MarksController extends GetxController {
  var selectedClass = Rx<String?>(null);
  var selectedExam = Rx<String?>(null);
  var selectedSubject = Rx<String?>(null);
  var selectedSection = Rx<String?>(null);
  var selectAllSubjects = false.obs;

  // A list of students
  var students = <Map<String, dynamic>>[
    {'sNo': 1, 'name': 'KAVYA BIND', 'class': '1', 'math': 8},
    {'sNo': 2, 'name': 'PRANJAL BIND', 'class': '1', 'math': 9},
    {'sNo': 3, 'name': 'ZIKRA', 'class': '2', 'math': 8},
    {'sNo': 4, 'name': 'ANAM', 'class': '2', 'math': 0},
    {'sNo': 5, 'name': 'KAVYA Singh', 'class': '2', 'math': 8},
    {'sNo': 6, 'name': 'Priyanka Kumari', 'class': '3', 'math': 9},
    {'sNo': 7, 'name': 'Sonu Kumar', 'class': '3', 'math': 8},
    {'sNo': 8, 'name': 'Aman Gupta', 'class': '3', 'math': 0},
  ].obs;

  // This will return the filtered list based on selected filters
  List<Map<String, dynamic>> get filteredStudents {
    return students
        .where((student) =>
    (selectedClass.value == null || student['class'] == selectedClass.value) &&
        (selectedExam.value != null) &&
        (selectedSubject.value != null) &&
        (selectedSection.value != null))
        .toList();
  }

  // Remove student by serial number
  void removeStudent(int sNo) {
    students.removeWhere((s) => s['sNo'] == sNo);
  }
}
