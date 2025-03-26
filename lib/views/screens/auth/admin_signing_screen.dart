import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rrmps_admin/controllers/login_controller.dart';
import 'package:rrmps_admin/views/widgets/custom_button.dart';
import 'package:rrmps_admin/views/widgets/custom_text_field.dart';

class AdminLoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AdminLoginScreen({super.key});
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double titleFontSize = screenWidth * 0.055;
    double inputFontSize = screenWidth * 0.04;
    double buttonFontSize = screenWidth * 0.045;
    double paddingValue = screenWidth * 0.05;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.purple[300],
      body: Center(
        child: SingleChildScrollView(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.04),
              Card(
                color: Colors.white,
                elevation: 5,
                margin: EdgeInsets.symmetric(horizontal: paddingValue),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.all(paddingValue),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: screenWidth * 0.12,
                        backgroundImage: AssetImage("assets/images/school_logo.png"),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        'Sign into your account',
                        style: TextStyle(
                          fontSize: titleFontSize,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              labelText: 'Email address',
                              controller: TextEditingController(),
                              textStyle: TextStyle(fontSize: inputFontSize),
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (value) {
                                controller.email.value = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
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
                                controller.password.value = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              // Implement forgot password logic here
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(color: Colors.grey, fontSize: inputFontSize),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.001),
                      Obx(() => CustomButton(
                        color: Colors.black,
                        height: screenHeight * 0.050,
                        buttonText: controller.isLoading.value
                            ? "Loading..." : "Sign In",
                        textStyle: TextStyle(fontSize: buttonFontSize, color: Colors.white),
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: controller.isLoading.value
                            ? () {}
                            : () {
                          if (_formKey.currentState!.validate()) {
                            controller.login();
                          }
                        },
                      )),
                      SizedBox(height: screenHeight * 0.015),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'Terms of use | Privacy policy',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
