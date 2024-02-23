import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'withdraw_stock_view_widget.dart' show WithdrawStockViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WithdrawStockViewModel extends FlutterFlowModel<WithdrawStockViewWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextFieldAmount widget.
  FocusNode? textFieldAmountFocusNode;
  TextEditingController? textFieldAmountController;
  String? Function(BuildContext, String?)? textFieldAmountControllerValidator;
  String? _textFieldAmountControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TextFieldDetail widget.
  FocusNode? textFieldDetailFocusNode;
  TextEditingController? textFieldDetailController;
  String? Function(BuildContext, String?)? textFieldDetailControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    textFieldAmountControllerValidator = _textFieldAmountControllerValidator;
  }

  @override
  void dispose() {
    textFieldAmountFocusNode?.dispose();
    textFieldAmountController?.dispose();

    textFieldDetailFocusNode?.dispose();
    textFieldDetailController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
