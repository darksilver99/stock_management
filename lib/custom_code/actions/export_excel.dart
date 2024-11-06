// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
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
import 'package:stock_management/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;

Future<String> exportExcel(
  DateTime startDate,
  DateTime endDate,
  String type,
) async {
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

  //getData
  QuerySnapshot<Map<String, dynamic>> rs;

  rs = await FirebaseFirestore.instance
      .collection(
          '${FFAppState().customerData.customerRef!.path}/transaction_list')
      .where("create_date", isGreaterThanOrEqualTo: startDate)
      .where("create_date", isLessThanOrEqualTo: endDate)
      .where("type", isEqualTo: type)
      .orderBy('create_date', descending: true)
      .get();

  print("rsrsrs");
  print(rs.size);

  if (rs.size == 0) {
    return "No Data";
  }

  var excel = Excel.createExcel();
  Sheet sheetObject = excel['Sheet1'];

  CellStyle cellStyle = CellStyle(
    backgroundColorHex: ExcelColor.fromHexString('#1AFF1A'),
    horizontalAlign: HorizontalAlign.Center,
    bold: true,
    leftBorder: exBorder.Border(borderStyle: exBorder.BorderStyle.Thin),
    rightBorder: exBorder.Border(borderStyle: exBorder.BorderStyle.Thin),
    topBorder: exBorder.Border(borderStyle: exBorder.BorderStyle.Thin),
    bottomBorder: exBorder.Border(borderStyle: exBorder.BorderStyle.Thin),
  );

  // title
  var cell =
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0));
  cell.value = TextCellValue(
      'รายการความเคลื่อนไหว ประจำวันที่ ${functions.dateTh(startDate)} ถึง ${functions.dateTh(endDate)}');
  cell.cellStyle = CellStyle(fontSize: 22, bold: true);

  // Add headers
  List<Map<String, dynamic>> header = [
    {
      "text": "รหัสสินค้า",
      "field": "product_id",
    },
    {
      "text": "ชื่อสินค้า",
      "field": "product_name",
    },
    {
      "text": "ประเภท",
      "field": "type",
    },
    {
      "text": "จำนวน(หน่วย)",
      "field": "total_amount",
    },
    {
      "text": "คงเหลือ(หน่วย)",
      "field": "total_remain",
    },
    {
      "text": "หมายเหตุ",
      "field": "remark",
    },
    {
      "text": "ราคาต้นทุน",
      "field": "current_price_start",
    },
    {
      "text": "รวมราคาต้นทุน",
      "field": "total_price_start",
    },
    {
      "text": "ราคาขาย",
      "field": "current_price_sell",
    },
    {
      "text": "รวมราคาขาย",
      "field": "total_price_sell",
    },
    {
      "text": "วันที่ทำรายการ",
      "field": "create_date",
    }
  ];

  for (var i = 0; i < header.length; i++) {
    var cell = sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 1));
    cell.value = TextCellValue(header[i]["text"]);
    cell.cellStyle = cellStyle;
    sheetObject.setColumnAutoFit(i);
  }

  // Add body
  for (int i = 0; i < rs.size; i++) {
    for (int j = 0; j < header.length; j++) {
      var field = header[j]["field"];
      var cell = sheetObject
          .cell(CellIndex.indexByColumnRow(columnIndex: j, rowIndex: i + 2));
      if (field == "create_date") {
        cell
          ..value = TextCellValue(
              '${functions.dateTimeTh(rs.docs[i][field].toDate())}')
          ..cellStyle = CellStyle(horizontalAlign: HorizontalAlign.Right);
      } else {
        cell
          ..value = TextCellValue(rs.docs[i][field].toString())
          ..cellStyle = CellStyle(horizontalAlign: HorizontalAlign.Right);
      }
    }
  }

  // Auto-size columns
  for (int col = 0; col < header.length; col++) {
    sheetObject.setColumnWidth(col, 30);
    if (col == 0 || col == 3) {
      sheetObject.setColumnWidth(col, 15);
    }

    //sheetObject.setDefaultColumnWidth(30);
    //sheetObject.setColumnAutoFit(col);
  }

  Directory dir = await getApplicationDocumentsDirectory();
  //Directory dir = Directory('/storage/emulated/0/Download');
  List<int>? fileBytes = excel.save();
  var path = File('${dir.path}/รายการความเคลื่อนไหว.xlsx')
    ..createSync(recursive: true)
    ..writeAsBytesSync(fileBytes!);

  print(path);

  return path.path;
}
