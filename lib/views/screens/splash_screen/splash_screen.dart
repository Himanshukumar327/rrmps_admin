import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rrmps_admin/controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.put(SplashController());

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double logoWidth = screenWidth * 0.6;
    double logoHeight = logoWidth * 0.5;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/background_image.jpg",
            fit: BoxFit.cover,
          ),
          Obx(() {
            if (splashController.isLoading.value) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight * 0.05),
                    Image.asset(
                      "assets/images/school_logo.png",
                      width: logoWidth,
                      height: logoHeight,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    CupertinoActivityIndicator(radius: screenWidth * 0.03),
                  ],
                ),
              );
            } else if (!splashController.isLoading.value &&
                splashController.hasCheckedLogin.value) {
              return Container();
            }
            return Container();
          }),
        ],
      ),
    );
  }
}
