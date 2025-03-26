import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rrmps_admin/views/screens/dashboard_screen/report_card_screen.dart';
import 'package:rrmps_admin/views/screens/dashboard_screen/update_marks.dart';
import 'package:rrmps_admin/views/screens/dashboard_view/dashboard_screen.dart';
import 'package:rrmps_admin/views/screens/dreawer_screen/administration/add_admin_screen.dart';
import 'package:rrmps_admin/views/screens/dreawer_screen/administration/admin_list.dart';
import 'package:rrmps_admin/views/screens/dreawer_screen/complete_report_card/add_co_sch_marks_screen.dart';
import 'package:rrmps_admin/views/screens/dreawer_screen/complete_report_card/add_lkg_ukg_marks.dart';
import 'package:rrmps_admin/views/screens/dreawer_screen/complete_report_card/co_sch_subject_list.dart';
import 'package:rrmps_admin/views/screens/dreawer_screen/complete_report_card/co_scholastic_subject_screen.dart';
import 'package:rrmps_admin/views/screens/dreawer_screen/complete_report_card/student_attandance_screen.dart';
import 'package:rrmps_admin/views/screens/dreawer_screen/complete_report_card/student_total_attandance.dart';
import 'package:rrmps_admin/views/screens/dreawer_screen/complete_report_card/update_co_marks_screen.dart';
import 'package:rrmps_admin/views/screens/dreawer_screen/complete_report_card/view_co_sch_marks.dart';
import 'package:rrmps_admin/views/screens/dreawer_screen/examanation/add_subject_for_exam_screen.dart';
import 'package:rrmps_admin/views/screens/dreawer_screen/examanation/assign_marks.dart';
import 'package:rrmps_admin/views/screens/dreawer_screen/examanation/create_exam.dart';
import 'package:rrmps_admin/views/screens/dreawer_screen/examanation/edit_exam.dart';
import 'package:rrmps_admin/views/screens/dreawer_screen/examanation/edit_subject_for_exam.dart';
import 'package:rrmps_admin/views/screens/dreawer_screen/examanation/report_marks_list_screen.dart';
import 'package:rrmps_admin/views/screens/dreawer_screen/examanation/report_marks_screen.dart';
import 'package:rrmps_admin/views/screens/dreawer_screen/examanation/second_edit_exam.dart';
import 'package:rrmps_admin/views/screens/dreawer_screen/examanation/view_marks.dart';
import 'package:rrmps_admin/views/screens/dreawer_screen/setup/add_time_table_screen.dart';
import 'package:rrmps_admin/views/screens/dreawer_screen/setup/institute_details.dart';
import 'package:rrmps_admin/views/screens/dreawer_screen/setup/student_attandance.dart';
import 'package:rrmps_admin/views/screens/dreawer_screen/setup/student_profile.dart';
import 'package:rrmps_admin/views/screens/dreawer_screen/setup/view_student_details.dart';

class DashboardCustomDrawer extends StatelessWidget {
  const DashboardCustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double titleFontSize = screenWidth * 0.05;
    double subTitleFontSize = screenWidth * 0.04;
    double iconSize = screenWidth * 0.07;

