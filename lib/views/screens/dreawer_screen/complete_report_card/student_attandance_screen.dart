import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentAttendanceList extends StatefulWidget {
  const StudentAttendanceList({super.key});

  @override
  StudentAttendanceListState createState() => StudentAttendanceListState();
}

class StudentAttendanceListState extends State<StudentAttendanceList> {
  String? selectedClass;
  String? selectedExam;
  String? selectedSubject;
  String? selectedSection;
  bool selectAllSubjects = false;
  TextEditingController attendanceController = TextEditingController();

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
        selectedSection != null;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(onPressed: (){ Get.back(); }, icon: Icon(Icons.arrow_back,color: Colors.blueAccent,)),
        title: const Text("Student Total Attendance",style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: buildDropdown("Class", ["LKG", "UKG"], (val) => setState(() => selectedClass = val))),
                const SizedBox(width: 10),
                Expanded(child: buildDropdown("Section", ["A", "B"], (val) => setState(() => selectedSection = val))),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: buildDropdown("Exam", ["MATH", "SCIENCE"], (val) => setState(() => selectedExam = val))),
              ],
            ),
            const SizedBox(height: 20),
            if (shouldShowTable)
            // Only show table when class, section, and exam are selected
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 60,
                    columns: const [
                      DataColumn(label: Text("S.NO")),
                      DataColumn(label: Text("NAME")),
                      DataColumn(label: Text("CLASS")),
                      DataColumn(label: Text("ATTENDANCE")),
                    ],
                    rows: filteredStudents.map((student) => DataRow(
                      cells: [
                        DataCell(Text(student['sNo'].toString())),
                        DataCell(Text(student['name'])),
                        DataCell(Text(student['class'])),
                        DataCell(
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              ),
                              controller: TextEditingController(text: "Enter Attendance of ${student['name'].toString()}"),
                              onChanged: (value) {
                                setState(() {
                                  student['math'] = int.tryParse(value) ?? 0;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    )).toList(),
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



//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:rrmps_admin/views/widgets/custom_text_field.dart';
//
// class StudentAttendanceList extends StatefulWidget {
//   const StudentAttendanceList({super.key});
//
//   @override
//   StudentAttendanceListState createState() => StudentAttendanceListState();
// }
//
// class StudentAttendanceListState extends State<StudentAttendanceList> {
//   String? selectedClass;
//   String? selectedExam;
//   String? selectedSubject;
//   String? selectedSection;
//   bool selectAllSubjects = false;
//
//   List<Map<String, dynamic>> students = [
//     {'sNo': 1, 'name': 'KAVYA BIND', 'class': 'LKG', 'math': 8},
//     {'sNo': 2, 'name': 'PRANJAL BIND', 'class': 'LKG', 'math': 9},
//     {'sNo': 3, 'name': 'ZIKRA', 'class': 'LKG', 'math': 8},
//     {'sNo': 4, 'name': 'ANAM', 'class': 'LKG', 'math': 0},
//     {'sNo': 1, 'name': 'KAVYA Singh', 'class': 'UKG', 'math': 8},
//     {'sNo': 2, 'name': 'Priyanka Kumari', 'class': 'UKG', 'math': 9},
//     {'sNo': 3, 'name': 'Sonu Kumar', 'class': 'UKG', 'math': 8},
//     {'sNo': 4, 'name': 'Aman Gupta', 'class': 'UKG', 'math': 0},
//   ];
//
//   // Map to hold text editing controllers for each student
//   Map<int, TextEditingController> controllers = {};
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Initialize controllers for each student
//     for (var student in students) {
//       controllers[student['sNo']] = TextEditingController(
//         text: student['math'].toString(),
//       );
//     }
//   }
//
//   @override
//   void dispose() {
//     // Dispose controllers when the widget is disposed
//     controllers.values.forEach((controller) {
//       controller.dispose();
//     });
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, dynamic>> filteredStudents = students.where((student) {
//       return selectedClass != null && student['class'] == selectedClass;
//     }).toList();
//
//     bool shouldShowTable = selectedClass != null &&
//         selectedExam != null &&
//         selectedSection != null;
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         leading: IconButton(onPressed: () { Get.back(); }, icon: Icon(Icons.arrow_back, color: Colors.blueAccent)),
//         title: const Text("Student Total Attendance", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Expanded(child: buildDropdown("Class", ["LKG", "UKG"], (val) => setState(() => selectedClass = val))),
//                 const SizedBox(width: 10),
//                 Expanded(child: buildDropdown("Section", ["A", "B"], (val) => setState(() => selectedSection = val))),
//               ],
//             ),
//             const SizedBox(height: 10),
//             Row(
//               children: [
//                 Expanded(child: buildDropdown("Exam", ["MATH", "SCIENCE"], (val) => setState(() => selectedExam = val))),
//               ],
//             ),
//             const SizedBox(height: 20),
//             if (shouldShowTable)
//             // Only show table when class, section, and exam are selected
//               Expanded(
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: DataTable(
//                     columnSpacing: 60,
//                     columns: const [
//                       DataColumn(label: Text("S.NO")),
//                       DataColumn(label: Text("NAME")),
//                       DataColumn(label: Text("CLASS")),
//                       DataColumn(label: Text("ATTENDANCE")),
//                     ],
//                     rows: filteredStudents.map((student) {
//                       TextEditingController controller = controllers[student['sNo']]!;
//                       return DataRow(
//                         cells: [
//                           DataCell(Text(student['sNo'].toString())),
//                           DataCell(Text(student['name'])),
//                           DataCell(Text(student['class'])),
//                           DataCell(
//                             Padding(
//                               padding: const EdgeInsets.all(5.0),
//                               child: TextFormField(
//                                 keyboardType: TextInputType.number,
//                                 decoration: const InputDecoration(
//                                   border: OutlineInputBorder(),
//                                   contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                                 ),
//                                 controller: controller,
//                                 onChanged: (value) {
//                                   setState(() {
//                                     student['math'] = int.tryParse(value) ?? 0;
//                                   });
//                                 },
//                               ),
//                             ),
//                           ),
//                         ],
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildDropdown(String hint, List<String> items, Function(String?) onChanged) {
//     return DropdownButtonFormField<String>(
//       decoration: InputDecoration(
//         border: OutlineInputBorder(),
//         labelText: hint,
//       ),
//       items: items.map((item) {
//         return DropdownMenuItem(
//           value: item,
//           child: Text(item),
//         );
//       }).toList(),
//       onChanged: onChanged,
//     );
//   }
// }
