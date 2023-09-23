import 'package:adha_task/src/features/core/models/application_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../repository/application_repository/application_repository.dart';
import '../../../repository/authentication_repository/authentication_repository.dart';

class ApplicationController extends GetxController {
  static ApplicationController get instance => Get.find();

//To Get data from fields form
  final email = TextEditingController();
  final serviceType = TextEditingController();
  final serviceLocation = TextEditingController();
  final fullname = TextEditingController();
  final emiratesId = TextEditingController();
  final birthday = TextEditingController();
  final martialStatus = TextEditingController();
  final primaryNum = TextEditingController();
  final alternativeNum = TextEditingController();
  final town = TextEditingController();
  final familyNum = TextEditingController();
  final numberOfWifes = TextEditingController();
  final numberOfChildren = TextEditingController();
  final employmentStatus = TextEditingController();
  final empoloyerName = TextEditingController();
  final salary = TextEditingController();
  final propertyIncome1 = TextEditingController();
  final propertyIncome2 = TextEditingController();
  final monthlyGrossIncome = TextEditingController();
  final estimatedLoanAmount = TextEditingController();

// To get Email from current logged in user
  final _authRepo = Get.put(AuthenticationRepository());
  final _appRepo = Get.put(ApplicationRepository());

//Get User Email and pass to ApplicationRepository to fetch user record.
  getApplicationData() {
    final email = _authRepo.firebaseUser.value?.email;
    print("EMAAAL $email");
    if (email != null) {
      return _appRepo.getApplicationDetails(email);
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }

  updateApplicationData(ApplicationModel applicationModel) async {
    await _appRepo.updateApplicationDetails(applicationModel);
  }
}
