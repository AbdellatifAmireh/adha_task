import 'package:adha_task/src/features/core/screens/update_details/update_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/colors.dart';
import '../../update_details/update_referal_popup.dart';

Row headline_flag_text_edit_custom(
  BuildContext context, {
  required String title,
  required IconData icon,
  required String? screenName,
  required String? id,
  required String? email,
  required String? service,
  required String? referralName,
  required String? referralNum,
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
          update_referal_popup(
              context, id, email, service, referralName, referralNum);
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
