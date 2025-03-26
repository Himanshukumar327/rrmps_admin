import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rrmps_admin/views/widgets/custom_button.dart';

class Student {
  int id;
  String name;
  int rollNo;
  String admissionNo;
  String fatherName;
  String motherName;
  String studentClass;
  String section;

  Student({
    required this.id,
    required this.name,
    required this.rollNo,
    required this.admissionNo,
    required this.fatherName,
    required this.motherName,
    required this.studentClass,
    required this.section,
  });
}

class ViewStudentController extends GetxController {
  var allStudents = <Student>[
    Student(id: 1, name: "NANCY GUPTA", rollNo: 122, admissionNo: "20240002", fatherName: "ARVIND KUMAR", motherName: "", studentClass: "Class2", section: "A"),
    Student(id: 2, name: "OM TIWARI", rollNo: 123, admissionNo: "20240005", fatherName: "VIJAY KUMAR TIWARI", motherName: "", studentClass: "Class2", section: "A"),
    Student(id: 3, name: "SOM TIWARI", rollNo: 124, admissionNo: "20240006", fatherName: "JAY KUMAR TIWARI", motherName: "", studentClass: "Class3", section: "B"),
  ].obs;

  var filteredStudents = <Student>[].obs;
  var selectedClass = "".obs;
  var selectedSection = "".obs;

  final List<String> classList = ["Class1", "Class2", "Class3"];
  final List<String> sectionList = ["A", "B", "C"];

  @override
  void onInit() {
    super.onInit();
    filteredStudents.assignAll(allStudents);
  }

  void filterStudents() {
    if (selectedClass.value.isNotEmpty && selectedSection.value.isNotEmpty) {
      filteredStudents.assignAll(allStudents.where((student) =>
      student.studentClass == selectedClass.value &&
          student.section == selectedSection.value));
    } else {
      filteredStudents.assignAll(allStudents);
    }
  }

  void deleteStudent(int id) {
    allStudents.removeWhere((student) => student.id == id);
    filterStudents();
  }

  void editStudent(Student student, String name, int rollNo) {
    student.name = name;
    student.rollNo = rollNo;
    allStudents.refresh();
    filterStudents();
  }
}

class ViewStudentDetailsScreen extends StatelessWidget {
  final ViewStudentController controller = Get.put(ViewStudentController());

  ViewStudentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.blueAccent),
          centerTitle: true,
          leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back)),
          title: Text("Student List",style: TextStyle(color: Colors.blueAccent),)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFilters(),
            SizedBox(height: 16),
            Expanded(child: _buildStudentTable()),
          ],
        ),
      ),
    );
  }

  Widget _buildFilters() {
    return Row(
      children: [
        Expanded(
          child: Obx(() => DropdownButtonFormField<String>(
            value: controller.selectedClass.value.isEmpty ? null : controller.selectedClass.value,
            hint: Text("Select Class"),
            items: controller.classList.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              controller.selectedClass.value = newValue!;
              controller.filterStudents();
            },
            decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Class"),
          )),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Obx(() => DropdownButtonFormField<String>(
            value: controller.selectedSection.value.isEmpty ? null : controller.selectedSection.value,
            hint: Text("Select Section"),
            items: controller.sectionList.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              controller.selectedSection.value = newValue!;
              controller.filterStudents();
            },
            decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Section"),
          )),
        ),
      ],
    );
  }

  Widget _buildStudentTable() {
    return Obx(() => SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 20,
        columns: [
          DataColumn(label: Text("S.NO")),
          DataColumn(label: Text("NAME")),
          DataColumn(label: Text("ROLL NO")),
          DataColumn(label: Text("ADMISSION NO")),
          DataColumn(label: Text("FATHER NAME")),
          DataColumn(label: Text("MOTHER NAME")),
          DataColumn(label: Text("ACTIONS")),
        ],
        rows: controller.filteredStudents
            .map((student) => DataRow(cells: [
          DataCell(Text(student.id.toString())),
          DataCell(Text(student.name)),
          DataCell(Text(student.rollNo.toString())),
          DataCell(Text(student.admissionNo)),
          DataCell(Text(student.fatherName)),
          DataCell(Text(student.motherName)),
          DataCell(Row(
            children: [
              CustomButton(
                color: Colors.blue,
                height: 45,
                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(3), borderSide: BorderSide.none),
                buttonText: "Edit",
                textStyle: TextStyle(color: Colors.white),
                onPressed: () => _editStudentDialog(student),
              ),
              SizedBox(width: 10),
              CustomButton(
                color: Colors.red,
                height: 45,
                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(3), borderSide: BorderSide.none),
                buttonText: "Delete",
                textStyle: TextStyle(color: Colors.white),
                onPressed: () => controller.deleteStudent(student.id),
              )
            ],
          )),
        ]))
            .toList(),
      ),
    ));
  }

  void _editStudentDialog(Student student) {
    TextEditingController nameController = TextEditingController(text: student.name);
    TextEditingController rollNoController = TextEditingController(text: student.rollNo.toString());

    Get.defaultDialog(
      title: "Edit Student",
      content: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(labelText: "Name"),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: rollNoController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Roll No"),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            controller.editStudent(student, nameController.text, int.parse(rollNoController.text));
            Get.back();
            Get.snackbar("Updated", "${student.name}'s details updated successfully");
          },
          child: Text("Save"),
        ),
      ],
    );
  }
}
