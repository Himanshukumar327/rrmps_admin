import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewCoSchScreen extends StatefulWidget {
  const ViewCoSchScreen({super.key});

  @override
  ViewCoSchScreenState createState() => ViewCoSchScreenState();
}

class ViewCoSchScreenState extends State<ViewCoSchScreen> {
  String? selectedClass;
  String? selectedSection;
  String? selectedExam;

  List<Map<String, dynamic>> students = [
    {'sNo': 1, 'studentId': '101', 'name': 'Aman', 'art': 8, 'work': 9, 'health': 7, 'neatness': 9, 'punctuality': 8, 'courtesy': 9},
    {'sNo': 2, 'studentId': '102', 'name': 'Kavya', 'art': 9, 'work': 8, 'health': 8, 'neatness': 7, 'punctuality': 9, 'courtesy': 8},
  ];

  @override
  Widget build(BuildContext context) {
    bool shouldShowTable = selectedClass != null && selectedSection != null && selectedExam != null;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back,color: Colors.blueAccent,)),
        title: const Text("View Co-SCH Marks",style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold),),
        iconTheme: IconThemeData(color: Colors.white),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                buildDropdown("Select Class", ["LKG", "UKG"], (val) => setState(() => selectedClass = val)),
                const SizedBox(height: 10),
                buildDropdown("Select Section", ["A", "B"], (val) => setState(() => selectedSection = val)),
            const SizedBox(height: 10),
            buildDropdown("Select Exam", ["Mid-Term", "Final"], (val) => setState(() => selectedExam = val)),
            const SizedBox(height: 20),
            if (shouldShowTable)
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 20,
                    columns: const [
                      DataColumn(label: Text("S.NO")),
                      DataColumn(label: Text("STUDENT ID")),
                      DataColumn(label: Text("NAME")),
                      DataColumn(label: Text("ART EDUCATION")),
                      DataColumn(label: Text("WORK EDUCATION")),
                      DataColumn(label: Text("HEALTH & PHYSICAL EDUCATION")),
                      DataColumn(label: Text("NEATNESS")),
                      DataColumn(label: Text("PUNCTUALITY")),
                      DataColumn(label: Text("COURTEOUSNESS")),
                      DataColumn(label: Text("ACTION")),
                    ],
                    rows: students.map((student) {
                      return DataRow(cells: [
                        DataCell(Text(student['sNo'].toString())),
                        DataCell(Text(student['studentId'])),
                        DataCell(Text(student['name'])),
                        DataCell(Text(student['art'].toString())),
                        DataCell(Text(student['work'].toString())),
                        DataCell(Text(student['health'].toString())),
                        DataCell(Text(student['neatness'].toString())),
                        DataCell(Text(student['punctuality'].toString())),
                        DataCell(Text(student['courtesy'].toString())),
                        DataCell(Row(
                          children: [
                            IconButton(icon: const Icon(Icons.edit, color: Colors.blue), onPressed: () {}),
                            IconButton(icon: const Icon(Icons.delete, color: Colors.red), onPressed: () {}),
                          ],
                        )),
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
