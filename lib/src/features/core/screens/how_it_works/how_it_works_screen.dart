// ignore_for_file: must_be_immutable

import 'package:adha_task/src/features/core/screens/review_details/review_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../../../repository/authentication_repository/authentication_repository.dart';
import 'widgets/service_description_details.dart';

class HowItWorksScreen extends StatelessWidget {
  String? service;
  HowItWorksScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "How it Works Screen",
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
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(serviceDescriptionDetails(service),
                  style: Theme.of(context).textTheme.headlineMedium),
            ),
            SizedBox(height: tSizedBoxHeight),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(ReviewDetailsScreen(service: service));
                  },
                  child: Text("Apply Now")),
            ),
          ],
        ),
      ),
    );
  }
}
