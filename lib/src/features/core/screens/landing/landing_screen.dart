import 'package:adha_task/src/constants/colors.dart';
import 'package:adha_task/src/constants/sizes.dart';
import 'package:adha_task/src/features/core/screens/how_it_works/how_it_works_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../repository/authentication_repository/authentication_repository.dart';
import 'widgets/services_dropdown.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  String? selectedValue = null;
  final _dropdownFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Landing Screen",
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
        child: Form(
          key: _dropdownFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Choose From List of eligible Services",
                  style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(
                height: tSizedBoxHeight,
              ),
              SizedBox(
                width: double.infinity,
                child: DropdownButtonFormField(
                    hint: Text("Choose a Service"),
                    validator: (value) =>
                        value == null ? "Select a country" : null,
                    value: selectedValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                    items: servicesDropdownItems),
              ),
              SizedBox(height: tSizedBoxHeight),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      if (_dropdownFormKey.currentState!.validate()) {
                        Get.to(HowItWorksScreen(
                          service: selectedValue,
                        ));
                      }
                    },
                    child: Text("More Info")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
