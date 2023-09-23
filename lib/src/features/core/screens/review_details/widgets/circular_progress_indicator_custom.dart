import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';

class circularProgressIndicatorCustom extends StatelessWidget {
  const circularProgressIndicatorCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              width: 50,
              height: 50,
              child: new CircularProgressIndicator(
                strokeWidth: 5,
                value: 0.33,
                color: Color.fromARGB(255, 240, 199, 53),
                backgroundColor: Color.fromARGB(255, 233, 229, 227),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: 15,
            child: Text(
              "1/3",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  color: tGrey,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
