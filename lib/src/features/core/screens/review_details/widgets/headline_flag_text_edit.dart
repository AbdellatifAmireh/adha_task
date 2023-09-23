import 'package:adha_task/src/features/core/screens/update_details/update_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/colors.dart';

Row headline_flag_text_edit({
  required String title,
  required IconData icon,
  required String? screenName,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Icon(
            icon,
            color: tGrey,
          ),
          SizedBox(width: 5),
          Text(
            "$title",
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          )
        ],
      ),
      TextButton(
        onPressed: () {
          Get.to(UpdateDetailsScreen(service: screenName));
        },
        child: Text(
          "edit",
          style: TextStyle(
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    ],
  );
}
