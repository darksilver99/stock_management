import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/product/category_view/category_view_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'product_form_page_widget.dart' show ProductFormPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ProductFormPageModel extends FlutterFlowModel<ProductFormPageWidget> {
  ///  Local state fields for this page.

  List<String> cateList = [];
  void addToCateList(String item) => cateList.add(item);
  void removeFromCateList(String item) => cateList.remove(item);
  void removeAtIndexFromCateList(int index) => cateList.removeAt(index);
  void insertAtIndexInCateList(int index, String item) =>
      cateList.insert(index, item);
  void updateCateListAtIndex(int index, Function(String) updateFn) =>
      cateList[index] = updateFn(cateList[index]);

  String? image;

  bool isUploading = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in ProductFormPage widget.
  CategoryListRecord? rsCate;
  // State field(s) for TextFieldProductCode widget.
  FocusNode? textFieldProductCodeFocusNode;
  TextEditingController? textFieldProductCodeTextController;
  String? Function(BuildContext, String?)?
      textFieldProductCodeTextControllerValidator;
  String? _textFieldProductCodeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextFieldProductName widget.
  FocusNode? textFieldProductNameFocusNode;
  TextEditingController? textFieldProductNameTextController;
  String? Function(BuildContext, String?)?
      textFieldProductNameTextControllerValidator;
  String? _textFieldProductNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TextFieldProductStartPrice widget.
  FocusNode? textFieldProductStartPriceFocusNode;
  TextEditingController? textFieldProductStartPriceTextController;
  String? Function(BuildContext, String?)?
      textFieldProductStartPriceTextControllerValidator;
  String? _textFieldProductStartPriceTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TextFieldProductSellPrice widget.
  FocusNode? textFieldProductSellPriceFocusNode;
  TextEditingController? textFieldProductSellPriceTextController;
  String? Function(BuildContext, String?)?
      textFieldProductSellPriceTextControllerValidator;
  String? _textFieldProductSellPriceTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TextFieldProductStock widget.
  FocusNode? textFieldProductStockFocusNode;
  TextEditingController? textFieldProductStockTextController;
  String? Function(BuildContext, String?)?
      textFieldProductStockTextControllerValidator;
  String? _textFieldProductStockTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TextFieldProductDetail widget.
  FocusNode? textFieldProductDetailFocusNode;
  TextEditingController? textFieldProductDetailTextController;
  String? Function(BuildContext, String?)?
      textFieldProductDetailTextControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ProductListRecord? isDuplicate;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ProductListRecord? insertedProduct;

  @override
  void initState(BuildContext context) {
    textFieldProductCodeTextControllerValidator =
        _textFieldProductCodeTextControllerValidator;
    textFieldProductNameTextControllerValidator =
        _textFieldProductNameTextControllerValidator;
    textFieldProductStartPriceTextControllerValidator =
        _textFieldProductStartPriceTextControllerValidator;
    textFieldProductSellPriceTextControllerValidator =
        _textFieldProductSellPriceTextControllerValidator;
    textFieldProductStockTextControllerValidator =
        _textFieldProductStockTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldProductCodeFocusNode?.dispose();
    textFieldProductCodeTextController?.dispose();

    textFieldProductNameFocusNode?.dispose();
    textFieldProductNameTextController?.dispose();

    textFieldProductStartPriceFocusNode?.dispose();
    textFieldProductStartPriceTextController?.dispose();

    textFieldProductSellPriceFocusNode?.dispose();
    textFieldProductSellPriceTextController?.dispose();

    textFieldProductStockFocusNode?.dispose();
    textFieldProductStockTextController?.dispose();

    textFieldProductDetailFocusNode?.dispose();
    textFieldProductDetailTextController?.dispose();
  }
}
