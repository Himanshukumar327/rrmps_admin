import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rrmps_admin/views/screens/auth/admin_signing_screen.dart';
import 'package:rrmps_admin/views/screens/dashboard_view/dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  var isLoading = true.obs;
  var hasCheckedLogin = false.obs;


  @override
  void onInit() {
    super.onInit();
    // Delay splash screen for 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      checkLoginStatus();
    });
  }

  Future<void> checkLoginStatus() async {
    // Avoid checking if already done
    if (hasCheckedLogin.value) return;

    // Mark login check as done
    hasCheckedLogin.value = true;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString('admin_email');

    if (savedEmail != null) {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer 21|20T25vtPpdeDCaCSVGZ1x8sY2lBVqZ75wjBFZ5K0c4441038',
      };
      var body = {
        'email': savedEmail,
      };

      try {
        var response = await http.post(
          Uri.parse('https://admin.crjgrouptech.com/public/index.php/api/admin/dashboard'),
          headers: headers,
          body: body,
        );

        if (response.statusCode == 200) {
          var responseBody = json.decode(response.body);

          if (responseBody.containsKey('admin_email')) {
            var adminEmail = responseBody['admin_email'];

            if (savedEmail == adminEmail) {
              // Valid login, navigate to Dashboard
              // Get.snackbar('Success', 'Login verified successfully', backgroundColor: Colors.green, colorText: Colors.white);
              Get.offAll(() => DashboardScreen());
            } else {
              // Email mismatch, navigate to Login screen
              // Get.snackbar('Error', 'Email mismatch, please login again.', backgroundColor: Colors.red, colorText: Colors.white);
              Get.offAll(() => AdminLoginScreen());
            }
          } else {
            // If 'admin_email' key doesn't exist, handle it
            // Get.snackbar('Error', 'Invalid response from server, no admin email found.', backgroundColor: Colors.red, colorText: Colors.white);
            Get.offAll(() => AdminLoginScreen());
          }
        } else {
          // If the response status is not 200, go to Login screen
          // Get.snackbar('Error', 'Failed to verify the email, please try again.', backgroundColor: Colors.red, colorText: Colors.white);
          Get.offAll(() => AdminLoginScreen());
        }
      } catch (e) {
        // Log error details for debugging
        print('Error occurred: $e');
        // Get.snackbar('Error', 'Something went wrong, please try again.', backgroundColor: Colors.red, colorText: Colors.white);
        Get.offAll(() => AdminLoginScreen());
      } finally {
        isLoading.value = false;
      }
    } else {
      // If no saved email, go to login screen immediately
      // Get.snackbar('Error', 'No saved login session found, please login first.', backgroundColor: Colors.red, colorText: Colors.white);
      Get.offAll(() => AdminLoginScreen());
    }
  }
}
