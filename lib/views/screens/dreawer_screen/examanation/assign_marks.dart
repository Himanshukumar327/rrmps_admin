import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssignMarksScreen extends StatefulWidget {
  const AssignMarksScreen({super.key});

  @override
  AssignMarksScreenState createState() => AssignMarksScreenState();
}

class AssignMarksScreenState extends State<AssignMarksScreen> {
  String? selectedClass;
  String? selectedExam;
  String? selectedSubject;
  String? selectedSection;
  bool selectAllSubjects = false;

  // List of students with marks
  List<Map<String, dynamic>> students = [
    {'sNo': 1, 'name': 'KAVYA BIND', 'class': '1', 'math': 8},
    {'sNo': 2, 'name': 'PRANJAL BIND', 'class': '1', 'math': 9},
    {'sNo': 3, 'name': 'ZIKRA', 'class': '2', 'math': 8},
    {'sNo': 4, 'name': 'ANAM', 'class': '2', 'math': 0},
    {'sNo': 5, 'name': 'KAVYA Singh', 'class': '2', 'math': 8},
    {'sNo': 6, 'name': 'Priyanka Kumari', 'class': '3', 'math': 9},
    {'sNo': 7, 'name': 'Sonu Kumar', 'class': '3', 'math': 8},
    {'sNo': 8, 'name': 'Aman Gupta', 'class': '3', 'math': 0},
    {'sNo': 8, 'name': 'Aman Gupta', 'class': '3', 'math': 0},

  ];

  // Controllers for editing marks
  Map<int, TextEditingController> controllers = {};

  @override
  void initState() {
    super.initState();
    for (var student in students) {
      controllers[student['sNo']] = TextEditingController(text: student['math'].toString());
    }
  }

  @override
  void dispose() {
    for (var controller in controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

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
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: Colors.blueAccent),
        ),
        title: Text(
          "Assign Marks",
          style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: buildDropdown("Class", ["1", "2", "3"], (val) => setState(() => selectedClass = val))),
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
                    rows: filteredStudents.map((student) {
                      return DataRow(cells: [
                        DataCell(Text(student['sNo'].toString())),
                        DataCell(Text(student['name'])),
                        DataCell(Text(student['class'])),
                        DataCell(
                          textField(
                            controller: controllers[student['sNo']]!,
                            onChanged: (value) {
                              setState(() {
                                student['math'] = int.tryParse(value) ?? 0;
                              });
                            },
                          ),
                        ),
                        DataCell(Text("")),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Custom TextField
  Widget textField({required TextEditingController controller, Function(String)? onChanged}) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "Enter marks",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onChanged: onChanged,
    );
  }

  // Dropdown Widget
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