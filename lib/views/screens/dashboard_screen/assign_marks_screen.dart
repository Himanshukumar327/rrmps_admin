import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssignController extends GetxController {
  var selectedClass = Rxn<String>();
  var selectedExam = Rxn<String>();
  var selectedSubject = Rxn<String>();
  var selectedSection = Rxn<String>();
  var filteredStudents = <Map<String, String>>[].obs;

  List<String> classes = ['Class 1', 'Class 2', 'Class 3'];
  List<String> exams = ['Mid-Term', 'Final', 'Unit Test'];
  List<String> subjects = ['Math', 'Science', 'English'];
  List<String> sections = ['A', 'B', 'C'];

  // Students Data
  List<Map<String, String>> students = [
    {"name": "Amit Kumar", "class": "Class 1"},
    {"name": "Neha Sharma", "class": "Class 1"},
    {"name": "Sonu Sharma", "class": "Class 1"},
    {"name": "Priya Sharma", "class": "Class 1"},
    {"name": "Rahul Verma", "class": "Class 2"},
    {"name": "Priya Yadav", "class": "Class 2"},
    {"name": "Pretty Yadav", "class": "Class 2"},
    {"name": "Priyanka Yadav", "class": "Class 2"},
    {"name": "Ankit Singh", "class": "Class 3"},
    {"name": "Anshika Singh", "class": "Class 3"},
    {"name": "Ankita Singh", "class": "Class 3"},
    {"name": "Suman Gupta", "class": "Class 3"},
    {"name": "Abhi Gupta", "class": "Class 3"},
    {"name": "Sumant Gupta", "class": "Class 3"},
  ];

  void fetchData() {
    if (selectedClass.value != null &&
        selectedExam.value != null &&
        selectedSubject.value != null &&
        selectedSection.value != null) {
      filteredStudents.value = students
          .where((student) => student["class"] == selectedClass.value)
          .toList();
    }
  }
}

class DashBoardAssignMarks extends StatelessWidget {
  final AssignController controller = Get.put(AssignController());

   DashBoardAssignMarks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.blueAccent),
        leading: IconButton(onPressed: (){
           Get.back();
        }, icon: Icon(Icons.arrow_back,color: Colors.blueAccent,)),
        title: Text(
          'Assign Marks',
          style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildDropdown('Class', controller.classes, controller.selectedClass),
            buildDropdown('Exam', controller.exams, controller.selectedExam),
            buildDropdown('Subject', controller.subjects, controller.selectedSubject),
            buildDropdown('Section', controller.sections, controller.selectedSection),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: controller.fetchData,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                child: Text("Show Data", style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 20),
            Obx(() => controller.filteredStudents.isNotEmpty
                ? Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 62,
                  border: TableBorder.all(),
                  columns: [
                    DataColumn(label: Text("S.NO")),
                    DataColumn(label: Text("NAME")),
                    DataColumn(label: Text("CLASS")),
                    DataColumn(label: Text("MATHS")),
                    DataColumn(label: Text("Action")),
                    // DataColumn(label: Text("ENGLISH")),
                    // DataColumn(label: Text("SOCIAL STUDIES")),
                  ],
                  rows: List.generate(
                    controller.filteredStudents.length,
                        (index) => DataRow(
                      cells: [
                        DataCell(Text("${index + 1}")),
                        DataCell(Text(controller.filteredStudents[index]["name"]!)),
                        DataCell(Text(controller.filteredStudents[index]["class"]!)),
                        DataCell(MarksInputField()),
                        DataCell(MarksInputField()),
                        // DataCell(MarksInputField()),
                        // DataCell(MarksInputField()),
                      ],
                    ),
                  ),
                ),
              ),
            )
                : Center(child: Text("No students found"))),
          ],
        ),
      ),
    );
  }

  Widget buildDropdown(String label, List<String> items, Rxn<String> selectedValue) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Obx(
            () => DropdownButtonFormField<String>(
          isExpanded: true,
          decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
          value: selectedValue.value,
          items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: (value) => selectedValue.value = value,
        ),
      ),
    );
  }
}

// Input field for marks
class MarksInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        width: 60,
        child: TextField(
          decoration: InputDecoration(
            hintText: "Enter",
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          ),
        ),
      ),
    );
  }
}
