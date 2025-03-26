import 'package:flutter/material.dart';
import 'package:rrmps_admin/views/widgets/custom_button.dart';
import 'package:rrmps_admin/views/widgets/custom_text_field.dart';

class CoScholasticSubjectScreen extends StatefulWidget {
    const CoScholasticSubjectScreen({super.key});

  @override
  State<CoScholasticSubjectScreen> createState() => _CoScholasticSubjectScreenState();
}

class _CoScholasticSubjectScreenState extends State<CoScholasticSubjectScreen> {

  TextEditingController subjectNameController = TextEditingController();
  TextEditingController markOfSubController = TextEditingController();
  String? selectedSection;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
      final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Co-Scholastic Subject",style: TextStyle(color: Colors.blueAccent),),
        iconTheme: IconThemeData(color: Colors.blueAccent),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
        child: Column(
          children: [
            SizedBox(height: height * 0.04,),
            buildDropdown("Section", ["A", "B"], (val) => setState(() => selectedSection = val)),
            SizedBox(height: 15,),
            CustomTextField(controller: subjectNameController, labelText: "Enter Subject Name",
                textStyle: TextStyle(color:  Colors.grey), keyboardType:  TextInputType.text),
            SizedBox(height: 15,),
            CustomTextField(controller: subjectNameController, labelText: "Enter Full Marks For Subject",
                textStyle: TextStyle(color:  Colors.grey), keyboardType:  TextInputType.text),
            SizedBox(height: 20,),
            SizedBox(
              width: 110,
              child: CustomButton(
                color: Color(0xff58d65e),
                  height: 45,
                  shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                  textStyle: TextStyle(color: Colors.white,fontSize: 17),
                  buttonText: "Submit",
                  onPressed: (){

              }),
            )
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
