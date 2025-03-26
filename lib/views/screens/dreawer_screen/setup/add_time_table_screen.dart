import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rrmps_admin/views/widgets/custom_button.dart';


class AddTimetableScreen extends StatefulWidget {
  const AddTimetableScreen({super.key});

  @override
  AddTimetableScreenState createState() => AddTimetableScreenState();
}

class AddTimetableScreenState extends State<AddTimetableScreen> {
  final _formKey = GlobalKey<FormState>();
  String? selectedClass;
  String? selectedDay;
  List<String?> subjects = List.filled(8, null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.blueAccent),
          centerTitle: true,
          leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back)),
          title: Text("Time Table",style: TextStyle(color: Colors.blueAccent),)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: "Select Class"),
                items: ["Class 1", "Class 2", "Class 3"]
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) => setState(() => selectedClass = value),
                validator: (value) => value == null ? 'The Class field is required.' : null,
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: "Select Day"),
                items: ["Monday", "Tuesday", "Wednesday"]
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) => setState(() => selectedDay = value),
                validator: (value) => value == null ? 'The Day field is required.' : null,
              ),
              SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return TextFormField(
                      decoration: InputDecoration(
                        labelText: "Period ${index + 1}",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                      value == null || value.isEmpty ? 'Enter Subject Name' : null,
                      onSaved: (value) => subjects[index] = value,
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              CustomButton(
                color: Colors.blueAccent,
                  height: 45,
                  textStyle: TextStyle(color: Colors.white),
                  shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                  buttonText: "ADD TIME",
                  onPressed: (){
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Timetable Saved Successfully!",)),
                      );
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Check Timetable ",style: TextStyle(color: Colors.red),)),
                      );
                    }
                  }
              ),

            ],
          ),
        ),
      ),
    );
  }
}
