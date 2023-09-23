import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';

Row subline_title_value({required String title, required String? value}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "$title",
        style: TextStyle(
          fontSize: 16,
          color: tGrey,
        ),
      ),
      Text(
        "$value",
        style:
            TextStyle(fontSize: 16, color: tGrey, fontWeight: FontWeight.bold),
      ),
    ],
  );
}
