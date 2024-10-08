import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

Future iniConfig(BuildContext context) async {
  ConfigRecord? configResult;

  configResult = await queryConfigRecordOnce(
    singleRecord: true,
  ).then((s) => s.firstOrNull);
  FFAppState().configData = ConfigDataStruct(
    storeVersion: configResult?.storeVersion,
    storeIosLink: configResult?.storeIosLink,
    storeAndroidLink: configResult?.storeAndroidLink,
    policyUrl: configResult?.policyUrl,
    freeDay: configResult?.freeDay,
    paymentAlertText: configResult?.paymentAlertText,
    paymentDetailImage: configResult?.paymentDetailImage,
    promotionDetailImage: configResult?.promotionDetailImage,
    contact: configResult?.contact,
  );
}

Future initCustomer(BuildContext context) async {
  CustomerListRecord? customerResult;
  CustomerListRecord? insertedCustomer;

  customerResult = await queryCustomerListRecordOnce(
    queryBuilder: (customerListRecord) => customerListRecord.where(
      'create_by',
      isEqualTo: currentUserReference,
    ),
    singleRecord: true,
  ).then((s) => s.firstOrNull);
  if (customerResult != null) {
    FFAppState().customerData = CustomerDataStruct(
      subject: customerResult?.subject,
      expireDate: customerResult?.expireDate,
      customerRef: customerResult?.reference,
    );
  } else {
    var customerListRecordReference = CustomerListRecord.collection.doc();
    await customerListRecordReference.set(createCustomerListRecordData(
      createDate: getCurrentTimestamp,
      createBy: currentUserReference,
      status: 1,
      expireDate: functions.getEndDayTime(
          functions.getNextDay(FFAppState().configData.freeDay)!),
      subject: currentUserEmail,
    ));
    insertedCustomer = CustomerListRecord.getDocumentFromData(
        createCustomerListRecordData(
          createDate: getCurrentTimestamp,
          createBy: currentUserReference,
          status: 1,
          expireDate: functions.getEndDayTime(
              functions.getNextDay(FFAppState().configData.freeDay)!),
          subject: currentUserEmail,
        ),
        customerListRecordReference);
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return WebViewAware(
          child: AlertDialog(
            title: Text(
                'พิเศษสำหรับสมาชิกใหม่ทดลองใช้งานฟรี ${FFAppState().configData.freeDay.toString()} วัน'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: Text('ตกลง'),
              ),
            ],
          ),
        );
      },
    );
    FFAppState().customerData = CustomerDataStruct(
      subject: insertedCustomer?.subject,
      expireDate: insertedCustomer?.expireDate,
      customerRef: insertedCustomer?.reference,
    );
  }
}

Future checkAppVersion(BuildContext context) async {
  await actions.setAppVersion();
  if (FFAppState().appBuildVersion < FFAppState().configData.storeVersion) {
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return WebViewAware(
          child: AlertDialog(
            title: Text('กรุณาอัพเดทแอปพลิเคชั่นและเปิดใหม่อีกครั้ง'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: Text('ตกลง'),
              ),
            ],
          ),
        );
      },
    );
    if (isAndroid) {
      await launchURL(FFAppState().configData.storeAndroidLink);
    } else {
      await launchURL(FFAppState().configData.storeIosLink);
    }

    await actions.closeApp();
  }
}
