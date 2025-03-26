import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rrmps_admin/views/widgets/custom_text_field.dart';


void main(){
  runApp(GetMaterialApp(home: CreateExam(),));
}

class CreateExam extends StatefulWidget {
  CreateExam({super.key});

  @override
  State<CreateExam> createState() => _CreateExamState();
}

class _CreateExamState extends State<CreateExam> {
    TextEditingController examNameController = TextEditingController();
    String? selectedClass;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.blueAccent),
          centerTitle: true,
          leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back)),
          title: Text("Create Exam",style: TextStyle(color: Colors.blueAccent),)
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: height * 0.09,),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  labelText: "Select Class"),
              items: ["Class 1", "Class 2", "Class 3"]
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) => setState(() => selectedClass = value),
              validator: (value) => value == null ? 'The Class field is required.' : null,
            ),
            SizedBox(height: 15,),
            CustomTextField(
                controller: examNameController,
                labelText: "Enter Exam Name",
                textStyle: TextStyle(),
                keyboardType: TextInputType.text,
                onChanged: (p0) {},
                validator: (value) {},
            ),
            SizedBox(height: 15,),
            CustomTextField(
                controller: examNameController,
                labelText: "Enter Full Mark",
                textStyle: TextStyle(),
                keyboardType: TextInputType.text,
                onChanged: (p0) {},
                validator: (value) {},
            )
          ],
        ),
      ),
    );
  }
}
