import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rrmps_admin/controllers/drawer_controller/view_marks_controller.dart';

class ViewMarksScreen extends StatelessWidget {
  const ViewMarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MarksController marksController = Get.put(MarksController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: Colors.blueAccent),
        ),
        title: Text(
          "View Marks",
          style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdowns for selections
            Row(
              children: [
                Expanded(
                    child: buildDropdown(
                        "Class", ["1", "2", "3"], (val) => marksController.selectedClass.value = val)),
                SizedBox(width: 10),
                Expanded(
                    child: buildDropdown(
                        "Exam", ["PTI", "Mid-Term"], (val) => marksController.selectedExam.value = val)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                    child: buildDropdown(
                        "Subject", ["MATH", "SCIENCE"], (val) => marksController.selectedSubject.value = val)),
                SizedBox(width: 10),
                Expanded(
                    child: buildDropdown(
                        "Section", ["A", "B"], (val) => marksController.selectedSection.value = val)),
              ],
            ),
            SizedBox(height: 10),
            Obx(() => CheckboxListTile(
              title: Text("Select All Subject"),
              value: marksController.selectAllSubjects.value,
              onChanged: (bool? value) {
                marksController.selectAllSubjects.value = value ?? false;
              },
            )),
            SizedBox(height: 20),
            Obx(() {
              // Show table when all selections are made
              bool shouldShowTable = marksController.selectedClass.value != null &&
                  marksController.selectedExam.value != null &&
                  marksController.selectedSubject.value != null &&
                  marksController.selectedSection.value != null;

              return shouldShowTable
                  ? Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text("S.NO")),
                      DataColumn(label: Text("NAME")),
                      DataColumn(label: Text("CLASS")),
                      DataColumn(label: Text("MATH")),
                      DataColumn(label: Text("ACTION")),
                    ],
                    rows: marksController.filteredStudents.map((student) {
                      return DataRow(cells: [
                        DataCell(Text(student['sNo'].toString())),
                        DataCell(Text(student['name'])),
                        DataCell(Text(student['class'])),
                        DataCell(Text(student['math'].toString())), // Assuming math is the subject
                        DataCell(Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                // Add edit logic if needed
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                marksController.removeStudent(student['sNo']);
                              },
                            ),
                          ],
                        )),
                      ]);
                    }).toList(),
                  ),
                ),
              )
                  : Container(); // Empty container when conditions aren't met
            }),
          ],
        ),
      ),
    );
  }

  Widget buildDropdown(String hint, List<String> items, Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: hint,
      ),
      items: items.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
