import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/confirm_custom_view/confirm_custom_view_widget.dart';
import '/component/info_custom_view/info_custom_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
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
    isReview: configResult?.isReview,
  );
}

Future initCustomer(BuildContext context) async {
  CustomerListRecord? customerResult;

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
      categoryList: customerResult?.categoryList,
      maximumProduct: customerResult?.maximumProduct,
    );
  } else {
    await CustomerListRecord.collection.doc().set(createCustomerListRecordData(
          createDate: getCurrentTimestamp,
          createBy: currentUserReference,
          status: 1,
          expireDate: functions.getEndDayTime(
              functions.getNextDay(FFAppState().configData.freeDay)!),
          subject: currentUserEmail,
          maximumProduct: 30,
        ));
    if (!FFAppState().configData.isReview) {
      await showDialog(
        context: context,
        builder: (dialogContext) {
          return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            child: WebViewAware(
              child: InfoCustomViewWidget(
                title:
                    'พิเศษสำหรับสมาชิกใหม่ทดลองใช้งานฟรี ${FFAppState().configData.freeDay.toString()} วัน กำหนดสินค้าไม่เกิน 30 รายการ',
                status: 'success',
              ),
            ),
          );
        },
      );
    }
    await action_blocks.iniConfig(context);
  }
}

Future checkAppVersion(BuildContext context) async {
  await actions.setAppVersion();
  if (FFAppState().appBuildVersion < FFAppState().configData.storeVersion) {
    await showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          elevation: 0,
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          alignment: AlignmentDirectional(0.0, 0.0)
              .resolve(Directionality.of(context)),
          child: WebViewAware(
            child: InfoCustomViewWidget(
              title: 'กรุณาอัพเดทแอปพลิเคชั่นและเปิดใหม่อีกครั้ง',
              status: 'info',
            ),
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
    return;
  }
}

Future<bool?> confirmBlock(
  BuildContext context, {
  required String? title,
  String? detail,
}) async {
  bool? isConfirm;

  await showDialog(
    context: context,
    builder: (dialogContext) {
      return Dialog(
        elevation: 0,
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        alignment:
            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
        child: WebViewAware(
          child: ConfirmCustomViewWidget(
            title: title!,
            detail: detail,
          ),
        ),
      );
    },
  ).then((value) => isConfirm = value);

  if ((isConfirm != null) && isConfirm!) {
    return true;
  }

  return false;
}