    return Drawer(
      child: Container(
        color: Color(0xFF1A1F36),
        child: ListView(
          children: [
            // Drawer Header
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  color: Color(0xFF1A1F36),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/school_logo.png',
                        height: screenHeight * 0.1,
                      ),
                      SizedBox(width: screenWidth * 0.05),
                      Text(
                        "Dashboard",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: titleFontSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Dashboard
            DrawerTile(
              icon: Icons.home,
              title: 'Dashboard',
              onTap: () {
               Get.offAll(()=>DashboardScreen());
              },
              fontSize: subTitleFontSize,
              iconSize: iconSize,
            ),
            // Administration
            DrawerExpandableTile(
              icon: Icons.layers,
              title: 'Administration',
              fontSize: subTitleFontSize,
              iconSize: iconSize,
              children: [
                SubDrawerTile(
                  title: '• Add Admin',
                  onTap: () {
                    Get.to(()=> AddAdminScreen());
                  },
                  fontSize: subTitleFontSize,
                ),
                SubDrawerTile(
                  title: '• Admin List',
                  onTap: () {
                    Get.to(()=> AdminList());
                  },
                  fontSize: subTitleFontSize,
                ),
              ],
            ),
            // Setup
            DrawerExpandableTile(
              icon: Icons.grid_view,
              title: 'Setup',
              fontSize: subTitleFontSize,
              iconSize: iconSize,
              children: [
                SubDrawerTile(
                  title: '• Institute Details',
                  onTap: () {
                    Get.to(()=> InstituteDetails());
                  },
                  fontSize: subTitleFontSize,
                ),
                SubDrawerTile(
                  title: '• Student Profile',
                  onTap: () {
                    Get.to(()=> StudentProfileScreen());
                  },
                  fontSize: subTitleFontSize,
                ),
                SubDrawerTile(
                  title: '• View Student Details',
                  onTap: () {
                    Get.to(()=> ViewStudentDetailsScreen());
                  },
                  fontSize: subTitleFontSize,
                ),
                SubDrawerTile(
                  title: '• Student Attendance',
                  onTap: () {
                    Get.to(()=>StudentAttendanceScreen());
                  },
                  fontSize: subTitleFontSize,
                ),
                SubDrawerTile(
                  title: '• Add Time Table',
                  onTap: () {
                  Get.to(()=> AddTimetableScreen());
                  },
                  fontSize: subTitleFontSize,
                ),
              ],
            ),
            // Examination
            DrawerExpandableTile(
              icon: Icons.location_on,
              title: 'Examination',
              fontSize: subTitleFontSize,
              iconSize: iconSize,
              children: [
                SubDrawerTile(
                  title: '• Create Exam',
                  onTap: () {
                    Get.to(()=> CreateExam());
                  },
                  fontSize: subTitleFontSize,
                ),
                SubDrawerTile(
                  title: '• Edit Exam',
                  onTap: () {
                    Get.to(()=>EditExam());
                  },
                  fontSize: subTitleFontSize,
                ),
                SubDrawerTile(
                  title: '• Edit Exam',
                  onTap: () {
                  Get.to(()=>SecondEditExam());
                  },
                  fontSize: subTitleFontSize,
                ),
                SubDrawerTile(
                  title: '• Add Subject For Exam',
                  onTap: () {
                    Get.to(()=> AddSubjectForExamScreen());
                  },
                  fontSize: subTitleFontSize,
                ),
                SubDrawerTile(
                  title: '• Edit Subject For Exam',
                  onTap: () {
                    Get.to(()=> EditSubjectForExamScreen());
                  },
                  fontSize: subTitleFontSize,
                ),
                SubDrawerTile(
                  title: '• Assign Mark',
                  onTap: () {
                    Get.to(()=> AssignMarksScreen());
                  },
                  fontSize: subTitleFontSize,
                ),
                SubDrawerTile(
                  title: '• View Mark',
                  onTap: () {
                    Get.to(()=> ViewMarksScreen());
                  },
                  fontSize: subTitleFontSize,
                ),
                SubDrawerTile(
                  title: '• Update Mark',
                  onTap: () {
                    Get.to(()=> UpdateMarksScreen());
                  },
                  fontSize: subTitleFontSize,
                ),
                SubDrawerTile(
                  title: '• Report Mark',
                  onTap: () {
                    Get.to(()=>ReportMarksScreen());
                  },
                  fontSize: subTitleFontSize,
                ),
                SubDrawerTile(
                  title: '• Report Mark List',
                  onTap: () {
                    Get.to(()=> ReportMarksListScreen());
                  },
                  fontSize: subTitleFontSize,
                ),
              ],
            ),
            // Complete Report Cards
            DrawerExpandableTile(
              icon: Icons.school,
              title: 'Complete Report Cards',
              fontSize: subTitleFontSize,
              iconSize: iconSize,
              children: [
                SubDrawerTile(
                  title: '• Student Total Attendance',
                  onTap: () {
                    Get.to(()=> StudentTotalAttendanceScreen());
                  },
                  fontSize: subTitleFontSize,
                ),
                SubDrawerTile(
                  title: '• Student Attendance List',
                  onTap: () {
                    Get.to(()=> StudentAttendanceList());
                  },
                  fontSize: subTitleFontSize,
                ),
                SubDrawerTile(
                  title: '• CO-SCHOLASTIC Subject',
                  onTap: () {
                    Get.to(()=> CoScholasticSubjectScreen());
                  },
                  fontSize: subTitleFontSize,
                ),
                SubDrawerTile(
                  title: '• CO-SCH Subject List',
                  onTap: () {
                    Get.to(()=> CoSchSubjectList());
                  },
                  fontSize: subTitleFontSize,
                ),
                SubDrawerTile(
                  title: '• Add CO-SCH Marks',
                  onTap: () {
                    Get.to(()=> AddCoSchMarksScreen());
                  },
                  fontSize: subTitleFontSize,
                ),
                SubDrawerTile(
                  title: '• View CO-SCH Marks',
                  onTap: () {
                    Get.to(()=>ViewCoSchMarks());
                  },
                  fontSize: subTitleFontSize,
                ),
                SubDrawerTile(
                  title: '• Update CO-SCH Marks',
                  onTap: () {
                    Get.to(()=> UpdateCoSchMarksScreen());
                  },
                  fontSize: subTitleFontSize,
                ),
                SubDrawerTile(
                  title: '• Add LKG&UKG Marks',
                  onTap: () {
                  Get.to(()=> AddLKGUKGMarksScreen());
                  },
                  fontSize: subTitleFontSize,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final double fontSize;
  final double iconSize;

  const DrawerTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.fontSize,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white, size: iconSize),
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: fontSize),
      ),
      onTap: onTap,
    );
  }
}

class DrawerExpandableTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<Widget> children;
  final double fontSize;
  final double iconSize;

  const DrawerExpandableTile({
    super.key,
    required this.icon,
    required this.title,
    required this.children,
    required this.fontSize,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Icon(icon, color: Colors.white, size: iconSize),
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: fontSize),
      ),
      iconColor: Colors.white,
      collapsedIconColor: Colors.white,
      children: children,
    );
  }
}

class SubDrawerTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double fontSize;

  const SubDrawerTile({super.key,
    required this.title,
    required this.onTap,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.white70, fontSize: fontSize),
        ),
        onTap: onTap,
      ),
    );
  }
}
