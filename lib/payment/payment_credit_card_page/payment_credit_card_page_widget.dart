import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/stripe/payment_manager.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_credit_card_page_model.dart';
export 'payment_credit_card_page_model.dart';

class PaymentCreditCardPageWidget extends StatefulWidget {
  const PaymentCreditCardPageWidget({super.key});

  @override
  State<PaymentCreditCardPageWidget> createState() =>
      _PaymentCreditCardPageWidgetState();
}

class _PaymentCreditCardPageWidgetState
    extends State<PaymentCreditCardPageWidget> {
  late PaymentCreditCardPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentCreditCardPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.chevron_left_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'ต่ออายุบัญชี',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Readex Pro',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/revaluation_12062459.png',
                                height: 120.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '    เนื่องจากบัญชีของคุณหมดอายุการใช้งาน กรุณาชำระเงินเพิ่อเปิดใช้สิทธิ์การใช้งานดังนี้',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        '- จัดการสินค้าของคุณ(เพิ่มลบแก้ไข)',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              fontSize: 18.0,
                            ),
                      ),
                      Text(
                        '- รับจ่ายสินค้า',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              fontSize: 18.0,
                            ),
                      ),
                      Text(
                        '- Export รายงานพัสดุ',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              fontSize: 18.0,
                            ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${formatNumber(
                                FFAppState().fullPrice,
                                formatType: FormatType.decimal,
                                decimalType: DecimalType.automatic,
                              )} บาท/เดือน',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFFB5B5B5),
                                    fontSize: 24.0,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'พิเศษสำหรับคุณเพียง ${functions.removeLastTwoZero()} บาท/เดือน',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context).error,
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 16.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            var paymentHistoryListRecordReference =
                                PaymentHistoryListRecord.collection.doc();
                            await paymentHistoryListRecordReference
                                .set(createPaymentHistoryListRecordData(
                              createDate: getCurrentTimestamp,
                              createBy: currentUserReference,
                              amount: functions.removeLastTwoZeroInt(),
                              status: 0,
                              paymentType: 'creditCard',
                              paymentOrder: random_data.randomString(
                                8,
                                8,
                                true,
                                true,
                                true,
                              ),
                            ));
                            _model.rsPayment =
                                PaymentHistoryListRecord.getDocumentFromData(
                                    createPaymentHistoryListRecordData(
                                      createDate: getCurrentTimestamp,
                                      createBy: currentUserReference,
                                      amount: functions.removeLastTwoZeroInt(),
                                      status: 0,
                                      paymentType: 'creditCard',
                                      paymentOrder: random_data.randomString(
                                        8,
                                        8,
                                        true,
                                        true,
                                        true,
                                      ),
                                    ),
                                    paymentHistoryListRecordReference);
                            final paymentResponse = await processStripePayment(
                              context,
                              amount: FFAppState().price,
                              currency: 'THB',
                              customerEmail: currentUserEmail,
                              allowGooglePay: true,
                              allowApplePay: false,
                              buttonColor: FlutterFlowTheme.of(context).primary,
                              buttonTextColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            );
                            if (paymentResponse.paymentId == null &&
                                paymentResponse.errorMessage != null) {
                              showSnackbar(
                                context,
                                'Error: ${paymentResponse.errorMessage}',
                              );
                            }
                            _model.paymentId = paymentResponse.paymentId ?? '';

                            if (_model.paymentId != null &&
                                _model.paymentId != '') {
                              await currentUserReference!
                                  .update(createUsersRecordData(
                                expireDate: functions.getNextDay(30),
                              ));

                              await _model.rsPayment!.reference
                                  .update(createPaymentHistoryListRecordData(
                                paymentDate: getCurrentTimestamp,
                                status: 1,
                              ));
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('ชำระเงินเสร็จสิ้น'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                              await actions.pushReplacementNamed(
                                context,
                                'HomePage',
                              );
                            }

                            setState(() {});
                          },
                          text: 'ชำระเงิน',
                          options: FFButtonOptions(
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  fontSize: 22.0,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
