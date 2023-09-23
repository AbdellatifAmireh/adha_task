import 'package:adha_task/src/features/core/screens/review_details/review_details_screen.dart';
import 'package:flutter/material.dart';

Future<dynamic> popup_success(BuildContext context,
    {String? fieldText, String? service}) {
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
                  //Get.offAll(ProfileScreen());
                  Navigator.pop(context);
                },
              ),
            ]),
            Center(
                child: Text("$fieldText Changed Successfully",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ))),
            SizedBox(height: 80),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ReviewDetailsScreen(service: service)),
                    );
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
