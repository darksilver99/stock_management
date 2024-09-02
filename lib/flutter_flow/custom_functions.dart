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
