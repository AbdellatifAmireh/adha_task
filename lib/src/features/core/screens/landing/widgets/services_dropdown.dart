import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> get servicesDropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Land Grant"), value: "Land Grant"),
    DropdownMenuItem(child: Text("Land Exchange"), value: "Land Exchange"),
    DropdownMenuItem(child: Text("House Exchange"), value: "House Exchange"),
    DropdownMenuItem(
        child: Text("Residential Land Purchase"),
        value: "Residential Land Purchase"),
    DropdownMenuItem(
        child: Text("House Construction"), value: "House Construction"),
    DropdownMenuItem(child: Text("House Purchase"), value: "House Purchase"),
    DropdownMenuItem(child: Text("Other Loans"), value: "Other Loans"),
  ];
  return menuItems;
}
