import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

double sumPrice(
  double price,
  int amount,
) {
  return amount * price;
}

int stringToInt(String str) {
  return int.parse(str);
}

DateTime? getNextDay(int? nextDay) {
  DateTime currentDate = DateTime.now();
  DateTime futureDate = currentDate.add(Duration(days: nextDay!));
  return futureDate;
}

String? removeLastTwoZero(int val) {
  String numberString = val.toString();
  return numberString.substring(0, numberString.length - 2);
}

int? removeLastTwoZeroInt(int val) {
  String numberString = val.toString();

  return int.parse(numberString.substring(0, numberString.length - 2));
}

DateTime getEndDayTime(DateTime currentDate) {
  DateTime endOfDay = DateTime(
      currentDate.year, currentDate.month, currentDate.day, 23, 59, 59);
  return endOfDay;
}

String? dateTh(DateTime? date) {
  if (date == null) {
    return null;
  }
  final DateFormat formatter = DateFormat('d MMMM yyyy', 'th_TH');
  final buddhistYear = date.year + 543;
  return formatter.format(date).replaceFirst('${date.year}', '$buddhistYear');
}

String? dateTimeTh(DateTime? date) {
  if (date == null) {
    return null;
  }

  final DateFormat formatter = DateFormat('d MMMM yyyy HH:mm:ss', 'th_TH');
  final buddhistYear = date.year + 543;
  return formatter.format(date).replaceFirst('${date.year}', '$buddhistYear');
}

List<String> getKeywordList(String keyword) {
  return keyword
      .replaceAll(",", "") // Remove all commas
      .split(" ") // Split by spaces
      .map((word) =>
          word.trim().toLowerCase()) // Trim each word and convert to lowercase
      .where((word) => word.isNotEmpty) // Remove any empty strings
      .toList();
}

DateTime getFirstDayOfMonth(DateTime date) {
  DateTime firstDayOfCurrentMonth = DateTime(date.year, date.month, 1);
  return firstDayOfCurrentMonth;
}

DateTime getLastDayOfMonth(DateTime date) {
  DateTime firstDayOfNextMonth = DateTime(date.year, date.month + 1, 1);
  DateTime lastDayOfCurrentMonth =
      firstDayOfNextMonth.subtract(Duration(seconds: 1));
  return lastDayOfCurrentMonth;
}

List<String> getYearFromCurrent(int len) {
  List<String> yearList = [];
  int currentYear = DateTime.now().year + 543;
  for (var i = currentYear - len; i <= currentYear; i++) {
    yearList.add(i.toString());
  }
  return yearList;
}

DateTime getDateByMonthAndYear(
  String month,
  String year,
) {
  DateTime currentDate = DateTime.now();
  return DateTime((int.parse(year) - 543), int.parse(month), currentDate.day);
}

DateTime getStartDayTime(DateTime currentDate) {
  DateTime startOfDay =
      DateTime(currentDate.year, currentDate.month, currentDate.day);
  return startOfDay;
}

DateTime getBeforeDay(
  int pastDay,
  DateTime date,
) {
  DateTime pastDate = date.subtract(Duration(days: pastDay));
  return pastDate;
}
