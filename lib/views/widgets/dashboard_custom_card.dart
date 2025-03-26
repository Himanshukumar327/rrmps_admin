// custom_card.dart

import 'package:flutter/material.dart';

class DashboardCustomCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String? title;
  final String? subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;

  const DashboardCustomCard({
    required this.color,
    required this.icon,
     this.title,
    this.subtitle,
    this.titleStyle,
    this.subTitleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      // width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: Offset(3, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          SizedBox(width: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                Text(
                  title!,
                  style: titleStyle,
                ),
                SizedBox(height: 5),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: subTitleStyle,
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
