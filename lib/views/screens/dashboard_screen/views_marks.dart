import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewsMarksScreen extends StatefulWidget {
  const ViewsMarksScreen({super.key});

  @override
  ViewsMarksScreenState createState() => ViewsMarksScreenState();
}

class ViewsMarksScreenState extends State<ViewsMarksScreen> {
  String? selectedClass;
  String? selectedExam;
  String? selectedSubject;
  String? selectedSection;
  bool selectAllSubjects = false;

  List<Map<String, dynamic>> students = [
    {'sNo': 1, 'name': 'KAVYA BIND', 'class': 'LKG', 'math': 8},
    {'sNo': 2, 'name': 'PRANJAL BIND', 'class': 'LKG', 'math': 9},
    {'sNo': 3, 'name': 'ZIKRA', 'class': 'LKG', 'math': 8},
    {'sNo': 4, 'name': 'ANAM', 'class': 'LKG', 'math': 0},
    {'sNo': 1, 'name': 'KAVYA Singh', 'class': 'UKG', 'math': 8},
    {'sNo': 2, 'name': 'Priyanka Kumari', 'class': 'UKG', 'math': 9},
    {'sNo': 3, 'name': 'Sonu Kumar', 'class': 'UKG', 'math': 8},
    {'sNo': 4, 'name': 'Aman Gupta', 'class': 'UKG', 'math': 0},
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredStudents = students.where((student) {
      return selectedClass != null && student['class'] == selectedClass;
    }).toList();

    bool shouldShowTable = selectedClass != null &&
        selectedExam != null &&
        selectedSubject != null &&
        selectedSection != null;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back,color: Colors.blueAccent,)),
        title: Text("View Marks",style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold),),
        iconTheme: IconThemeData(color: Colors.white),),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: buildDropdown("Class", ["LKG", "UKG"], (val) => setState(() => selectedClass = val))),
                SizedBox(width: 10),
                Expanded(child: buildDropdown("Exam", ["PTI", "Mid-Term"], (val) => setState(() => selectedExam = val))),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: buildDropdown("Subject", ["MATH", "SCIENCE"], (val) => setState(() => selectedSubject = val))),
                SizedBox(width: 10),
                Expanded(child: buildDropdown("Section", ["A", "B"], (val) => setState(() => selectedSection = val))),
              ],
            ),
            SizedBox(height: 10),
            CheckboxListTile(
              title: Text("Select All Subject"),
              value: selectAllSubjects,
              onChanged: (bool? value) {
                setState(() {
                  selectAllSubjects = value ?? false;
                });
              },
            ),
            SizedBox(height: 20),
            if (shouldShowTable)
              Expanded(
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
                    rows: filteredStudents.map((student) => DataRow(cells: [
                      DataCell(Text(student['sNo'].toString())),
                      DataCell(Text(student['name'])),
                      DataCell(Text(student['class'])),
                      DataCell(Text(student['math'].toString())),
                      DataCell(Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {},
                          ),
                        ],
                      )),
                    ])).toList(),
                  ),
                ),
              ),
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
