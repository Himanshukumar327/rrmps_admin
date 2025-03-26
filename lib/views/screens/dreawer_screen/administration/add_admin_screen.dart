import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rrmps_admin/views/widgets/custom_button.dart';
import 'package:rrmps_admin/views/widgets/custom_text_field.dart';

class AddAdminScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   AddAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double titleFontSize = screenWidth * 0.055;
    double inputFontSize = screenWidth * 0.04;
    double buttonFontSize = screenWidth * 0.045;
    double paddingValue = screenWidth * 0.05;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back)),
        iconTheme: IconThemeData(color: Colors.blueAccent),
        centerTitle: true,
        title: Text("Add Admin",style: TextStyle(color: Colors.blueAccent),),
      ),
      body: Form(
        key: _formKey,
          child: ListView(
            children: [
              Padding(
                padding:  EdgeInsets.all(paddingValue),
                child: Column(
                  children: [
                    CustomTextField(
                      labelText: 'First Name',
                      controller: TextEditingController(),
                      textStyle: TextStyle(fontSize: inputFontSize),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        // controller.email.value = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your First Name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomTextField(
                      labelText: 'Last Name',
                      controller: TextEditingController(),
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      textStyle: TextStyle(fontSize: inputFontSize),
                      onChanged: (value) {
                        // controller.password.value = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Last Name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomTextField(
                      labelText: 'Phone',
                      controller: TextEditingController(),
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      textStyle: TextStyle(fontSize: inputFontSize),
                      onChanged: (value) {
                        // controller.password.value = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Phone Number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomTextField(
                      labelText: 'Email',
                      controller: TextEditingController(),
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      textStyle: TextStyle(fontSize: inputFontSize),
                      onChanged: (value) {
                        // controller.password.value = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomTextField(
                      labelText: 'Password',
                      controller: TextEditingController(),
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      textStyle: TextStyle(fontSize: inputFontSize),
                      onChanged: (value) {
                        // controller.password.value = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomTextField(
                      labelText: 'Re-Password',
                      controller: TextEditingController(),
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      textStyle: TextStyle(fontSize: inputFontSize),
                      onChanged: (value) {
                        // controller.password.value = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your  Re-Password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    // CustomTextField(
                    //   labelText: 'More Details',
                    //   controller: TextEditingController(),
                    //   obscureText: true,
                    //   keyboardType: TextInputType.text,
                    //   textStyle: TextStyle(fontSize: inputFontSize),
                    //   onChanged: (value) {
                    //     // controller.password.value = value;
                    //   },
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Please enter your  Re-Password';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    CustomTextField(
                      labelText: '   More Details',
                      controller: TextEditingController(),
                      keyboardType: TextInputType.text,
                      textStyle: TextStyle(fontSize: inputFontSize),
                      contentPadding: EdgeInsets.symmetric(vertical: paddingValue),
                      onChanged: (value) {
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Re-Password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomButton(
                          color: Colors.blueAccent,
                          height: screenHeight * 0.070,
                          buttonText:
                          // controller.isLoading.value?"Loading...":
                          "Add Admin",
                          textStyle: TextStyle(fontSize: buttonFontSize, color: Colors.white),
                          shape: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onPressed: () {
                            // if (_formKey.currentState!.validate()) {
                            // controller.login();
                            // }
                          },
                        ),
                      ],
                    )

                  ],
                ),
              )
            ],
          ),
      ),
    );
  }
}
