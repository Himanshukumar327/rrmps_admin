import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rrmps_admin/views/widgets/custom_button.dart';


class AdminList extends StatelessWidget {
  final List<Map<String, String>> data = [
    {
      'sno': '1',
      'firstName': 'rrmps',
      'lastName': 'publicschool',
      'phone': '56464',
      'email': 'rrmps@gmail.com',
      'password': '5638741baa619739ffad6157789ccde2',
    },
    // Add more rows as needed
  ];

   AdminList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.blueAccent),
        leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back,color: Colors.blueAccent,)),
        title: Text('Admin List',style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: DataTable(
            columnSpacing: 20.0, // Spacing between columns
            dataRowHeight: 60.0, // Height of each row
            headingRowHeight: 60.0, // Height of the header row
            columns: [
              DataColumn(label: Text('S.NO', style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('FIRST NAME', style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('LAST NAME', style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('PHONE', style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('EMAIL', style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('PASSWORD', style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('ACTION', style: TextStyle(fontWeight: FontWeight.bold))),
            ],
            rows: data.map((row) {
              return DataRow(
                cells: [
                  DataCell(Text(row['sno']!)),
                  DataCell(Text(row['firstName']!)),
                  DataCell(Text(row['lastName']!)),
                  DataCell(Text(row['phone']!)),
                  DataCell(Text(row['email']!)),
                  DataCell(Text(row['password']!)),
                  DataCell(
                    Row(
                      children: [
                        CustomButton(
                          color: Colors.blue,
                            height: 45,shape: OutlineInputBorder(borderRadius: BorderRadius.circular(3),borderSide: BorderSide.none),
                            buttonText: "Edit", textStyle:TextStyle(color: Colors.white), onPressed: (){}
                        ),
                        CustomButton(
                          color: Colors.red,
                            height: 45,shape: OutlineInputBorder(borderRadius: BorderRadius.circular(3),borderSide: BorderSide.none),
                            buttonText: "Delete", textStyle:TextStyle(color: Colors.white),onPressed: (){}
                        )
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}