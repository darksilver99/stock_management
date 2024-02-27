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

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in ProductFormPage widget.
  CategoryListRecord? rsCate;
  // State field(s) for TextFieldProductCode widget.
  FocusNode? textFieldProductCodeFocusNode;
  TextEditingController? textFieldProductCodeController;
  String? Function(BuildContext, String?)?
      textFieldProductCodeControllerValidator;
  String? _textFieldProductCodeControllerValidator(
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
  TextEditingController? textFieldProductNameController;
  String? Function(BuildContext, String?)?
      textFieldProductNameControllerValidator;
  String? _textFieldProductNameControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TextFieldProductStartPrice widget.
  FocusNode? textFieldProductStartPriceFocusNode;
  TextEditingController? textFieldProductStartPriceController;
  String? Function(BuildContext, String?)?
      textFieldProductStartPriceControllerValidator;
  String? _textFieldProductStartPriceControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TextFieldProductSellPrice widget.
  FocusNode? textFieldProductSellPriceFocusNode;
  TextEditingController? textFieldProductSellPriceController;
  String? Function(BuildContext, String?)?
      textFieldProductSellPriceControllerValidator;
  String? _textFieldProductSellPriceControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TextFieldProductStock widget.
  FocusNode? textFieldProductStockFocusNode;
  TextEditingController? textFieldProductStockController;
  String? Function(BuildContext, String?)?
      textFieldProductStockControllerValidator;
  String? _textFieldProductStockControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TextFieldProductDetail widget.
  FocusNode? textFieldProductDetailFocusNode;
  TextEditingController? textFieldProductDetailController;
  String? Function(BuildContext, String?)?
      textFieldProductDetailControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ProductListRecord? isDuplicate;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ProductListRecord? insertedProduct;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    textFieldProductCodeControllerValidator =
        _textFieldProductCodeControllerValidator;
    textFieldProductNameControllerValidator =
        _textFieldProductNameControllerValidator;
    textFieldProductStartPriceControllerValidator =
        _textFieldProductStartPriceControllerValidator;
    textFieldProductSellPriceControllerValidator =
        _textFieldProductSellPriceControllerValidator;
    textFieldProductStockControllerValidator =
        _textFieldProductStockControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldProductCodeFocusNode?.dispose();
    textFieldProductCodeController?.dispose();

    textFieldProductNameFocusNode?.dispose();
    textFieldProductNameController?.dispose();

    textFieldProductStartPriceFocusNode?.dispose();
    textFieldProductStartPriceController?.dispose();

    textFieldProductSellPriceFocusNode?.dispose();
    textFieldProductSellPriceController?.dispose();

    textFieldProductStockFocusNode?.dispose();
    textFieldProductStockController?.dispose();

    textFieldProductDetailFocusNode?.dispose();
    textFieldProductDetailController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
