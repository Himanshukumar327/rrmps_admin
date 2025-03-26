import 'package:flutter/material.dart';
import 'package:fluid_dialog/fluid_dialog.dart';
import 'package:get/get.dart';
import 'package:rrmps_admin/views/screens/dashboard_screen/assign_marks_screen.dart';
import 'package:rrmps_admin/views/screens/dashboard_screen/co_co_scholastic_screen.dart';
import 'package:rrmps_admin/views/screens/dashboard_screen/co_scholastic_screen.dart';
import 'package:rrmps_admin/views/screens/dashboard_screen/report_card_screen.dart';
import 'package:rrmps_admin/views/screens/dashboard_screen/update_co_sch_screen.dart';
import 'package:rrmps_admin/views/screens/dashboard_screen/update_marks.dart';
import 'package:rrmps_admin/views/screens/dashboard_screen/view-co_sch_screen.dart';
import 'package:rrmps_admin/views/screens/dashboard_screen/views_marks.dart';
import 'package:rrmps_admin/views/widgets/custom_button.dart';
import 'package:rrmps_admin/views/widgets/dashboard_custom_card.dart';
import 'package:rrmps_admin/views/widgets/dashborad_drawer_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double titleFontSize = screenWidth * 0.06;
    double subtitleFontSize = screenWidth * 0.045;
    double cardWidth = screenWidth * 0.3;
    return Scaffold(
      drawer: DashboardCustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Admin Dashboard',
          style: TextStyle(
            fontSize: titleFontSize,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Your notification logic
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Open the custom fluid dialog when profile icon is clicked
              _showProfileDialog(context);
            },
          ),
        ],
      ),
      backgroundColor: Color(0xfff4f6fc),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dashboard",
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Assign",
                style: TextStyle(
                  fontSize: subtitleFontSize,
                ),
              ),
              SizedBox(height: 16.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Get.to(() => DashBoardAssignMarks());

                      },
                      child: DashboardCustomCard(
                        color: Color(0xff1572e8),
                        icon: Icons.groups,
                        title: "Assign Marks",
                        titleStyle: TextStyle(color: Colors.blueAccent),
                        subtitle: "1 To 10",
                        subTitleStyle: TextStyle(
                            fontSize: subtitleFontSize,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Get.to(()=> CoCoScholasticScreen());
                      },
                      child: DashboardCustomCard(
                        color: Color(0xff48abf7),
                        icon: Icons.mark_email_read_sharp,
                        title: "Co-Scholastic Marks",
                        subtitle: "1 To 10",
                        subTitleStyle: TextStyle(
                            fontSize: subtitleFontSize,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Get.to(()=>CoScholasticScreen());
                      },
                      child: DashboardCustomCard(
                        color: Color(0xff31ce36),
                        icon: Icons.no_stroller_sharp,
                        title: "Co-Scholastic Marks",
                        subtitle: "LKG UKG",
                        subTitleStyle: TextStyle(
                            fontSize: subtitleFontSize,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                "View",
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        Get.to(()=>ViewsMarksScreen());
                      },
                      child: DashboardCustomCard(
                        color: Color(0xff1572e8),
                        icon: Icons.groups,
                        subtitle: "View Marks",
                        subTitleStyle: TextStyle(
                            color: Colors.blueAccent, fontWeight: FontWeight.bold),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Get.to(()=> ViewCoSchScreen());
                      },
                      child: DashboardCustomCard(
                        color: Color(0xff48abf7),
                        icon: Icons.mark_email_read_sharp,
                        subtitle: "View CO-SCH Marks",
                        subTitleStyle: TextStyle(
                            color: Colors.blueAccent, fontWeight: FontWeight.bold),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Get.to(()=>ViewReportCard());
                      },
                      child: DashboardCustomCard(
                        color: Color(0xff6861ce),
                        icon: Icons.check_circle_outline,
                        subtitle: "Report Card",
                        titleStyle: TextStyle(
                            color: Colors.blueAccent, fontWeight: FontWeight.bold),
                        subTitleStyle: TextStyle(
                            color: Colors.blueAccent, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                "Update",
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        Get.to(()=> UpdateMarksScreen());
                      },
                      child: DashboardCustomCard(
                        color: Color(0xff1572e8),
                        icon: Icons.groups,
                        subtitle: "Update Marks",
                        subTitleStyle: TextStyle(
                            fontSize: subtitleFontSize,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Get.to(()=> UpdateCoScholasticScreen());
                      },
                      child: DashboardCustomCard(
                        color: Color(0xff48abf7),
                        icon: Icons.mark_email_read_sharp,
                        subtitle: "Update CO-SCH Marks",
                        subTitleStyle: TextStyle(
                            fontSize: subtitleFontSize,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }

  void _showProfileDialog(BuildContext context) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var storeEmail = prefs.get("admin_email");
    showDialog(
      barrierDismissible: true, // Allows dismissing the dialog by tapping outside
      context: context,
      builder: (context) {
        return FluidDialog(
          rootPage: FluidDialogPage(
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Makes the dialog content take only the space it needs
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(color:Colors.pink.shade50,child: IconButton(onPressed: (){
                                Get.back();
                              }, icon:   Icon(Icons.close,color: Colors.red,)))
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(borderRadius:BorderRadius.circular(30) ),
                                child: Image.asset("assets/images/profile_pic.png"),
                              ),
                              SizedBox(width: 30,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  Text(
                                    'John Doe',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 40,),
                                  Text(
                                    '$storeEmail',
                                    style: TextStyle(fontSize: 14, color: Colors.grey),
                                  ),
                                  CustomButton(buttonText: "View Profile",
                                      color: Color(0xff6861ce),
                                      height: 40,
                                      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                                      textStyle: TextStyle(color: Colors.white),
                                      onPressed: (){

                                      })
                                ],
                              )
                            ],
                          ),

                        ],
                      ),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 15.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Divider(),
                          SizedBox(height: 5,),
                          Text("My Profile"),
                          SizedBox(height: 5,),
                          Divider(),
                          SizedBox(height: 5,),
                          Text("Account Setting"),
                          SizedBox(height: 5,),
                          Divider(),
                          SizedBox(height: 5,),
                          InkWell(onTap: (){},child: Text("Log Out")),
                          SizedBox(height: 5,),
                        ],
                     ),
                   )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

}
