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
import 'package:webviewx_plus/webviewx_plus.dart';

class WithdrawStockViewModel extends FlutterFlowModel<WithdrawStockViewWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextFieldAmount widget.
  FocusNode? textFieldAmountFocusNode;
  TextEditingController? textFieldAmountTextController;
  String? Function(BuildContext, String?)?
      textFieldAmountTextControllerValidator;
  String? _textFieldAmountTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TextFieldDetail widget.
  FocusNode? textFieldDetailFocusNode;
  TextEditingController? textFieldDetailTextController;
  String? Function(BuildContext, String?)?
      textFieldDetailTextControllerValidator;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ProductListRecord? rsProduct;

  @override
  void initState(BuildContext context) {
    textFieldAmountTextControllerValidator =
        _textFieldAmountTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldAmountFocusNode?.dispose();
    textFieldAmountTextController?.dispose();

    textFieldDetailFocusNode?.dispose();
    textFieldDetailTextController?.dispose();
  }
}
