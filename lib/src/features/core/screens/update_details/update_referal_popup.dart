import 'package:adha_task/src/features/core/screens/review_details/review_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../common_widgets/popup/popup_success.dart';
import '../../../../constants/sizes.dart';
import '../../controllers/application_controller.dart';
import '../../models/application_model.dart';

Future<dynamic> update_referal_popup(BuildContext context, String? id,
    String? email, String? service, String? referralName, String? referralNum) {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(ApplicationController());
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
            Text("Edit Referral Details",
                style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: 80),
            // Future Builder to load cloud data
            FutureBuilder(
                future: controller.getApplicationData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      ApplicationModel applicationData =
                          snapshot.data as ApplicationModel;

                      final id =
                          TextEditingController(text: applicationData.id);
                      final referralNameText = TextEditingController(
                          text: applicationData.referralName ?? referralName);
                      final referralNumText = TextEditingController(
                          text: applicationData.referralNum ?? referralNum);
                      return Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextFormField(
                                controller: referralNameText,
                                decoration: InputDecoration(
                                    labelText: "Referral Name",
                                    hintText: "Referal Name"),

                                // initialValue:
                                //     applicationData.propertyIncome2.toString(),
                              ),
                              SizedBox(height: 20),
                              IntlPhoneField(
                                initialCountryCode: 'AE',
                                controller: referralNumText,
                                decoration: InputDecoration(
                                  labelText: "Referral Number",
                                ),
                                // initialValue: applicationData.primaryNum,
                              ),
                            ],
                          ));
                    } else if (snapshot.hasError) {
                      //return Center(child: Text(snapshot.error.toString()));
                      return Center(child: Text(snapshot.error.toString()));
                    } else {
                      return const Center(child: Text('Something went wrong'));
                    }
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
            SizedBox(height: 80),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final applicationData = ApplicationModel(
                        id: id,
                        email: email,
                        referralName: referralName,
                        referralNum: referralNum,
                      );
                      await controller.updateApplicationData(applicationData);
                      popup_success(context,
                          fieldText: "Referral Details", service: service);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: Text("Update")),
            ),
          ],
        ),
      );
    },
  );
}
