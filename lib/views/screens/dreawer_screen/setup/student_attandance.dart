import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentAttendanceScreen extends StatefulWidget {
  const StudentAttendanceScreen({super.key});

  @override
  StudentAttendanceScreenState createState() => StudentAttendanceScreenState();
}

class StudentAttendanceScreenState extends State<StudentAttendanceScreen> {
  String selectedClass = "LKG";
  String selectedSection = "A";
  DateTime selectedDate = DateTime.now();

  final List<String> classes = ["LKG", "UKG", "1st", "2nd", "3rd"];
  final List<String> sections = ["A", "B", "C", "D"];

  List<Map<String, dynamic>> students = List.generate(
    10,
        (index) => {
      'sNo': index + 1,
      'name': 'Student ${index + 1}',
      'class': 'LKG',
      'attendance': 'P',
    },
  );

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  bool get isFormValid {
    return selectedClass.isNotEmpty && selectedSection.isNotEmpty && selectedDate != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blueAccent),
        centerTitle: true,
        leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back)),
        title: const Text("Student Attendance",style: TextStyle(color: Colors.blueAccent),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDropdown(
                    'Class',
                    selectedClass,
                    classes,
                        (value) {
                      setState(() {
                        selectedClass = value!;
                      });
                    },
                  ),
                  const SizedBox(width: 10),
                  _buildDropdown(
                    'Section',
                    selectedSection,
                    sections,
                        (value) {
                      setState(() {
                        selectedSection = value!;
                      });
                    },
                  ),
                  const SizedBox(width: 10),
                  _buildTextField(
                    'Date',
                    "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}",
                    true,
                    onTap: () => _selectDate(context),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Display DataTable only if the form is valid
              if (isFormValid)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(color: Colors.white70, blurRadius: 10, offset: Offset(0, 2)),
                    ],
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columnSpacing: 60,
                      columns: const [
                        DataColumn(label: Text("S.NO", style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("NAME", style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("CLASS", style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("ATTENDANCE", style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                      rows: students.map((student) {
                        return DataRow(cells: [
                          DataCell(Text(student['sNo'].toString())),
                          DataCell(Text(student['name'])),
                          DataCell(Text(student['class'])),
                          DataCell(Row(
                            children: [
                              Radio(
                                value: 'P',
                                groupValue: student['attendance'],
                                onChanged: (value) {
                                  setState(() {
                                    student['attendance'] = value;
                                  });
                                },
                              ),
                              Text("P"),
                              Radio(
                                value: 'A',
                                groupValue: student['attendance'],
                                onChanged: (value) {
                                  setState(() {
                                    student['attendance'] = value;
                                  });
                                },
                              ),
                              Text("A"),
                            ],
                          )),
                        ]);
                      }).toList(),
                    ),
                  ),
                ),
              if (!isFormValid)
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Please select class, section, and date to view attendance data.",
                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(
      String label,
      String selectedValue,
      List<String> items,
      ValueChanged<String?> onChanged
      ) {
    return Expanded(
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          filled: true,
          fillColor: Colors.grey[200],
        ),
        value: selectedValue,
        onChanged: onChanged,
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTextField(
      String label,
      String text,
      bool readOnly,
      {VoidCallback? onTap}
      ) {
    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          filled: true,
          fillColor: Colors.grey[200],
        ),
        controller: TextEditingController(text: text),
        readOnly: readOnly,
        onTap: onTap,
      ),
    );
  }
}
