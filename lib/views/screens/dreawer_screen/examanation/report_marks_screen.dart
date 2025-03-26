import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportMarksScreen extends StatefulWidget {
  const ReportMarksScreen({super.key});

  @override
  ReportMarksScreenState createState() => ReportMarksScreenState();
}

class ReportMarksScreenState extends State<ReportMarksScreen> {
  String? selectedClass;
  String? selectedSection;

  List<Map<String, dynamic>> students = [
    {'sNo': 1, 'name': 'KAVYA BIND', 'studentId': '514', 'class': 'LKG', 'section': 'A'},
    {'sNo': 2, 'name': 'PRANJAL BIND', 'studentId': '515', 'class': 'LKG', 'section': 'A'},
    {'sNo': 3, 'name': 'ZIKRA', 'studentId': '516', 'class': 'UKG', 'section': 'B'},
    {'sNo': 4, 'name': 'ANAM', 'studentId': '517', 'class': 'LKG', 'section': 'B'},
    {'sNo': 5, 'name': 'ADITYA BHASKER', 'studentId': '518', 'class': 'UKG', 'section': 'A'},
    {'sNo': 6, 'name': 'MOHD AFFAN', 'studentId': '519', 'class': 'LKG', 'section': 'A'},
    {'sNo': 7, 'name': 'ADVIK YADAV', 'studentId': '520', 'class': 'UKG', 'section': 'B'},
  ];

  List<Map<String, dynamic>> filteredStudents = [];

  void filterStudents() {
    setState(() {
      if (selectedClass != null && selectedSection != null) {
        filteredStudents = students.where((student) {
          return student['class'] == selectedClass && student['section'] == selectedSection;
        }).toList();
      } else {
        filteredStudents = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back,color: Colors.blueAccent,)),
        title: const Text("Report Marks Screen",style: TextStyle(color: Colors.blueAccent,
            fontWeight: FontWeight.bold),),iconTheme: IconThemeData(color: Colors.white),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdowns for Class & Section
            Row(
              children: [
                Expanded(
                  child: buildDropdown("Class", ["LKG", "UKG"], (val) {
                    setState(() {
                      selectedClass = val;
                      filterStudents();
                    });
                  }),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: buildDropdown("Section", ["A", "B"], (val) {
                    setState(() {
                      selectedSection = val;
                      filterStudents();
                    });
                  }),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Show Table Only If Both Dropdowns are Selected
            if (filteredStudents.isNotEmpty)
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 55,
                    headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
                    columns: const [
                      DataColumn(label: Text("S.NO", style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text("NAME", style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text("STUDENT ID", style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text("ACTION", style: TextStyle(fontWeight: FontWeight.bold))),
                    ],
                    rows: filteredStudents.map((student) {
                      return DataRow(cells: [
                        DataCell(Text(student['sNo'].toString())),
                        DataCell(Text(student['name'])),
                        DataCell(Text(student['studentId'])),
                        DataCell(
                          Container(
                            height: 40, width: 40, color: Colors.green,
                            child: const Icon(Icons.edit, color: Colors.white),
                          ),
                        ),
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

  Widget buildDropdown(String hint, List<String> items, Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: hint,
        filled: true,
        fillColor: Colors.white,
      ),
      items: items.map((item) {
        return DropdownMenuItem(value: item, child: Text(item));
      }).toList(),
      onChanged: onChanged,
    );
  }
}
