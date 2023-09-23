import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';

Row headline_flag_text({
  required String title,
  required IconData icon,
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
    ],
  );
}
