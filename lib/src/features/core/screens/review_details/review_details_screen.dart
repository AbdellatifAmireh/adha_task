import 'package:adha_task/src/features/core/screens/update_details/update_details_screen.dart';
import 'package:adha_task/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../controllers/application_controller.dart';
import '../../models/application_model.dart';
import 'widgets/circular_progress_indicator_custom.dart';
import 'widgets/custom_devider.dart';
import 'widgets/headline_flag_text_edit.dart';
import 'widgets/headline_flag_text_edit_custom.dart';
import 'widgets/subline_text_edit.dart';

class ReviewDetailsScreen extends StatelessWidget {
  String? service;
  ReviewDetailsScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ApplicationController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "1/11 Application Submission",
        ),
        backgroundColor: tPrimaryColor,
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                AuthenticationRepository.instance.logout();
              },
              child: Text("Logout")),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: FutureBuilder(
                  future: controller.getApplicationData(),
                  builder: (context, snapshot) {
                    //Data is completely fetched
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        ApplicationModel applicationData =
                            snapshot.data as ApplicationModel;
                        return Column(
                          children: [
                            // Text(
                            //   "1/11 Application Submission",
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text("Review Details",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium),
                                    Text(
                                      "Please confirm personal details",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: tGrey,
                                      ),
                                    ),
                                  ],
                                ),
                                circularProgressIndicatorCustom(),
                              ],
                            ),
                            SizedBox(height: tSizedBoxHeight),
                            Text(
                              "We have pre-filled your application. If everything looks good, please proceed with application or you can raise a concern regarding the error detected",
                              style: TextStyle(
                                fontSize: 14,
                                color: tGrey,
                              ),
                            ),

                            SizedBox(height: tSizedBoxHeight),
                            customDevider(),

                            headline_flag_text_edit(
                                icon: Icons.flag_outlined,
                                title: "Service Details",
                                screenName: service),
                            subline_title_value(
                                title: "Service Type",
                                value: applicationData.serviceType ?? service),
                            subline_title_value(
                                title: "Service Location",
                                value: applicationData.serviceLocation),

                            SizedBox(height: tSizedBoxHeight),
                            customDevider(),

                            headline_flag_text_edit(
                                icon: Icons.person_pin_outlined,
                                title: "Personal Details",
                                screenName: service),
                            subline_title_value(
                                title: "Full Name",
                                value: applicationData.fullname),
                            subline_title_value(
                                title: "Emirates ID",
                                value: applicationData.emiratesId),
                            subline_title_value(
                                title: "Birthday",
                                value: applicationData.birthday),
                            subline_title_value(
                                title: "Martial Status",
                                value: applicationData.martialStatus),

                            SizedBox(height: tSizedBoxHeight),
                            customDevider(),

                            headline_flag_text_edit(
                                icon: Icons.phone_iphone,
                                title: "Contact Information",
                                screenName: service),
                            subline_title_value(
                                title: "Primary Contact Number",
                                value: "+971 ${applicationData.primaryNum}"),
                            subline_title_value(
                                title: "Alternative Contact Number",
                                value:
                                    "+971 ${applicationData.alternativeNum}"),

                            SizedBox(height: tSizedBoxHeight),
                            headline_flag_text_edit_custom(context,
                                icon: Icons.phone_iphone,
                                title: "Referal Details",
                                screenName: service,
                                id: applicationData.id,
                                email: applicationData.email,
                                service: service,
                                referralName: applicationData.referralName,
                                referralNum: applicationData.referralNum),
                            subline_title_value(
                                title: "Referral Name",
                                value: "${applicationData.referralName}"),
                            subline_title_value(
                                title: "Referral Number",
                                value: "+971 ${applicationData.referralNum}"),

                            SizedBox(height: tSizedBoxHeight),
                            customDevider(),

                            headline_flag_text_edit(
                                icon: Icons.home_outlined,
                                title: "Family Book Details",
                                screenName: service),
                            subline_title_value(
                                title: "Town", value: applicationData.town),
                            subline_title_value(
                                title: "Family Number",
                                value: "+971 ${applicationData.familyNum}"),
                            subline_title_value(
                                title: "Number of Wife(s)",
                                value:
                                    applicationData.numberOfWifes.toString()),
                            subline_title_value(
                                title: "Number of Children",
                                value: applicationData.numberOfChildren
                                    .toString()),

                            SizedBox(height: tSizedBoxHeight),
                            customDevider(),

                            headline_flag_text_edit(
                                icon: Icons.work_outline,
                                title: "Employment Details",
                                screenName: service),
                            subline_title_value(
                                title: "Employment Status",
                                value: applicationData.employmentStatus),
                            subline_title_value(
                                title: "Employer Name",
                                value: applicationData.empoloyerName),
                            subline_title_value(
                                title: "Salary",
                                value: "AED ${applicationData.salary}"),

                            SizedBox(height: tSizedBoxHeight),
                            customDevider(),

                            headline_flag_text_edit(
                                icon: Icons.add_home_work_outlined,
                                title: "Rental Property Income",
                                screenName: service),
                            subline_title_value(
                                title: "Property Income 1",
                                value:
                                    "AED ${applicationData.propertyIncome1}"),
                            subline_title_value(
                                title: "Property Income 2",
                                value:
                                    "AED ${applicationData.propertyIncome2}"),

                            SizedBox(height: tSizedBoxHeight),
                            customDevider(),

                            headline_flag_text_edit(
                                icon: Icons.monetization_on_outlined,
                                title: "Income Details",
                                screenName: service),
                            subline_title_value(
                                title: "Monthly Gross Income",
                                value:
                                    "AED ${applicationData.monthlyGrossIncome}"),
                            subline_title_value(
                                title: "Estimated Loan Amount",
                                value:
                                    "AED ${applicationData.estimatedLoanAmount}"),

                            SizedBox(height: tSizedBoxHeight),

                            Container(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Get.to(
                                        UpdateDetailsScreen(service: service));
                                  },
                                  child: Text("Edit Application")),
                            ),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        //return Center(child: Text(snapshot.error.toString()));
                        return Center(child: Text(snapshot.error.toString()));
                      } else {
                        return const Center(
                            child: Text('Something went wrong'));
                      }
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
          )),
    );
  }
}

//-----
