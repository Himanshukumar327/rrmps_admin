import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rrmps_admin/views/screens/dashboard_view/dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {

  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;

  Future<void> login() async {
    isLoading.value = true;
    var headers = {
      'Accept': 'application/json',
      'Authorization': '6|Yp8L4QmLRLGdK8pE0M3PmL5TmEAJwTVIuirOp10f80b34afd',
    };
    var body = {
      'email': email.value,
      'password': password.value,
    };

    try {
      var response = await http.post(
        Uri.parse('https://admin.crjgrouptech.com/public/index.php/api/admin/login'),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);
        var adminEmailId = responseBody['admin_email'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('admin_email', adminEmailId);
        Get.snackbar('Successfully', 'Login Successfully');
        Get.offAll(()=> DashboardScreen());
      } else {
        Get.snackbar('Login Failed', 'Please check your Email & Password');
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong, please try again.');
    } finally {
      isLoading.value = false;
    }
  }
}
