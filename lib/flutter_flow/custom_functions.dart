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

bool checkNumberAndValidateIf(String phoneNumber) {
  phoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

  // Check if the number starts with "00962" or "+962"
  if (phoneNumber.startsWith("00962")) {
    return false;
  } else if (phoneNumber.startsWith("+962")) {
    return false;
  }

  // If the number doesn't start with "0", add it
  if (!phoneNumber.startsWith("0")) {
    return false;
  }

  return false;
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
  String firstPart = input.substring(0, 4);
  String secondPart = input.substring(4, 7);
  String thirdPart = input.substring(7, 10);

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

bool is18YearsOrOlder(int timestampInSeconds) {
  DateTime birthDate =
      DateTime.fromMillisecondsSinceEpoch(timestampInSeconds * 1000);

  // Calculate the current date.
  DateTime currentDate = DateTime.now();

  // Calculate the minimum date that is 18 years ago from the current date.
  DateTime minAgeDate = currentDate
      .subtract(Duration(days: 18 * 365)); // Approximation of 18 years

  // Compare the birthDate with the minimum age date.
  return birthDate.isBefore(minAgeDate);
}

bool charsCount(String text) {
  return text.length >= 6;
}

List<String> convertNullLists(List<String> list) {
  if (list == null) {
    return [];
  } else {
    return list;
  }
}

dynamic getSettingByKey(
  String? key,
  List<dynamic> responseList,
) {
  for (var setting in responseList) {
    if (setting['option_key'] == key) {
      return setting['option_value'];
    }
  }
  return null; // Return null if not found
}

dynamic nullConverter(dynamic param) {
  if (param != null) {
    return param;
  } else {
    return "-";
  }
}

List<String> specifcationsFunction(
  dynamic json,
  String? lang,
  String? attrs,
) {
  List<String> result = [];

  for (var performance in json) {
    if (lang != null && performance['${attrs}_$lang'] != null) {
      result.add(performance['${attrs}_$lang']);
    }
  }

  return result;
}

List<CarModelStruct> fromJsonToModelList(dynamic jsonBody) {
  return jsonBody
      .map((e) => e != null && e != '' ? CarModelStruct.fromMap(e) : null)
      .toList()
      .toList()
      .cast<CarModelStruct>();
}

List<CarCategoriesStruct> fromJsonToCategoriesList(dynamic jsonObject) {
  return jsonObject
      .map((e) => e != null && e != '' ? CarCategoriesStruct.fromMap(e) : null)
      .toList()
      .toList()
      .cast<CarCategoriesStruct>();
}

List<FuelTypeModelStruct> fromJsonToFuelTypeModelList(dynamic jsonObject) {
  return jsonObject
      .map((e) => e != null && e != '' ? CarCategoriesStruct.fromMap(e) : null)
      .toList()
      .toList()
      .cast<CarCategoriesStruct>();
}
