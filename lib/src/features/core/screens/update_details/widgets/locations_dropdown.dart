import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> get locationsDropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Abu Dhabi"), value: "AbuDhabi"),
    DropdownMenuItem(child: Text("Dubai"), value: "Dubai"),
    DropdownMenuItem(child: Text("Sharjah"), value: "Sharjah"),
    DropdownMenuItem(child: Text("Ajman"), value: "Ajman"),
    DropdownMenuItem(child: Text("Umm Al Quwain"), value: "UmmAlQuwain"),
    DropdownMenuItem(child: Text("Ras Al Khaimah"), value: "RasAlKhaimah"),
    DropdownMenuItem(child: Text("Fujairah"), value: "Fujairah"),
  ];
  return menuItems;
}
