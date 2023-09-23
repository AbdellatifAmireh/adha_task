import 'package:flutter/material.dart';

Future<dynamic> popup_failed(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Wrap(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              IconButton(
                icon: Icon(
                  Icons.close_rounded,
                ),
                onPressed: () {
                  //Get.offAll(LandingScreen());
                  Navigator.pop(context);
                },
              ),
            ]),
            Center(
                child: Text("Opps! something went wrong, please try again",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold))),
            SizedBox(height: 80),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    //Get.offAll(LandingScreen());
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: Text("Okay")),
            ),
          ],
        ),
      );
    },
  );
}
