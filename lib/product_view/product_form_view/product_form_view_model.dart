import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/info_custom_view/info_custom_view_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'product_form_view_widget.dart' show ProductFormViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ProductFormViewModel extends FlutterFlowModel<ProductFormViewWidget> {
  ///  Local state fields for this component.

  bool isEdit = false;

  bool isLoading = true;

  String? image;

  List<FFUploadedFile> tmpImageList = [];
  void addToTmpImageList(FFUploadedFile item) => tmpImageList.add(item);
  void removeFromTmpImageList(FFUploadedFile item) => tmpImageList.remove(item);
  void removeAtIndexFromTmpImageList(int index) => tmpImageList.removeAt(index);
  void insertAtIndexInTmpImageList(int index, FFUploadedFile item) =>
      tmpImageList.insert(index, item);
  void updateTmpImageListAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      tmpImageList[index] = updateFn(tmpImageList[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Read Document] action in ProductFormView widget.
  ProductListRecord? productDocument;
  // State field(s) for productIDTextField widget.
  FocusNode? productIDTextFieldFocusNode;
  TextEditingController? productIDTextFieldTextController;
  String? Function(BuildContext, String?)?
      productIDTextFieldTextControllerValidator;
  String? _productIDTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for categoryDropDown widget.
  String? categoryDropDownValue;
  FormFieldController<String>? categoryDropDownValueController;
  // State field(s) for productNameTextField widget.
  FocusNode? productNameTextFieldFocusNode;
  TextEditingController? productNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      productNameTextFieldTextControllerValidator;
  String? _productNameTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for startPriceTextField widget.
  FocusNode? startPriceTextFieldFocusNode;
  TextEditingController? startPriceTextFieldTextController;
  String? Function(BuildContext, String?)?
      startPriceTextFieldTextControllerValidator;
  String? _startPriceTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for sellPriceTextField widget.
  FocusNode? sellPriceTextFieldFocusNode;
  TextEditingController? sellPriceTextFieldTextController;
  String? Function(BuildContext, String?)?
      sellPriceTextFieldTextControllerValidator;
  String? _sellPriceTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

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

  // Stores action output result for [Action Block - confirmBlock] action in Icon widget.
  bool? isConfirm2;
  // Stores action output result for [Action Block - confirmBlock] action in Icon widget.
  bool? isConfirm;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for detailTextField widget.
  FocusNode? detailTextFieldFocusNode;
  TextEditingController? detailTextFieldTextController;
  String? Function(BuildContext, String?)?
      detailTextFieldTextControllerValidator;
  // Stores action output result for [Custom Action - uploadImageToFirebase] action in Button widget.
  List<String>? urlList2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ProductListRecord? duplicateProductResult;
  // Stores action output result for [Custom Action - uploadImageToFirebase] action in Button widget.
  List<String>? urlList;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ProductListRecord? insertedProduct;

  @override
  void initState(BuildContext context) {
    productIDTextFieldTextControllerValidator =
        _productIDTextFieldTextControllerValidator;
    productNameTextFieldTextControllerValidator =
        _productNameTextFieldTextControllerValidator;
    startPriceTextFieldTextControllerValidator =
        _startPriceTextFieldTextControllerValidator;
    sellPriceTextFieldTextControllerValidator =
        _sellPriceTextFieldTextControllerValidator;
    totalTextFieldTextControllerValidator =
        _totalTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    productIDTextFieldFocusNode?.dispose();
    productIDTextFieldTextController?.dispose();

    productNameTextFieldFocusNode?.dispose();
    productNameTextFieldTextController?.dispose();

    startPriceTextFieldFocusNode?.dispose();
    startPriceTextFieldTextController?.dispose();

    sellPriceTextFieldFocusNode?.dispose();
    sellPriceTextFieldTextController?.dispose();

    totalTextFieldFocusNode?.dispose();
    totalTextFieldTextController?.dispose();

    detailTextFieldFocusNode?.dispose();
    detailTextFieldTextController?.dispose();
  }
}
