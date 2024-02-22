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

List<String>? splitThaiWordIntoSyllables(String? word) {
  // Create an empty list to store the syllables
  List<String> syllables = [];

  // Create a pattern to match Thai characters
  RegExp thaiCharPattern = RegExp(r'[\u0E01-\u0E5B]+');

  // Find all matches of Thai characters in the word
  Iterable<Match> matches = thaiCharPattern.allMatches(word!);

  // Add each match (syllable) to the list of syllables
  for (Match match in matches) {
    syllables.add(match.group(0)!);
  }

  // Return the list of syllables
  return syllables;
}
