import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/info_custom_view/info_custom_view_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'manage_stock_view_widget.dart' show ManageStockViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ManageStockViewModel extends FlutterFlowModel<ManageStockViewWidget> {
  ///  Local state fields for this component.

  ProductListRecord? selectedProduct;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Read Document] action in Row widget.
  ProductListRecord? productDocumentResult;
  // State field(s) for totalTextField widget.
  FocusNode? totalTextFieldFocusNode;
  TextEditingController? totalTextFieldTextController;
  String? Function(BuildContext, String?)?
      totalTextFieldTextControllerValidator;
  String? _totalTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for remarkTextField widget.
  FocusNode? remarkTextFieldFocusNode;
  TextEditingController? remarkTextFieldTextController;
  String? Function(BuildContext, String?)?
      remarkTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    totalTextFieldTextControllerValidator =
        _totalTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    totalTextFieldFocusNode?.dispose();
    totalTextFieldTextController?.dispose();

    remarkTextFieldFocusNode?.dispose();
    remarkTextFieldTextController?.dispose();
  }
}
