import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

bool? newCustomFunction(String? email) {
  final RegExp emailRegex =
      RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  return emailRegex.hasMatch(email ?? "");
}

bool? newCustomFunction2(
  String searchText,
  String currentTitle,
) {
  return currentTitle.contains(searchText);
}

String checkNumberAndValidate(String phoneNumber) {
  phoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

  // Check if the number starts with "00962" or "+962"
  if (phoneNumber.startsWith("00962")) {
    phoneNumber = phoneNumber.replaceFirst("00962", "0");
  } else if (phoneNumber.startsWith("+962")) {
    phoneNumber = phoneNumber.replaceFirst("+962", "0");
  }

  // If the number doesn't start with "0", add it
  if (!phoneNumber.startsWith("0")) {
    phoneNumber = "0$phoneNumber";
  }

  return phoneNumber;
}

bool checkNumberCount(String phoneNumber) {
  phoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

  // Check if the phone number has exactly 10 digits
  return phoneNumber.length == 10;
}

String formatDateTimeDrop(DateTime dateTime) {
  final DateFormat dateFormat = DateFormat('MM/dd/yyyy');

  // Use the format method to format the DateTime object as a string
  String formattedDate = dateFormat.format(dateTime);

  return formattedDate;
}

String newsFormatDateFunction(String inputDate) {
  DateTime parsedDate = DateTime.parse(inputDate);

  final outputFormat = DateFormat('d MMM y');

  String formattedDate = outputFormat.format(parsedDate);

  return formattedDate;
}

String linkToWhatsApp(String phone) {
  return "https://wa.me/$phone";
}

String formatTimeRange(
  String openFrom,
  String openTo,
) {
  DateFormat inputFormat = DateFormat('HH:mm');
  DateFormat outputFormat = DateFormat('h:mm a');
  DateTime fromTime = inputFormat.parse(openFrom);
  DateTime toTime = inputFormat.parse(openTo);

  // Format the times into strings in "h:mm a" format.
  String formattedFrom = outputFormat.format(fromTime);
  String formattedTo = outputFormat.format(toTime);

  return '$formattedFrom - $formattedTo';
}

List<bool> addFalseValuesToList(int size) {
  List<bool> resultList = List.generate(size, (index) => index == 0);
  return resultList;
}

List<bool> updateAtIndexAndClearOthers(
  List<bool> boolList,
  int index,
) {
  List<bool> updatedList = List<bool>.filled(boolList.length, false);
  if (index >= 0 && index < boolList.length) {
    updatedList[index] = !boolList[index];
  }
  return updatedList;
}

String formatPhoneNumber(String input) {
  if (input.length < 10) {
    return input;
  }
  String countryCode = "+962";
  String firstPart = input.substring(0, 3);
  String secondPart = input.substring(3, 6);
  String thirdPart = input.substring(6, 9);

  return '$countryCode $firstPart $secondPart $thirdPart';
}

String getNameByLanguge(
  String englishName,
  String arabicName,
  String languge,
) {
  if (languge == 'ar') {
    return arabicName.toString();
  } else {
    return englishName.toString();
  }
}
