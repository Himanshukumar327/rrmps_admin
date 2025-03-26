import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rrmps_admin/views/widgets/custom_button.dart';

class InstituteDetails extends StatelessWidget {
  const InstituteDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back)),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.blueAccent),
        title: Text('Institute Details',style: TextStyle(color: Colors.blueAccent),),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Financial Start Date
            _buildSectionTitle('Financial Start Date'),
            _buildDateInput('d-d-mm-yyyy'),
            _buildSectionTitle('Financial End Date'),
            _buildDateInput('d-d-mm-yyyy'),
            _buildSectionTitle('Academic Start Date'),
            _buildDateInput('d-d-mm-yyyy'),
            _buildSectionTitle('Academic End Date'),
            _buildDateInput('d-d-mm-yyyy'),
            _buildSectionTitle('Institute Name'),
            _buildTextField('Enter Institute Name'),
            _buildSectionTitle('Address'),
            _buildTextField('Enter Address'),
            _buildSectionTitle('Affiliation Detail'),
            _buildTextField('Enter Affiliation Detail'),
            _buildSectionTitle('Email'),
            _buildTextField('Enter Email'),
            _buildSectionTitle('Phone Number'),
            _buildTextField('Enter Phone Number'),
            _buildSectionTitle('Website URL'),
            _buildTextField('Enter Website URL'),
            SizedBox(height: 20,),
            CustomButton(
              height: 45,color: Colors.blueAccent,shape: OutlineInputBorder(borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10)),textStyle: TextStyle(color: Colors.white),
                buttonText: "Submit", onPressed: (){

            })
            
          ],
        ),
      ),
    );
  }

  // Helper method to build section titles
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  // Helper method to build date input fields
  Widget _buildDateInput(String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        ),
      ),
    );
  }

  // Helper method to build text input fields
  Widget _buildTextField(String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        ),
      ),
    );
  }
}