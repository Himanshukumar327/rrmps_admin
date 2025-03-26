import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ViewCoSchMarks extends StatelessWidget {
  const ViewCoSchMarks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back,color: Colors.blueAccent,)),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('View Co Sch Marks',style: TextStyle(color: Colors.blueAccent),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(border:OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          labelText: 'Select Class'),
                      items: <String>['Class 1', 'Class 2', 'Class 3'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (_) {},
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(border:OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          labelText: 'Select Section'),
                      items: <String>['Section A', 'Section B', 'Section C'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (_) {},
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(border:OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          labelText: 'Select Exam'),
                      items: <String>['Exam 1', 'Exam 2', 'Exam 3'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (_) {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              // ElevatedButton(
              //   onPressed: () {},
              //   child: Text('Submit'),
              // ),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(label: Text('S.NO')),
                    DataColumn(label: Text('STUDENT ID')),
                    DataColumn(label: Text('NAME')),
                    DataColumn(label: Text('ART EDUCATION')),
                    DataColumn(label: Text('WORK EDUCATION')),
                    DataColumn(label: Text('HEALTH AND PHYSICAL EDUCATION')),
                    DataColumn(label: Text('NEATNESS')),
                    DataColumn(label: Text('PUNCTUALITY')),
                    DataColumn(label: Text('COURTEOUSNESS')),
                    DataColumn(label: Text('ACTION')),
                  ],
                  rows: const <DataRow>[
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                      ],
                    ),
                    // Add more rows as needed
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}