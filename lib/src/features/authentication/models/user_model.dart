import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String? email;

  //Service Details
  final String? serviceType;
  final String? serviceLocation;

//Personal Details
  final String? fullname;
  final String? emiratesId;
  final String? birthday; //date
  final String? martialStatus;

//Contact Information
  final String? primaryNum;
  final String? alternativeNum;
  final String? referralName;
  final String? referralNum;

//Family Book Details
  final String? town;
  final String? familyNum;
  final int? numberOfWifes;
  final int? numberOfChildren;

//Employment Details
  final String? employmentStatus; //dropdown
  final String? empoloyerName;
  final int? salary;

//Rental Income
  final int? propertyIncome1;
  final int? propertyIncome2;

//Income Details
  final int? monthlyGrossIncome;
  final int? estimatedLoanAmount;

  const UserModel({
    this.id,
    required this.email,
    this.fullname,
    this.emiratesId,
    this.birthday,
    this.martialStatus,
    this.serviceType,
    this.serviceLocation,
    this.primaryNum,
    this.alternativeNum,
    this.referralName,
    this.referralNum,
    this.town,
    this.familyNum,
    this.numberOfWifes,
    this.numberOfChildren,
    this.empoloyerName,
    this.employmentStatus,
    this.salary,
    this.propertyIncome1,
    this.propertyIncome2,
    this.monthlyGrossIncome,
    this.estimatedLoanAmount,
  });

  toJson() {
    return {
      "Email": email,
      "FullName": fullname,
      "EmiratesID": emiratesId,
      "Birthday": birthday,
      "MarrialStatus": martialStatus,
      "ServiceType": serviceType,
      "ServiceLocation": serviceLocation,
      "PrimaryNum": primaryNum,
      "AlternativeNum": alternativeNum,
      "ReferralName": referralName,
      "ReferralNum": referralNum,
      "Town": town,
      "FamilyNum": familyNum,
      "NumberOfWifes": numberOfWifes ?? 0,
      "NumberOfChildren": numberOfChildren ?? 0,
      "EmpoloyerName": empoloyerName,
      "EmploymentStatus": employmentStatus,
      "Salary": salary ?? 0,
      "PropertyIncome1": propertyIncome1 ?? 0,
      "PropertyIncome2": propertyIncome2 ?? 0,
      "MonthlyGrossIncome": monthlyGrossIncome ?? 0,
      "EstimatedLoanAmount": estimatedLoanAmount ?? 0,
    };
  }

  //Map user data fetched from Firebase to UserModel
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      email: data['Email'],
      fullname: data['FullName'],
    );
  }
}
