import 'package:adha_task/src/constants/text_strings.dart';
import 'package:adha_task/src/features/core/screens/update_details/widgets/locations_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../common_widgets/popup/popup_success.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../../../repository/authentication_repository/authentication_repository.dart';
import '../../controllers/application_controller.dart';
import '../../models/application_model.dart';
import '../review_details/widgets/custom_devider.dart';
import 'widgets/headline_flag_text.dart';

class UpdateDetailsScreen extends StatefulWidget {
  String? service;
  UpdateDetailsScreen({super.key, required this.service});

  @override
  State<UpdateDetailsScreen> createState() => _UpdateDetailsScreenState();
}

class _UpdateDetailsScreenState extends State<UpdateDetailsScreen> {
  String? selectedValue = null;

  //final controller = Get.put(SignupController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ApplicationController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Update Application",
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
      backgroundColor: Color.fromARGB(255, 240, 240, 238),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          // Future Builder to load cloud data
          child: FutureBuilder(
            future: controller.getApplicationData(),
            builder: (context, snapshot) {
              //Data is completely fetched
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  ApplicationModel applicationData =
                      snapshot.data as ApplicationModel;

                  //To Get data from fields form
                  final id = TextEditingController(text: applicationData.id);
                  final email =
                      TextEditingController(text: applicationData.email);
                  final serviceType = TextEditingController(
                      text: widget.service ?? applicationData.serviceType);
                  final serviceLocation = TextEditingController(
                      text: applicationData.serviceLocation);
                  final fullname =
                      TextEditingController(text: applicationData.fullname);
                  final emiratesId =
                      TextEditingController(text: applicationData.emiratesId);
                  final birthday =
                      TextEditingController(text: applicationData.birthday);
                  final martialStatus = TextEditingController(
                      text: applicationData.martialStatus);
                  final primaryNum =
                      TextEditingController(text: applicationData.primaryNum);
                  final alternativeNum = TextEditingController(
                      text: applicationData.alternativeNum);
                  final referralName =
                      TextEditingController(text: applicationData.referralName);
                  final referralNum =
                      TextEditingController(text: applicationData.referralNum);
                  final town =
                      TextEditingController(text: applicationData.town);
                  final familyNum =
                      TextEditingController(text: applicationData.familyNum);
                  final numberOfWifes = TextEditingController(
                      text: applicationData.numberOfWifes.toString());
                  final numberOfChildren = TextEditingController(
                      text: applicationData.numberOfChildren.toString());
                  final employmentStatus = TextEditingController(
                      text: applicationData.employmentStatus);
                  final empoloyerName = TextEditingController(
                      text: applicationData.empoloyerName);
                  final salary = TextEditingController(
                      text: applicationData.salary.toString());
                  final propertyIncome1 = TextEditingController(
                      text: applicationData.propertyIncome1.toString());
                  final propertyIncome2 = TextEditingController(
                      text: applicationData.propertyIncome2.toString());
                  final monthlyGrossIncome = TextEditingController(
                      text: applicationData.monthlyGrossIncome.toString());
                  final estimatedLoanAmount = TextEditingController(
                      text: applicationData.estimatedLoanAmount.toString());

                  return Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: tSizedBoxHeight),
                            headline_flag_text(
                              icon: Icons.flag_outlined,
                              title: "Service Details",
                            ),
                            SizedBox(height: tSizedBoxHeight),
                            TextFormField(
                              controller: serviceType,
                              decoration: InputDecoration(
                                  labelText: tServiceType,
                                  hintText: tServiceType),
                              // initialValue:
                              //     widget.service ?? applicationData.serviceType,
                            ),
                            SizedBox(height: tSizedBoxHeight),
                            DropdownButtonFormField(
                                hint: Text("Service Location"),
                                items: locationsDropdownItems,
                                value: selectedValue =
                                    applicationData.serviceLocation,
                                validator: (value) =>
                                    value == null ? "Select a country" : null,
                                onChanged: (String? newValue) {
                                  selectedValue = newValue!;
                                }),
                            /* TextFormField(
                        //controller: controller.fullName,
                        decoration: InputDecoration(
                            //prefixIcon: Icon(Icons.person_outline_outlined),
                            labelText: tServiceLocation,
                            hintText: tServiceLocation),
                        //initialValue: service ?? "",
                      ), */
                            SizedBox(height: tSizedBoxHeight),
                            customDevider(),
                            SizedBox(height: tSizedBoxHeight),
                            headline_flag_text(
                              icon: Icons.person_pin_outlined,
                              title: "Personal Details",
                            ),
                            SizedBox(height: tSizedBoxHeight),
                            TextFormField(
                              controller: fullname,
                              decoration: InputDecoration(
                                  labelText: tFullName, hintText: tFullName),
                              //initialValue: applicationData.fullname,
                            ),
                            SizedBox(height: tSizedBoxHeight),
                            TextFormField(
                              controller: emiratesId,
                              decoration: InputDecoration(
                                  labelText: tEmiratesID,
                                  hintText: tEmiratesID),
                              // initialValue: applicationData.emiratesId,
                            ),
                            SizedBox(height: tSizedBoxHeight),
                            TextFormField(
                              controller: birthday,
                              decoration: InputDecoration(
                                  labelText: tBirthday, hintText: "22/9/2023"),
                              // initialValue: applicationData.birthday,
                            ),
                            SizedBox(height: tSizedBoxHeight),
                            TextFormField(
                              controller: martialStatus,
                              decoration: InputDecoration(
                                  labelText: tMartialStatus,
                                  hintText: tMartialStatus),
                              // initialValue: applicationData.martialStatus,
                            ),
                            SizedBox(height: tSizedBoxHeight),
                            customDevider(),
                            SizedBox(height: tSizedBoxHeight),
                            headline_flag_text(
                              icon: Icons.phone_iphone,
                              title: "Contact Information",
                            ),
                            SizedBox(height: tSizedBoxHeight),
                            IntlPhoneField(
                              initialCountryCode: 'AE',
                              controller: primaryNum,
                              decoration: InputDecoration(
                                  labelText: tPrimaryContactNumber,
                                  hintText: tPrimaryContactNumber),
                              // initialValue: applicationData.primaryNum,
                            ),
                            SizedBox(height: tSizedBoxHeight),
                            IntlPhoneField(
                              initialCountryCode: 'AE',
                              controller: alternativeNum,
                              decoration: InputDecoration(
                                  labelText: tAlternativeContactNumber,
                                  hintText: tAlternativeContactNumber),
                              // initialValue: applicationData.alternativeNum,
                            ),
                            SizedBox(height: tSizedBoxHeight),
                            TextFormField(
                              controller: referralName,
                              decoration: InputDecoration(
                                  labelText: tReferralName,
                                  hintText: tReferralName),
                              // initialValue:
                              //     applicationData.numberOfChildren.toString(),
                            ),
                            SizedBox(height: tSizedBoxHeight),
                            IntlPhoneField(
                              initialCountryCode: 'AE',
                              controller: referralNum,
                              decoration: InputDecoration(
                                  labelText: tReferralNumber,
                                  hintText: tReferralNumber),
                              // initialValue: applicationData.alternativeNum,
                            ),
                            SizedBox(height: tSizedBoxHeight),
                            customDevider(),
                            SizedBox(height: tSizedBoxHeight),
                            headline_flag_text(
                              icon: Icons.home_outlined,
                              title: "Family Book Details",
                            ),
                            SizedBox(height: tSizedBoxHeight),
                            TextFormField(
                              controller: town,
                              decoration: InputDecoration(
                                  labelText: tTown, hintText: tTown),
                              // initialValue: applicationData.town,
                            ),
                            SizedBox(height: tSizedBoxHeight),
                            IntlPhoneField(
                              initialCountryCode: 'AE',
                              controller: familyNum,
                              decoration: InputDecoration(
                                  labelText: tFamilyNumber,
                                  hintText: tFamilyNumber),
                              // initialValue: applicationData.familyNum,
                            ),
                            SizedBox(height: tSizedBoxHeight),
                            TextFormField(
                              controller: numberOfWifes,
                              decoration: InputDecoration(
                                  labelText: tNumberWife,
                                  hintText: tNumberWife),
                              keyboardType: TextInputType.number,
                              // initialValue:
                              //     applicationData.numberOfWifes.toString(),
                            ),
                            SizedBox(height: tSizedBoxHeight),
                            TextFormField(
                              controller: numberOfChildren,
                              decoration: InputDecoration(
                                  labelText: tNumberChildren,
                                  hintText: tNumberChildren),
                              keyboardType: TextInputType.number,
                              // initialValue:
                              //     applicationData.numberOfChildren.toString(),
                            ),
                            SizedBox(height: tSizedBoxHeight),
                            customDevider(),
                            SizedBox(height: tSizedBoxHeight),
                            headline_flag_text(
                              icon: Icons.work_outline,
                              title: "Employment Details",
                            ),
                            SizedBox(height: tSizedBoxHeight),
                            TextFormField(
                              controller: employmentStatus,
                              decoration: InputDecoration(
                                  labelText: tEmploymentStatus,
                                  hintText: tEmploymentStatus),
                              // initialValue: applicationData.employmentStatus,
                            ),
                            SizedBox(height: tSizedBoxHeight),
                            TextFormField(
                              controller: empoloyerName,
                              decoration: InputDecoration(
                                  labelText: tEmployerName,
                                  hintText: tEmployerName),
                              // initialValue: applicationData.empoloyerName,
                            ),
                            SizedBox(height: tSizedBoxHeight),
                            TextFormField(
                              controller: salary,
                              decoration: InputDecoration(
                                  labelText: tSalary,
                                  hintText: tSalary,
                                  suffixText: 'AED'),
                              keyboardType: TextInputType.number,
                              // initialValue: applicationData.salary.toString(),
                            ),
                            SizedBox(height: tSizedBoxHeight),
                            customDevider(),
                            SizedBox(height: tSizedBoxHeight),
                            headline_flag_text(
                              icon: Icons.add_home_work_outlined,
                              title: "Rental Property Income",
                            ),
                            SizedBox(height: tSizedBoxHeight),
                            TextFormField(
                              controller: propertyIncome1,
                              decoration: InputDecoration(
                                  labelText: tPropertyName1,
                                  hintText: tPropertyName1,
                                  suffixText: 'AED'),
                              keyboardType: TextInputType.number,
                              // initialValue:
                              //     applicationData.propertyIncome1.toString(),
                            ),
                            SizedBox(height: tSizedBoxHeight),
                            TextFormField(
                              controller: propertyIncome2,
                              decoration: InputDecoration(
                                  labelText: tPropertyName2,
                                  hintText: tPropertyName2,
                                  suffixText: 'AED'),
                              keyboardType: TextInputType.number,
                              // initialValue:
                              //     applicationData.propertyIncome2.toString(),
                            ),
                            SizedBox(height: tSizedBoxHeight),
                            customDevider(),
                            SizedBox(height: tSizedBoxHeight),
                            headline_flag_text(
                              icon: Icons.monetization_on_outlined,
                              title: "Income Details",
                            ),
                            SizedBox(height: tSizedBoxHeight),
                            TextFormField(
                              controller: monthlyGrossIncome,
                              decoration: InputDecoration(
                                  labelText: tMonthlyGrossIncome,
                                  hintText: tMonthlyGrossIncome,
                                  suffixText: 'AED'),
                              keyboardType: TextInputType.number,
                              // initialValue: applicationData.monthlyGrossIncome,
                            ),
                            SizedBox(height: tSizedBoxHeight),
                            TextFormField(
                              controller: estimatedLoanAmount,
                              decoration: InputDecoration(
                                  labelText: tEstimatedLoanAmount,
                                  hintText: tEstimatedLoanAmount,
                                  suffixText: 'AED'),
                              keyboardType: TextInputType.number,
                              // initialValue: applicationData.estimatedLoanAmount
                              //     .toString(),
                            ),
                            SizedBox(height: tSizedBoxHeight),
                            ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    final applicationData = ApplicationModel(
                                      id: id.text,
                                      email: email.text.trim(),
                                      serviceType: serviceType.text.trim(),
                                      serviceLocation: selectedValue,
                                      fullname: fullname.text.trim(),
                                      emiratesId: emiratesId.text.trim(),
                                      birthday: birthday.text.trim(),
                                      martialStatus: martialStatus.text.trim(),
                                      primaryNum: primaryNum.text.trim(),
                                      alternativeNum:
                                          alternativeNum.text.trim(),
                                      referralName: referralName.text.trim(),
                                      referralNum: referralNum.text.trim(),
                                      town: town.text.trim(),
                                      familyNum: familyNum.text.trim(),
                                      numberOfWifes:
                                          int.parse(numberOfWifes.text.trim()),
                                      numberOfChildren: int.parse(
                                          numberOfChildren.text.trim()),
                                      employmentStatus:
                                          employmentStatus.text.trim(),
                                      empoloyerName: empoloyerName.text.trim(),
                                      salary: int.parse(salary.text.trim()),
                                      propertyIncome1: int.parse(
                                          propertyIncome1.text.trim()),
                                      propertyIncome2: int.parse(
                                          propertyIncome2.text.trim()),
                                      monthlyGrossIncome: int.parse(
                                          monthlyGrossIncome.text.trim()),
                                      estimatedLoanAmount: int.parse(
                                          estimatedLoanAmount.text.trim()),
                                    );

                                    await controller
                                        .updateApplicationData(applicationData);
                                    popup_success(context,
                                        fieldText: "Your Application",
                                        service: serviceType.text);
                                  }
                                },
                                child: Text("Update")),
                            SizedBox(height: tSizedBoxHeight),
                          ],
                        ),
                      )
                    ],
                  );
                } else if (snapshot.hasError) {
                  //return Center(child: Text(snapshot.error.toString()));
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return const Center(child: Text('Something went wrong'));
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
