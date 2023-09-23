import 'package:adha_task/src/features/authentication/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/core/models/application_model.dart';

class ApplicationRepository extends GetxController {
  static ApplicationRepository get instance => Get.find();

  //Implement all CRUD here for the Application Screen

  final _db = FirebaseFirestore.instance;

//Fetch application data from Firebase collection with email
  Future<ApplicationModel> getApplicationDetails(String email) async {
    final snapshot =
        await _db.collection("users").where("Email", isEqualTo: email).get();
    final applicationData =
        snapshot.docs.map((e) => ApplicationModel.fromSnapshot(e)).single;
    print("EMAAAL 3 $applicationData");
    return applicationData;
  }

  //Update application data from Firebase collection with email
  Future<void> updateApplicationDetails(
      ApplicationModel applicationModel) async {
    print("EMAAAL 123 ${applicationModel.id}");
    await _db
        .collection("users")
        .doc(applicationModel.id)
        .update(applicationModel.toJson());
  }
}
