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
import 'package:stock_management/auth/firebase_auth/auth_util.dart';

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

  //getData
  QuerySnapshot<Map<String, dynamic>> rs;
  if (category == "ทั้งหมด" || category == null) {
    rs = await FirebaseFirestore.instance
        .collection('tranfer_list')
        .where('create_by', isEqualTo: currentUserReference)
        .orderBy('product_id', descending: false)
        .orderBy('create_date', descending: false)
        .get();
  } else {
    rs = await FirebaseFirestore.instance
        .collection('tranfer_list')
        .where("product_cate", isEqualTo: category)
        .where('create_by', isEqualTo: currentUserReference)
        .orderBy('product_id', descending: false)
        .orderBy('create_date', descending: false)
        .get();
  }

  print("rsrsrs");
  print(rs.size);

  if (rs.size == 0) {
    return "No Data";
  }

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
      "text": "หมวดหมู่",
      "field": "product_cate",
    },
    {
      "text": "รับ-จ่าย",
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
      "text": "รวมราคาต้นทุน",
      "field": "total_price_start",
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
        .cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0));
    cell.value = TextCellValue(header[i]["text"]);
    cell.cellStyle = cellStyle;
    sheetObject.setColumnAutoFit(i);
  }

  // Add body
  for (int i = 0; i < rs.size; i++) {
    for (int j = 0; j < header.length; j++) {
      var field = header[j]["field"];
      var cell = sheetObject
          .cell(CellIndex.indexByColumnRow(columnIndex: j, rowIndex: i + 1));
      //cell.cellStyle = CellStyle(horizontalAlign: HorizontalAlign.Center);
      if (field == "create_date") {
        cell.value = TextCellValue(
            '${dateTimeFormat('d/M/y', rs.docs[i][field].toDate())} ${dateTimeFormat('Hm', rs.docs[i][field].toDate())}');
      } else {
        cell.cellStyle = CellStyle(horizontalAlign: HorizontalAlign.Right);
        cell.value = TextCellValue(rs.docs[i][field].toString());
      }
    }
  }

  Directory dir = await getApplicationDocumentsDirectory();
  //Directory dir = Directory('/storage/emulated/0/Download');
  List<int>? fileBytes = excel.save();
  var path = File('${dir.path}/รายงานรับจ่าย.xlsx')
    ..createSync(recursive: true)
    ..writeAsBytesSync(fileBytes!);

  print(path);

  return path.path;
}
