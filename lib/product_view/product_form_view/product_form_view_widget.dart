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
import '/product_view/category_setting_view/category_setting_view_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
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
import 'product_form_view_model.dart';
export 'product_form_view_model.dart';

class ProductFormViewWidget extends StatefulWidget {
  const ProductFormViewWidget({
    super.key,
    this.productDocument,
  });

  final ProductListRecord? productDocument;

  @override
  State<ProductFormViewWidget> createState() => _ProductFormViewWidgetState();
}

class _ProductFormViewWidgetState extends State<ProductFormViewWidget> {
  late ProductFormViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductFormViewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.productDocument != null) {
        _model.isEdit = true;
        _model.productDocument = await ProductListRecord.getDocumentOnce(
            widget!.productDocument!.reference);
        _model.image = _model.productDocument?.photo;
        safeSetState(() {
          _model.productIDTextFieldTextController?.text =
              _model.productDocument!.productId;
          _model.productIDTextFieldTextController?.selection =
              TextSelection.collapsed(
                  offset: _model.productIDTextFieldTextController!.text.length);
        });
        safeSetState(() {
          _model.productNameTextFieldTextController?.text =
              _model.productDocument!.name;
          _model.productNameTextFieldTextController?.selection =
              TextSelection.collapsed(
                  offset:
                      _model.productNameTextFieldTextController!.text.length);
        });
        safeSetState(() {
          _model.startPriceTextFieldTextController?.text =
              _model.productDocument!.priceStart.toString();
          _model.startPriceTextFieldTextController?.selection =
              TextSelection.collapsed(
                  offset:
                      _model.startPriceTextFieldTextController!.text.length);
        });
        safeSetState(() {
          _model.sellPriceTextFieldTextController?.text =
              _model.productDocument!.priceSell.toString();
          _model.sellPriceTextFieldTextController?.selection =
              TextSelection.collapsed(
                  offset: _model.sellPriceTextFieldTextController!.text.length);
        });
        safeSetState(() {
          _model.detailTextFieldTextController?.text =
              _model.productDocument!.detail;
          _model.detailTextFieldTextController?.selection =
              TextSelection.collapsed(
                  offset: _model.detailTextFieldTextController!.text.length);
        });
        safeSetState(() {
          _model.totalTextFieldTextController?.text =
              _model.productDocument!.stock.toString();
          _model.totalTextFieldTextController?.selection =
              TextSelection.collapsed(
                  offset: _model.totalTextFieldTextController!.text.length);
        });
      } else {
        _model.isEdit = false;
      }

      _model.isLoading = false;
      safeSetState(() {});
    });

    _model.productIDTextFieldTextController ??= TextEditingController();
    _model.productIDTextFieldFocusNode ??= FocusNode();

    _model.productNameTextFieldTextController ??= TextEditingController();
    _model.productNameTextFieldFocusNode ??= FocusNode();

    _model.startPriceTextFieldTextController ??= TextEditingController();
    _model.startPriceTextFieldFocusNode ??= FocusNode();

    _model.sellPriceTextFieldTextController ??= TextEditingController();
    _model.sellPriceTextFieldFocusNode ??= FocusNode();

    _model.totalTextFieldTextController ??= TextEditingController();
    _model.totalTextFieldFocusNode ??= FocusNode();

    _model.detailTextFieldTextController ??= TextEditingController();
    _model.detailTextFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 32.0,
                  ),
                ),
              ],
            ),
          ),
          if (!_model.isLoading)
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              _model.isEdit ? 'แก้ไขสินค้า' : 'นำเข้าสินค้า',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 28.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller:
                                      _model.productIDTextFieldTextController,
                                  focusNode: _model.productIDTextFieldFocusNode,
                                  autofocus: false,
                                  readOnly: _model.isEdit,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: false,
                                    labelText: 'รหัสสินค้า',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 22.0,
                                          letterSpacing: 0.0,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 22.0,
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: _model.isEdit
                                        ? FlutterFlowTheme.of(context).alternate
                                        : FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 22.0,
                                        letterSpacing: 0.0,
                                      ),
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model
                                      .productIDTextFieldTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Builder(
                                          builder: (context) => InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: WebViewAware(
                                                      child:
                                                          CategorySettingViewWidget(),
                                                    ),
                                                  );
                                                },
                                              );

                                              safeSetState(() {});
                                            },
                                            child: Text(
                                              'จัดการหมวดหมู่',
                                              textAlign: TextAlign.end,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .link,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  FlutterFlowDropDown<String>(
                                    controller: _model
                                            .categoryDropDownValueController ??=
                                        FormFieldController<String>(
                                      _model.categoryDropDownValue ??=
                                          _model.isEdit
                                              ? _model.productDocument?.category
                                              : '',
                                    ),
                                    options:
                                        FFAppState().customerData.categoryList,
                                    onChanged: (val) => safeSetState(() =>
                                        _model.categoryDropDownValue = val),
                                    width: double.infinity,
                                    height: 56.0,
                                    searchHintTextStyle:
                                        FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                            ),
                                    searchTextStyle:
                                        FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 22.0,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText: 'เลือกหมวดหมู่',
                                    searchHintText: 'ค้นหาชื่อหมวด',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 1.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    hidesUnderline: true,
                                    isOverButton: false,
                                    isSearchable: true,
                                    isMultiSelect: false,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller:
                                      _model.productNameTextFieldTextController,
                                  focusNode:
                                      _model.productNameTextFieldFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: false,
                                    labelText: 'ชื่อสินค้า',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 22.0,
                                          letterSpacing: 0.0,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 22.0,
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 22.0,
                                        letterSpacing: 0.0,
                                      ),
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model
                                      .productNameTextFieldTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller:
                                      _model.startPriceTextFieldTextController,
                                  focusNode:
                                      _model.startPriceTextFieldFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: false,
                                    labelText: 'ราคาทุน',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 22.0,
                                          letterSpacing: 0.0,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 22.0,
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 22.0,
                                        letterSpacing: 0.0,
                                      ),
                                  keyboardType: TextInputType.number,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model
                                      .startPriceTextFieldTextControllerValidator
                                      .asValidator(context),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp('[0-9]'))
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller:
                                      _model.sellPriceTextFieldTextController,
                                  focusNode: _model.sellPriceTextFieldFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: false,
                                    labelText: 'ราคาขาย',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 22.0,
                                          letterSpacing: 0.0,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 22.0,
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 22.0,
                                        letterSpacing: 0.0,
                                      ),
                                  keyboardType: TextInputType.number,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model
                                      .sellPriceTextFieldTextControllerValidator
                                      .asValidator(context),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp('[0-9]'))
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller:
                                      _model.totalTextFieldTextController,
                                  focusNode: _model.totalTextFieldFocusNode,
                                  autofocus: false,
                                  readOnly: _model.isEdit,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: false,
                                    labelText: 'จำนวน',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 22.0,
                                          letterSpacing: 0.0,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 22.0,
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: _model.isEdit
                                        ? FlutterFlowTheme.of(context).alternate
                                        : FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 22.0,
                                        letterSpacing: 0.0,
                                      ),
                                  keyboardType: TextInputType.number,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model
                                      .totalTextFieldTextControllerValidator
                                      .asValidator(context),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp('[0-9]'))
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (_model.image != null &&
                                      _model.image != '')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 80.0,
                                            height: 80.0,
                                            child: Stack(
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await Navigator.push(
                                                      context,
                                                      PageTransition(
                                                        type: PageTransitionType
                                                            .fade,
                                                        child:
                                                            FlutterFlowExpandedImageView(
                                                          image: Image.network(
                                                            _model.image!,
                                                            fit: BoxFit.contain,
                                                            errorBuilder: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                Image.asset(
                                                              'assets/images/error_image.jpg',
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                          allowRotation: false,
                                                          tag: _model.image!,
                                                          useHeroAnimation:
                                                              true,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Hero(
                                                    tag: _model.image!,
                                                    transitionOnUserGestures:
                                                        true,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        _model.image!,
                                                        width: 80.0,
                                                        height: 80.0,
                                                        fit: BoxFit.cover,
                                                        errorBuilder: (context,
                                                                error,
                                                                stackTrace) =>
                                                            Image.asset(
                                                          'assets/images/error_image.jpg',
                                                          width: 80.0,
                                                          height: 80.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 2.0,
                                                                2.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        _model.isConfirm2 =
                                                            await action_blocks
                                                                .confirmBlock(
                                                          context,
                                                          title:
                                                              'ต้องการลบรูป?',
                                                        );
                                                        if (_model
                                                            .isConfirm2!) {
                                                          await _model
                                                              .productDocument!
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'photo':
                                                                    FieldValue
                                                                        .delete(),
                                                              },
                                                            ),
                                                          });
                                                          await FirebaseStorage
                                                              .instance
                                                              .refFromURL(
                                                                  _model.image!)
                                                              .delete();
                                                          _model.tmpImageList =
                                                              [];
                                                          _model.image = null;
                                                          safeSetState(() {});
                                                        }

                                                        safeSetState(() {});
                                                      },
                                                      child: Icon(
                                                        Icons.cancel_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        size: 24.0,
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
                                  if (_model.tmpImageList.isNotEmpty)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 80.0,
                                            height: 80.0,
                                            child: Stack(
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await Navigator.push(
                                                      context,
                                                      PageTransition(
                                                        type: PageTransitionType
                                                            .fade,
                                                        child:
                                                            FlutterFlowExpandedImageView(
                                                          image: Image.memory(
                                                            _model
                                                                    .tmpImageList
                                                                    .first
                                                                    .bytes ??
                                                                Uint8List
                                                                    .fromList(
                                                                        []),
                                                            fit: BoxFit.contain,
                                                          ),
                                                          allowRotation: false,
                                                          tag: 'imageTag2',
                                                          useHeroAnimation:
                                                              true,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Hero(
                                                    tag: 'imageTag2',
                                                    transitionOnUserGestures:
                                                        true,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.memory(
                                                        _model.tmpImageList
                                                                .first.bytes ??
                                                            Uint8List.fromList(
                                                                []),
                                                        width: 80.0,
                                                        height: 80.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 2.0,
                                                                2.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        _model.isConfirm =
                                                            await action_blocks
                                                                .confirmBlock(
                                                          context,
                                                          title:
                                                              'ต้องการลบรูป?',
                                                        );
                                                        if (_model.isConfirm!) {
                                                          _model.tmpImageList =
                                                              [];
                                                          safeSetState(() {});
                                                        }

                                                        safeSetState(() {});
                                                      },
                                                      child: Icon(
                                                        Icons.cancel_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        size: 24.0,
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
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () async {
                                          final selectedMedia =
                                              await selectMediaWithSourceBottomSheet(
                                            context: context,
                                            maxWidth: 600.00,
                                            imageQuality: 80,
                                            allowPhoto: true,
                                          );
                                          if (selectedMedia != null &&
                                              selectedMedia.every((m) =>
                                                  validateFileFormat(
                                                      m.storagePath,
                                                      context))) {
                                            safeSetState(() =>
                                                _model.isDataUploading = true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];

                                            try {
                                              selectedUploadedFiles =
                                                  selectedMedia
                                                      .map(
                                                          (m) => FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
                                                              ))
                                                      .toList();
                                            } finally {
                                              _model.isDataUploading = false;
                                            }
                                            if (selectedUploadedFiles.length ==
                                                selectedMedia.length) {
                                              safeSetState(() {
                                                _model.uploadedLocalFile =
                                                    selectedUploadedFiles.first;
                                              });
                                            } else {
                                              safeSetState(() {});
                                              return;
                                            }
                                          }

                                          if (_model.uploadedLocalFile !=
                                                  null &&
                                              (_model.uploadedLocalFile.bytes
                                                      ?.isNotEmpty ??
                                                  false)) {
                                            _model.image = null;
                                            _model.tmpImageList = [];
                                            _model.addToTmpImageList(
                                                _model.uploadedLocalFile);
                                            safeSetState(() {});
                                          }
                                          safeSetState(() {
                                            _model.isDataUploading = false;
                                            _model.uploadedLocalFile =
                                                FFUploadedFile(
                                                    bytes:
                                                        Uint8List.fromList([]));
                                          });
                                        },
                                        text: 'แนบรูป',
                                        icon: Icon(
                                          Icons.image_rounded,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller:
                                      _model.detailTextFieldTextController,
                                  focusNode: _model.detailTextFieldFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: false,
                                    labelText: 'รายละเอียด',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 22.0,
                                          letterSpacing: 0.0,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 22.0,
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 22.0,
                                        letterSpacing: 0.0,
                                      ),
                                  maxLines: 3,
                                  keyboardType: TextInputType.multiline,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model
                                      .detailTextFieldTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Builder(
                              builder: (context) => FFButtonWidget(
                                onPressed: () async {
                                  var _shouldSetState = false;
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }
                                  if (_model.categoryDropDownValue != null &&
                                      _model.categoryDropDownValue != '') {
                                    if (_model.isEdit) {
                                      if (_model.tmpImageList.isNotEmpty) {
                                        _model.urlList2 =
                                            await actions.uploadImageToFirebase(
                                          '${currentUserUid}/product',
                                          _model.tmpImageList.toList(),
                                          false,
                                        );
                                        _shouldSetState = true;
                                        _model.image = _model.urlList2?.first;
                                      }
                                      if (_model.image != null &&
                                          _model.image != '') {
                                        await _model.productDocument!.reference
                                            .update({
                                          ...createProductListRecordData(
                                            updateDate: getCurrentTimestamp,
                                            category:
                                                _model.categoryDropDownValue,
                                            name: _model
                                                .productNameTextFieldTextController
                                                .text,
                                            priceStart: double.tryParse(_model
                                                .startPriceTextFieldTextController
                                                .text),
                                            priceSell: double.tryParse(_model
                                                .sellPriceTextFieldTextController
                                                .text),
                                            detail: _model
                                                .detailTextFieldTextController
                                                .text,
                                            photo: _model.image,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'search_data':
                                                  functions.getKeywordList(
                                                      '${_model.productDocument?.productId} ${_model.categoryDropDownValue} ${_model.productNameTextFieldTextController.text} ${_model.startPriceTextFieldTextController.text} ${_model.sellPriceTextFieldTextController.text}'),
                                            },
                                          ),
                                        });

                                        await TransactionListRecord.createDoc(
                                                FFAppState()
                                                    .customerData
                                                    .customerRef!)
                                            .set({
                                          ...createTransactionListRecordData(
                                            createDate: getCurrentTimestamp,
                                            status: 1,
                                            type: 'แก้ไขสินค้า',
                                            totalAmount:
                                                _model.productDocument?.stock,
                                            totalPriceStart: functions.sumPrice(
                                                double.parse(_model
                                                    .startPriceTextFieldTextController
                                                    .text),
                                                _model.productDocument!.stock),
                                            totalPriceSell: functions.sumPrice(
                                                double.parse(_model
                                                    .sellPriceTextFieldTextController
                                                    .text),
                                                _model.productDocument!.stock),
                                            productRef: _model
                                                .productDocument?.reference,
                                            productName: _model
                                                .productNameTextFieldTextController
                                                .text,
                                            remark: 'แก้ไขสินค้า',
                                            totalRemain:
                                                _model.productDocument?.stock,
                                            currentPriceStart: double.tryParse(
                                                _model
                                                    .startPriceTextFieldTextController
                                                    .text),
                                            currentPriceSell: double.tryParse(_model
                                                .sellPriceTextFieldTextController
                                                .text),
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'keyword_list':
                                                  functions.getKeywordList(
                                                      '${_model.productDocument?.productId} ${_model.productNameTextFieldTextController.text}'),
                                            },
                                          ),
                                        });
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: WebViewAware(
                                                child: InfoCustomViewWidget(
                                                  title:
                                                      'แก้ไขสินค้าเรียบร้อยแล้ว',
                                                  status: 'success',
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: WebViewAware(
                                                child: InfoCustomViewWidget(
                                                  title: 'กรุณาแนบรูปสินค้า',
                                                  status: 'error',
                                                ),
                                              ),
                                            );
                                          },
                                        );

                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }
                                    } else {
                                      if (_model.tmpImageList.isNotEmpty) {
                                        _model.duplicateProductResult =
                                            await queryProductListRecordOnce(
                                          parent: FFAppState()
                                              .customerData
                                              .customerRef,
                                          queryBuilder: (productListRecord) =>
                                              productListRecord.where(
                                            'product_id',
                                            isEqualTo: _model
                                                .productIDTextFieldTextController
                                                .text,
                                          ),
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);
                                        _shouldSetState = true;
                                        if (_model.duplicateProductResult
                                                ?.reference ==
                                            null) {
                                          _model.urlList = await actions
                                              .uploadImageToFirebase(
                                            '${currentUserUid}/product',
                                            _model.tmpImageList.toList(),
                                            false,
                                          );
                                          _shouldSetState = true;

                                          var productListRecordReference =
                                              ProductListRecord.createDoc(
                                                  FFAppState()
                                                      .customerData
                                                      .customerRef!);
                                          await productListRecordReference.set({
                                            ...createProductListRecordData(
                                              createDate: getCurrentTimestamp,
                                              status: 1,
                                              productId: _model
                                                  .productIDTextFieldTextController
                                                  .text,
                                              category:
                                                  _model.categoryDropDownValue,
                                              name: _model
                                                  .productNameTextFieldTextController
                                                  .text,
                                              stock: int.tryParse(_model
                                                  .totalTextFieldTextController
                                                  .text),
                                              priceStart: double.tryParse(_model
                                                  .startPriceTextFieldTextController
                                                  .text),
                                              priceSell: double.tryParse(_model
                                                  .sellPriceTextFieldTextController
                                                  .text),
                                              detail: _model
                                                  .detailTextFieldTextController
                                                  .text,
                                              photo: _model.urlList?.first,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'search_data':
                                                    functions.getKeywordList(
                                                        '${_model.productIDTextFieldTextController.text} ${_model.categoryDropDownValue} ${_model.productNameTextFieldTextController.text} ${_model.startPriceTextFieldTextController.text} ${_model.sellPriceTextFieldTextController.text}'),
                                              },
                                            ),
                                          });
                                          _model.insertedProduct =
                                              ProductListRecord
                                                  .getDocumentFromData({
                                            ...createProductListRecordData(
                                              createDate: getCurrentTimestamp,
                                              status: 1,
                                              productId: _model
                                                  .productIDTextFieldTextController
                                                  .text,
                                              category:
                                                  _model.categoryDropDownValue,
                                              name: _model
                                                  .productNameTextFieldTextController
                                                  .text,
                                              stock: int.tryParse(_model
                                                  .totalTextFieldTextController
                                                  .text),
                                              priceStart: double.tryParse(_model
                                                  .startPriceTextFieldTextController
                                                  .text),
                                              priceSell: double.tryParse(_model
                                                  .sellPriceTextFieldTextController
                                                  .text),
                                              detail: _model
                                                  .detailTextFieldTextController
                                                  .text,
                                              photo: _model.urlList?.first,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'search_data':
                                                    functions.getKeywordList(
                                                        '${_model.productIDTextFieldTextController.text} ${_model.categoryDropDownValue} ${_model.productNameTextFieldTextController.text} ${_model.startPriceTextFieldTextController.text} ${_model.sellPriceTextFieldTextController.text}'),
                                              },
                                            ),
                                          }, productListRecordReference);
                                          _shouldSetState = true;

                                          await TransactionListRecord.createDoc(
                                                  FFAppState()
                                                      .customerData
                                                      .customerRef!)
                                              .set({
                                            ...createTransactionListRecordData(
                                              createDate: getCurrentTimestamp,
                                              status: 1,
                                              type: 'นำเข้า',
                                              totalAmount: int.tryParse(_model
                                                  .totalTextFieldTextController
                                                  .text),
                                              totalPriceStart: functions.sumPrice(
                                                  double.parse(_model
                                                      .startPriceTextFieldTextController
                                                      .text),
                                                  int.parse(_model
                                                      .totalTextFieldTextController
                                                      .text)),
                                              totalPriceSell: functions.sumPrice(
                                                  double.parse(_model
                                                      .sellPriceTextFieldTextController
                                                      .text),
                                                  int.parse(_model
                                                      .totalTextFieldTextController
                                                      .text)),
                                              productRef: _model
                                                  .insertedProduct?.reference,
                                              productName: _model
                                                  .productNameTextFieldTextController
                                                  .text,
                                              remark: 'นำเข้าสินค้าใหม่',
                                              totalRemain: int.tryParse(_model
                                                  .totalTextFieldTextController
                                                  .text),
                                              currentPriceStart:
                                                  double.tryParse(_model
                                                      .startPriceTextFieldTextController
                                                      .text),
                                              currentPriceSell: double.tryParse(
                                                  _model
                                                      .sellPriceTextFieldTextController
                                                      .text),
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'keyword_list':
                                                    functions.getKeywordList(
                                                        '${_model.productIDTextFieldTextController.text} ${_model.productNameTextFieldTextController.text}'),
                                              },
                                            ),
                                          });
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: WebViewAware(
                                                  child: InfoCustomViewWidget(
                                                    title:
                                                        'นำเข้าสินค้าเรียบร้อยแล้ว',
                                                    status: 'success',
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: WebViewAware(
                                                  child: InfoCustomViewWidget(
                                                    title: 'รหัสสินค้าซ้ำ',
                                                    status: 'error',
                                                  ),
                                                ),
                                              );
                                            },
                                          );

                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: WebViewAware(
                                                child: InfoCustomViewWidget(
                                                  title: 'กรุณาแนบรูปสินค้า',
                                                  status: 'error',
                                                ),
                                              ),
                                            );
                                          },
                                        );

                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }
                                    }

                                    Navigator.pop(context, 'update');
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: WebViewAware(
                                            child: InfoCustomViewWidget(
                                              title: 'กรุณาเลือกหมวดหมู่',
                                              status: 'error',
                                            ),
                                          ),
                                        );
                                      },
                                    );

                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }

                                  if (_shouldSetState) safeSetState(() {});
                                },
                                text: 'บันทึกข้อมูล',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 55.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        fontSize: 22.0,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]
                      .addToStart(SizedBox(height: 8.0))
                      .addToEnd(SizedBox(height: 180.0)),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
