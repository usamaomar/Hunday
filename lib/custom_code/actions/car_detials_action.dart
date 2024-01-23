// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';

List<String> carDetialsAction(String? jsonObject, String languge) {
  List<String> stringArray = [];
  if (jsonObject == 'null' ||
      jsonObject == null ||
      jsonObject.isEmpty ||
      jsonObject == "-") {
    return stringArray;
  }
  Map<String, dynamic> jsonData = json.decode(jsonObject);

  // Check if the input JSON object is not null
  if (languge == 'ar') {
    // Extract the values as string arrays
    List<String> arabicValues = jsonData["ar"].cast<String>();
    stringArray = arabicValues;
  } else {
    List<String> englishValues = jsonData["en"].cast<String>();
    stringArray = englishValues;
  }

  return stringArray;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
