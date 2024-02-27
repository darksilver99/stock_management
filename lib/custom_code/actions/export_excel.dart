// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:excel/excel.dart';
import 'package:excel/excel.dart' as exBorder;
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

Future<String> exportExcel(String? category) async {
  // Add your function code here!
  bool isGranted = false;
  if (Platform.isAndroid) {
    final deviceInfo = DeviceInfoPlugin();
    final info = await deviceInfo.androidInfo;
    if (int.parse(info.version.release) >= 13) {
      isGranted = true;
    } else {
      var status = await Permission.storage.request();
      if (status.isGranted) {
        isGranted = true;
      }
    }
  } else {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      isGranted = true;
    }
  }

  if (!isGranted) {
    return '';
  }

  DateTime newEndDate =
      DateTime(endDate!.year, endDate!.month, endDate!.day, 23, 59, 59, 999);

  //getData
  var rs = await FirebaseFirestore.instance
      .collection('time_check_list')
      .where('company_ref', isEqualTo: FFAppState().currentCompany)
      .where('create_date', isGreaterThanOrEqualTo: startDate)
      .where('create_date', isLessThanOrEqualTo: newEndDate)
      .orderBy('create_date', descending: false)
      .get();

  var rsCompany = await FirebaseFirestore.instance
      .doc(FFAppState().currentCompany!.path)
      .get();

  var excel = Excel.createExcel();
  Sheet sheetObject = excel['Sheet1'];

  CellStyle cellStyle = CellStyle(
    backgroundColorHex: '#1AFF1A',
    horizontalAlign: HorizontalAlign.Center,
    bold: true,
    leftBorder: exBorder.Border(borderStyle: exBorder.BorderStyle.Thin),
    rightBorder: exBorder.Border(borderStyle: exBorder.BorderStyle.Thin),
    topBorder: exBorder.Border(borderStyle: exBorder.BorderStyle.Thin),
    bottomBorder: exBorder.Border(borderStyle: exBorder.BorderStyle.Thin),
  );

  // Add headers
  List<String> header = ["ชื่อ-สกุล"];

  List<String> dateRange = getDateRange(startDate!, newEndDate);
  if (dateRange.length > 60) {
    return 'youshallnotpass';
  }

  // title
  var workStart = rsCompany.data()!["start_date"];
  var workEnd = rsCompany.data()!["end_date"];
  sheetObject.merge(
    CellIndex.indexByString('A1'),
    CellIndex.indexByString('C1'),
    customValue: TextCellValue(
        'รายชื่อพนักงาน เข้า-ออกงาน ประจำวันที่ ${(dateTimeFormat('dd/MM/yyyy', startDate)).replaceAll("/", '-')} ถึง ${(dateTimeFormat('dd/MM/yyyy', endDate)).replaceAll("/", '-')}\nเวลาทำงาน $workStart-$workEnd'),
  );

  for (var i = 0; i < dateRange.length; i++) {
    header.add(dateRange[i]);
  }

  for (var i = 0; i < header.length; i++) {
    var cell = sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 1));
    cell.value = TextCellValue(header[i]);
    cell.cellStyle = cellStyle;
  }

  // Add body
  for (int i = 0; i < rs.size; i++) {
    var rsUser = await FirebaseFirestore.instance
        .doc(rs.docs[i].data()["create_by"].path)
        .get();

    for (int j = 0; j < header.length; j++) {
      var cell = sheetObject
          .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: i + 2));
      cell.cellStyle = CellStyle(horizontalAlign: HorizontalAlign.Left);
      cell.value = TextCellValue(
          '${rsUser.data()!["first_name"]} ${rsUser.data()!["last_name"]}(${rsUser.data()!["display_name"]})');

      if (dateTimeFormat(
              'dd/MM/yyyy', rs.docs[i].data()["create_date"].toDate()) ==
          header[j]) {
        var cell = sheetObject
            .cell(CellIndex.indexByColumnRow(columnIndex: j, rowIndex: i + 2));
        var dateIn =
            dateTimeFormat('Hm', rs.docs[i].data()["create_date"].toDate());
        var dateOut = rs.docs[i].data().containsKey("update_date")
            ? dateTimeFormat('Hm', rs.docs[i].data()["update_date"].toDate())
            : "-";

        cell.cellStyle = CellStyle(textWrapping: TextWrapping.WrapText);

        DateTime? tmpUpdateDate = rs.docs[i].data().containsKey("update_date")
            ? rs.docs[i].data()["update_date"].toDate()
            : null;
        if (isLate(rsCompany, rs.docs[i].data()["create_date"].toDate(),
            tmpUpdateDate)) {
          cell.cellStyle = CellStyle(
              fontColorHex: "#ff0000", textWrapping: TextWrapping.WrapText);
        }

        var detailIn = rs.docs[i].data().containsKey("detail_in")
            ? rs.docs[i].data()["detail_in"]
            : " -";
        var detailOut = rs.docs[i].data().containsKey("detail_out")
            ? rs.docs[i].data()["detail_out"]
            : " -";

        var startEndTimeText = "เข้างาน : $dateIn | ออกงาน : $dateOut";
        var startEndDetailText =
            "รายละเอียด(เข้างาน) : ${(detailIn != '') ? detailIn : " -"}\n รายละเอียด(ออกงาน) :${(detailOut != '') ? detailOut : " -"}";
        //var photoIn = "รูปเข้างาน : ${rs.docs[i].data()["photo_in"]}";
        //var photoOut = "รูปออกงาน : ${rs.docs[i].data().containsKey("photo_out") && rs.docs[i].data()["photo_out"].trim() != "" ? rs.docs[i].data()["photo_out"] : " -"}";
        cell.value = TextCellValue("$startEndTimeText\n$startEndDetailText");
      }

      //เสาทิตใส่สี
      if (isWeekend(header[j])) {
        var cell2 = sheetObject
            .cell(CellIndex.indexByColumnRow(columnIndex: j, rowIndex: i + 2));
        cell2.cellStyle = CellStyle(backgroundColorHex: "#ffdfdf");
      }
    }
  }

  // Auto-size columns
  for (int col = 0; col < 60; col++) {
    //sheetObject.setColumnWidth(col, 2000);
    sheetObject.setDefaultColumnWidth(25);
    //sheetObject.setColumnAutoFit(col);
  }

  Directory dir = await getApplicationDocumentsDirectory();
  //Directory dir = Directory('/storage/emulated/0/Download');
  List<int>? fileBytes = excel.save();
  var path = File(
      '${dir.path}/เข้างาน${(dateTimeFormat('dd/MM/yyyy', startDate)).replaceAll("/", '-')}ถึง${(dateTimeFormat('dd/MM/yyyy', endDate)).replaceAll("/", '-')}.xlsx')
    ..createSync(recursive: true)
    ..writeAsBytesSync(fileBytes!);

  print(path);

  return path.path;
}
