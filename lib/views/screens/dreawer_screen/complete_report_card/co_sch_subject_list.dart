import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rrmps_admin/views/widgets/custom_button.dart';


class CoSchSubjectList extends StatefulWidget {
  const CoSchSubjectList({super.key});

  @override
  State<CoSchSubjectList> createState() => _CoSchSubjectListState();
}

class _CoSchSubjectListState extends State<CoSchSubjectList> {
  String? selectedClass;

  final Map<String, List<Map<String, String>>> classExams = {
    "Class 1": [
      {"S.No": "1", "Exam Name": "Math Exam", "Marks Type": "100", "Action": "Edit"},
      {"S.No": "2", "Exam Name": "English Exam", "Marks Type": "50", "Action": "Edit"},
    ],
    "Class 2": [
      {"S.No": "1", "Exam Name": "Science Exam", "Marks Type": "100", "Action": "Edit"},
      {"S.No": "2", "Exam Name": "Social Science Exam", "Marks Type": "80", "Action": "Edit"},
    ],
    "Class 3": [
      {"S.No": "1", "Exam Name": "History Exam", "Marks Type": "70", "Action": "Edit"},
      {"S.No": "2", "Exam Name": "Geography Exam", "Marks Type": "60", "Action": "Edit"},
    ],
  };

  void _editExam(String examName) {
    // Get.snackbar("Edit Exam", "Editing $examName");
  }

  void _deleteExam(String examName) {
    // Get.snackbar("Delete Exam", "Deleted $examName");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.blueAccent),
          centerTitle: true,
          leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back)),
          title: Text("Co-Sch Subject List",style: TextStyle(color: Colors.blueAccent),)
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: "Select Class",
              ),
              items: ["Class 1", "Class 2", "Class 3"]
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedClass = value;
                });
              },
              validator: (value) => value == null ? 'The Class field is required.' : null,
            ),
            const SizedBox(height: 20),
            if (selectedClass != null)
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 40,
                    columns: const [
                      DataColumn(label: Text("S.No", style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text("Exam Name", style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text("Marks Type", style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text("Action", style: TextStyle(fontWeight: FontWeight.bold))),
                    ],
                    rows: (classExams[selectedClass] ?? []).map((exam) {
                      return DataRow(cells: [
                        DataCell(Text(exam["S.No"] ?? "")),
                        DataCell(Text(exam["Exam Name"] ?? "")),
                        DataCell(Text(exam["Marks Type"] ?? "")),
                        DataCell(
                          Row(
                            children: [
                              CustomButton(
                                color: Colors.blueAccent,
                                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                                height: 45,
                                textStyle: TextStyle(color: CupertinoColors.white),
                                buttonText: "Edit",
                                onPressed: () => _editExam(exam["Exam Name"] ?? ""),
                              ),
                              SizedBox(width: 10),
                              CustomButton(
                                color: Colors.red,
                                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                                height: 45,
                                textStyle: TextStyle(color: CupertinoColors.white),
                                buttonText: "Delete",
                                onPressed: () => _deleteExam(exam["Exam Name"] ?? ""),
                              ),

                            ],
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
}
