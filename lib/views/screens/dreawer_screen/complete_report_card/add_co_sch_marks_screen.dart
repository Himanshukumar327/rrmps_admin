import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCoSchMarksScreen extends StatefulWidget {
  const AddCoSchMarksScreen({super.key});

  @override
  AddCoSchMarksScreenState createState() => AddCoSchMarksScreenState();
}

class AddCoSchMarksScreenState extends State<AddCoSchMarksScreen> {
  String? selectedClass;
  String? selectedExam;
  String? selectedSection;

  List<String> classes = ["LKG", "UKG", "1st", "2nd"];
  List<String> exams = ["PT1", "PT2", "Midterm", "Final"];
  List<String> sections = ["A", "B", "C"];

  List<Map<String, String>> students = [
    {"name": "KAVYA BIND", "class": "LKG"},
    {"name": "PRANJAL BIND", "class": "LKG"},
    {"name": "ZIKRA", "class": "LKG"},
    {"name": "ANAM", "class": "UKG"},
    {"name": "ADITYA BHASKER", "class": "1st"},
    {"name": "Ravi Kumar", "class": "1st"},
    {"name": "Abhishek Singh", "class": "1st"},
    {"name": "Aryan BHASKER", "class": "1st"},
    {"name": "Ajay BHASKER", "class": "1st"},
    {"name": "Sumant Singh", "class": "1st"},
    {"name": "Abhi Singh", "class": "1st"},
    {"name": "Ram Singh", "class": "1st"},
    {"name": "Shyam Singh", "class": "2nd"},
    {"name": "Mohan Singh", "class": "2nd"},
    {"name": "Mohan kumar", "class": "2nd"},
    {"name": "Sohan Kumar", "class": "2nd"},
    {"name": "Ram Kumar", "class": "2nd"},
    {"name": "Vijay Kumar", "class": "2nd"},
  ];

  bool get isDropdownSelected =>
      selectedClass != null && selectedExam != null && selectedSection != null;

  List<Map<String, String>> get filteredStudents {
    if (selectedClass == null) return [];
    return students.where((student) => student["class"] == selectedClass).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(onPressed: (){
            Get.back();
          }, icon: Icon(Icons.arrow_back,color: Colors.blueAccent,)),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.blueAccent),
          title: Text("Add Co-Sch Marks",style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold),)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Dropdowns for Selection
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: "Class"),
                    value: selectedClass,
                    items: classes
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (value) => setState(() => selectedClass = value),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: "Exam"),
                    value: selectedExam,
                    items: exams
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (value) => setState(() => selectedExam = value),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: "Section"),
                    value: selectedSection,
                    items: sections
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (value) =>
                        setState(() => selectedSection = value),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            if (isDropdownSelected)
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 28,
                    border: TableBorder.all(),
                    columns: [
                      DataColumn(label: Text("S.NO")),
                      DataColumn(label: Text("NAME")),
                      DataColumn(label: Text("CLASS")),
                      DataColumn(label: Center(child: Text("HINDI"))),
                      DataColumn(label: Text("EVS")),
                      DataColumn(label: Text("DRAWING")),
                      DataColumn(label: Text("PT")),
                      DataColumn(label: Text("RECOGNITION")),
                      DataColumn(label: Text("PICTURE DICTATION")),
                      DataColumn(label: Text("PUNCTUALITY")),
                      // DataColumn(label: Text("UNIFORM")),
                      // DataColumn(label: Text("BEHAVIOUR")),
                      // DataColumn(label: Text("HOMEWORK")),
                      // DataColumn(label: Text("SINCERITY")),
                      // DataColumn(label: Text("Action")),
                    ],
                    rows: List.generate(
                      filteredStudents.length,
                          (index) => DataRow(cells: [
                        DataCell(Text("${index + 1}")),
                        DataCell(Text(filteredStudents[index]["name"]!)),
                        DataCell(Text(filteredStudents[index]["class"]!)),
                        DataCell(MarksInputField()),
                        DataCell(MarksInputField()),
                        DataCell(MarksInputField()),
                        DataCell(MarksInputField()),
                        DataCell(MarksInputField()),
                        DataCell(MarksInputField()),
                        DataCell(MarksInputField()),
                        // DataCell(MarksInputField()),
                        // DataCell(MarksInputField()),
                        // DataCell(MarksInputField()),
                        // DataCell(MarksInputField()),
                        // DataCell(MarksInputField()),
                      ]),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Widget for Input Fields inside Table
class MarksInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        // width: 60,
        child: TextField(
          decoration: InputDecoration(
            hintText: "Enter Mark",
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          ),
        ),
      ),
    );
  }
}
