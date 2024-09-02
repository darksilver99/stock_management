import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'issue_page_widget.dart' show IssuePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class IssuePageModel extends FlutterFlowModel<IssuePageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for topic widget.
  FocusNode? topicFocusNode;
  TextEditingController? topicTextController;
  String? Function(BuildContext, String?)? topicTextControllerValidator;
  String? _topicTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for detail widget.
  FocusNode? detailFocusNode;
  TextEditingController? detailTextController;
  String? Function(BuildContext, String?)? detailTextControllerValidator;
  String? _detailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for contactName widget.
  FocusNode? contactNameFocusNode;
  TextEditingController? contactNameTextController;
  String? Function(BuildContext, String?)? contactNameTextControllerValidator;
  String? _contactNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for contactPhone widget.
  FocusNode? contactPhoneFocusNode;
  TextEditingController? contactPhoneTextController;
  String? Function(BuildContext, String?)? contactPhoneTextControllerValidator;
  String? _contactPhoneTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Custom Action - getDeviceDetail] action in Button widget.
  String? deviceData;

  @override
  void initState(BuildContext context) {
    topicTextControllerValidator = _topicTextControllerValidator;
    detailTextControllerValidator = _detailTextControllerValidator;
    contactNameTextControllerValidator = _contactNameTextControllerValidator;
    contactPhoneTextControllerValidator = _contactPhoneTextControllerValidator;
  }

  @override
  void dispose() {
    topicFocusNode?.dispose();
    topicTextController?.dispose();

    detailFocusNode?.dispose();
    detailTextController?.dispose();

    contactNameFocusNode?.dispose();
    contactNameTextController?.dispose();

    contactPhoneFocusNode?.dispose();
    contactPhoneTextController?.dispose();
  }
}
