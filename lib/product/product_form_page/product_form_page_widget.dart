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
import 'product_form_page_model.dart';
export 'product_form_page_model.dart';

class ProductFormPageWidget extends StatefulWidget {
  const ProductFormPageWidget({
    super.key,
    this.productDocument,
  });

  final ProductListRecord? productDocument;

  @override
  State<ProductFormPageWidget> createState() => _ProductFormPageWidgetState();
}

class _ProductFormPageWidgetState extends State<ProductFormPageWidget> {
  late ProductFormPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductFormPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.rsCate = await queryCategoryListRecordOnce(
        queryBuilder: (categoryListRecord) => categoryListRecord.where(
          'create_by',
          isEqualTo: currentUserReference,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.rsCate != null) {
        setState(() {
          _model.cateList = _model.rsCate!.nameList.toList().cast<String>();
        });
        if (widget.productDocument != null) {
          setState(() {
            _model.textFieldProductCodeController?.text =
                widget.productDocument!.productId;
          });
          setState(() {
            _model.dropDownValueController?.value =
                widget.productDocument!.category;
          });
          setState(() {
            _model.textFieldProductNameController?.text =
                widget.productDocument!.name;
          });
          setState(() {
            _model.textFieldProductStockController?.text =
                widget.productDocument!.stock.toString();
          });
          setState(() {
            _model.textFieldProductStartPriceController?.text =
                widget.productDocument!.priceStart.toString();
          });
          setState(() {
            _model.textFieldProductSellPriceController?.text =
                widget.productDocument!.priceSell.toString();
          });
          setState(() {
            _model.textFieldProductDetailController?.text =
                widget.productDocument!.detail;
          });
          if (widget.productDocument?.photo != null &&
              widget.productDocument?.photo != '') {
            setState(() {
              _model.image = widget.productDocument?.photo;
            });
          }
        }
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                title: Text('กรุณาเพิ่มหมวดหมู่สินค้า'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('ตกลง'),
                  ),
                ],
              ),
            );
          },
        );
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          useSafeArea: true,
          context: context,
          builder: (context) {
            return WebViewAware(
              child: GestureDetector(
                onTap: () => _model.unfocusNode.canRequestFocus
                    ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                    : FocusScope.of(context).unfocus(),
                child: Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: CategoryViewWidget(),
                ),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));

        setState(() {});
      }
    });

    _model.textFieldProductCodeController ??= TextEditingController();
    _model.textFieldProductCodeFocusNode ??= FocusNode();

    _model.textFieldProductNameController ??= TextEditingController();
    _model.textFieldProductNameFocusNode ??= FocusNode();

    _model.textFieldProductStartPriceController ??= TextEditingController();
    _model.textFieldProductStartPriceFocusNode ??= FocusNode();

    _model.textFieldProductSellPriceController ??= TextEditingController();
    _model.textFieldProductSellPriceFocusNode ??= FocusNode();

    _model.textFieldProductStockController ??= TextEditingController();
    _model.textFieldProductStockFocusNode ??= FocusNode();

    _model.textFieldProductDetailController ??= TextEditingController();
    _model.textFieldProductDetailFocusNode ??= FocusNode();
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
            widget.productDocument != null ? 'แก้ไขสินค้า' : 'เพิ่มสินค้าใหม่',
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
              Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: TextFormField(
                            controller: _model.textFieldProductCodeController,
                            focusNode: _model.textFieldProductCodeFocusNode,
                            readOnly: widget.productDocument != null,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'รหัสสินค้า',
                              labelStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: widget.productDocument != null
                                  ? FlutterFlowTheme.of(context).alternate
                                  : FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model
                                .textFieldProductCodeControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              StreamBuilder<List<CategoryListRecord>>(
                                stream: queryCategoryListRecord(
                                  queryBuilder: (categoryListRecord) =>
                                      categoryListRecord.where(
                                    'create_by',
                                    isEqualTo: currentUserReference,
                                  ),
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<CategoryListRecord>
                                      columnCategoryListRecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final columnCategoryListRecord =
                                      columnCategoryListRecordList.isNotEmpty
                                          ? columnCategoryListRecordList.first
                                          : null;
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (columnCategoryListRecord != null)
                                        FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .dropDownValueController ??=
                                              FormFieldController<String>(null),
                                          options: columnCategoryListRecord!
                                              .nameList,
                                          onChanged: (val) => setState(
                                              () => _model.dropDownValue = val),
                                          width: double.infinity,
                                          height: 50.0,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                          hintText: 'เลือกหมวดหมู่',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          borderWidth: 2.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 16.0, 4.0),
                                          hidesUnderline: true,
                                          isOverButton: true,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ),
                                    ],
                                  );
                                },
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        useSafeArea: true,
                                        context: context,
                                        builder: (context) {
                                          return WebViewAware(
                                            child: GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: CategoryViewWidget(),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));

                                      setState(() {});
                                    },
                                    child: Text(
                                      'จัดการหมวดหมู่',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
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
                          child: TextFormField(
                            controller: _model.textFieldProductNameController,
                            focusNode: _model.textFieldProductNameFocusNode,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'ชื่อสินค้า',
                              labelStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model
                                .textFieldProductNameControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: TextFormField(
                            controller:
                                _model.textFieldProductStartPriceController,
                            focusNode:
                                _model.textFieldProductStartPriceFocusNode,
                            textCapitalization: TextCapitalization.none,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'ราคาทุน',
                              labelStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            validator: _model
                                .textFieldProductStartPriceControllerValidator
                                .asValidator(context),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp('^[0-9.]+\$'))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: TextFormField(
                            controller:
                                _model.textFieldProductSellPriceController,
                            focusNode:
                                _model.textFieldProductSellPriceFocusNode,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'ราคาขาย',
                              labelStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            validator: _model
                                .textFieldProductSellPriceControllerValidator
                                .asValidator(context),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp('^[0-9.]+\$'))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: TextFormField(
                            controller: _model.textFieldProductStockController,
                            focusNode: _model.textFieldProductStockFocusNode,
                            readOnly: widget.productDocument != null,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: widget.productDocument != null
                                  ? 'คงเหลือ'
                                  : 'จำนวน',
                              labelStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: widget.productDocument != null
                                  ? FlutterFlowTheme.of(context).alternate
                                  : FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            keyboardType: TextInputType.number,
                            validator: _model
                                .textFieldProductStockControllerValidator
                                .asValidator(context),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: TextFormField(
                            controller: _model.textFieldProductDetailController,
                            focusNode: _model.textFieldProductDetailFocusNode,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'รายละเอียดสินค้า',
                              labelStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            maxLines: 3,
                            validator: _model
                                .textFieldProductDetailControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (_model.image != null && _model.image != '')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 8.0, 0.0),
                                  child: Container(
                                    width: 80.0,
                                    height: 80.0,
                                    child: Stack(
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                child:
                                                    FlutterFlowExpandedImageView(
                                                  image: Image.network(
                                                    _model.image!,
                                                    fit: BoxFit.contain,
                                                  ),
                                                  allowRotation: false,
                                                  tag: _model.image!,
                                                  useHeroAnimation: true,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Hero(
                                            tag: _model.image!,
                                            transitionOnUserGestures: true,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                _model.image!,
                                                width: 80.0,
                                                height: 80.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 4.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await FirebaseStorage.instance
                                                    .refFromURL(_model.image!)
                                                    .delete();
                                                setState(() {
                                                  _model.image = null;
                                                });
                                              },
                                              child: Icon(
                                                Icons.cancel_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              if (_model.image == null || _model.image == '')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 8.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      setState(() {
                                        _model.isUploading = true;
                                      });
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
                                                  m.storagePath, context))) {
                                        setState(() =>
                                            _model.isDataUploading = true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        var downloadUrls = <String>[];
                                        try {
                                          selectedUploadedFiles = selectedMedia
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height:
                                                        m.dimensions?.height,
                                                    width: m.dimensions?.width,
                                                    blurHash: m.blurHash,
                                                  ))
                                              .toList();

                                          downloadUrls = (await Future.wait(
                                            selectedMedia.map(
                                              (m) async => await uploadData(
                                                  m.storagePath, m.bytes),
                                            ),
                                          ))
                                              .where((u) => u != null)
                                              .map((u) => u!)
                                              .toList();
                                        } finally {
                                          _model.isDataUploading = false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                                selectedMedia.length &&
                                            downloadUrls.length ==
                                                selectedMedia.length) {
                                          setState(() {
                                            _model.uploadedLocalFile =
                                                selectedUploadedFiles.first;
                                            _model.uploadedFileUrl =
                                                downloadUrls.first;
                                          });
                                        } else {
                                          setState(() {});
                                          return;
                                        }
                                      }

                                      if (_model.uploadedFileUrl != null &&
                                          _model.uploadedFileUrl != '') {
                                        setState(() {
                                          _model.image = _model.uploadedFileUrl;
                                        });
                                        setState(() {
                                          _model.isDataUploading = false;
                                          _model.uploadedLocalFile =
                                              FFUploadedFile(
                                                  bytes:
                                                      Uint8List.fromList([]));
                                          _model.uploadedFileUrl = '';
                                        });
                                      }
                                      setState(() {
                                        _model.isUploading = false;
                                      });
                                    },
                                    child: Container(
                                      width: 80.0,
                                      height: 80.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.image_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 36.0,
                                      ),
                                    ),
                                  ),
                                ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: Text(
                                        'อัพโหลดภาพสินค้า รองรับ .jpg, .png จำกัดจำนวน 1 รูป',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (_model.formKey.currentState == null ||
                                  !_model.formKey.currentState!.validate()) {
                                return;
                              }
                              if (_model.dropDownValue == null) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        title: Text('เลือกหมวดหมู่'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('ตกลง'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                                return;
                              }
                              if (widget.productDocument != null) {
                                await widget.productDocument!.reference
                                    .update(createProductListRecordData(
                                  updateDate: getCurrentTimestamp,
                                  name: _model
                                      .textFieldProductNameController.text,
                                  photo: _model.image,
                                  category: _model.dropDownValue,
                                  priceStart: double.tryParse(_model
                                      .textFieldProductStartPriceController
                                      .text),
                                  priceSell: double.tryParse(_model
                                      .textFieldProductSellPriceController
                                      .text),
                                  detail: _model
                                      .textFieldProductDetailController.text,
                                ));
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        title:
                                            Text('บันทึกข้อมูลเรียบร้อยแล้ว'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('ตกลง'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                                await actions.pushReplacementNamed(
                                  context,
                                  'HomePage',
                                );
                              } else {
                                _model.isDuplicate =
                                    await queryProductListRecordOnce(
                                  queryBuilder: (productListRecord) =>
                                      productListRecord
                                          .where(
                                            'create_by',
                                            isEqualTo: currentUserReference,
                                          )
                                          .where(
                                            'product_id',
                                            isEqualTo: _model
                                                .textFieldProductCodeController
                                                .text,
                                          ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                if (_model.isDuplicate != null) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          title: Text('รหัสสินค้าซ้ำ'),
                                          content: Text(
                                              'ชื่อสินค้า : ${_model.isDuplicate?.name}หมวด : ${_model.isDuplicate?.category}'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  var productListRecordReference =
                                      ProductListRecord.collection.doc();
                                  await productListRecordReference
                                      .set(createProductListRecordData(
                                    createDate: getCurrentTimestamp,
                                    createBy: currentUserReference,
                                    status: 1,
                                    productId: _model
                                        .textFieldProductCodeController.text,
                                    name: _model
                                        .textFieldProductNameController.text,
                                    category: _model.dropDownValue,
                                    stock: int.tryParse(_model
                                        .textFieldProductStockController.text),
                                    photo: _model.image,
                                    updateDate: getCurrentTimestamp,
                                    priceStart: double.tryParse(_model
                                        .textFieldProductStartPriceController
                                        .text),
                                    priceSell: double.tryParse(_model
                                        .textFieldProductSellPriceController
                                        .text),
                                    detail: _model
                                        .textFieldProductDetailController.text,
                                  ));
                                  _model.insertedProduct =
                                      ProductListRecord.getDocumentFromData(
                                          createProductListRecordData(
                                            createDate: getCurrentTimestamp,
                                            createBy: currentUserReference,
                                            status: 1,
                                            productId: _model
                                                .textFieldProductCodeController
                                                .text,
                                            name: _model
                                                .textFieldProductNameController
                                                .text,
                                            category: _model.dropDownValue,
                                            stock: int.tryParse(_model
                                                .textFieldProductStockController
                                                .text),
                                            photo: _model.image,
                                            updateDate: getCurrentTimestamp,
                                            priceStart: double.tryParse(_model
                                                .textFieldProductStartPriceController
                                                .text),
                                            priceSell: double.tryParse(_model
                                                .textFieldProductSellPriceController
                                                .text),
                                            detail: _model
                                                .textFieldProductDetailController
                                                .text,
                                          ),
                                          productListRecordReference);

                                  await TranferListRecord.collection
                                      .doc()
                                      .set(createTranferListRecordData(
                                        createDate: getCurrentTimestamp,
                                        createBy: currentUserReference,
                                        status: 1,
                                        type: 'รับ',
                                        totalAmount: int.tryParse(_model
                                            .textFieldProductStockController
                                            .text),
                                        totalPriceStart: functions.sumPrice(
                                            double.parse(_model
                                                .textFieldProductStartPriceController
                                                .text),
                                            int.parse(_model
                                                .textFieldProductStockController
                                                .text)),
                                        totalPriceSell: functions.sumPrice(
                                            double.parse(_model
                                                .textFieldProductSellPriceController
                                                .text),
                                            int.parse(_model
                                                .textFieldProductStockController
                                                .text)),
                                        productRef:
                                            _model.insertedProduct?.reference,
                                        productName: _model
                                            .textFieldProductNameController
                                            .text,
                                        productId: _model
                                            .textFieldProductCodeController
                                            .text,
                                        remark: 'เพิ่มสินค้าใหม่',
                                        productCate: _model.dropDownValue,
                                        totalRemain: int.tryParse(_model
                                            .textFieldProductStockController
                                            .text),
                                      ));
                                  if (valueOrDefault<bool>(
                                      currentUserDocument?.isFirstTime,
                                      false)) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            title: Text(
                                                'บันทึกข้อมูลเรียบร้อยแล้ว'),
                                            content: Text(
                                                'พิเศษบัญชีของท่านได้รับสิทธิ์ใช้ฟรี 90 วัน!'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('ตกลง'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );

                                    await currentUserReference!
                                        .update(createUsersRecordData(
                                      isFirstTime: false,
                                      expireDate: functions.getNextDay(90),
                                    ));
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            title: Text(
                                                'บันทึกข้อมูลเรียบร้อยแล้ว'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('ตกลง'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  }

                                  await actions.pushReplacementNamed(
                                    context,
                                    'HomePage',
                                  );
                                }
                              }

                              setState(() {});
                            },
                            text: 'บันทึกข้อมูล',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 40.0,
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
                        if (widget.productDocument != null)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                title: Text(
                                                    'ยืนยันการลบ \"${widget.productDocument?.name}\" ?'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            false),
                                                    child: Text('ยกเลิก'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            true),
                                                    child: Text('ยืนยัน'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ) ??
                                        false;
                                if (confirmDialogResponse) {
                                  await widget.productDocument!.reference
                                      .delete();
                                  await actions.pushReplacementNamed(
                                    context,
                                    'HomePage',
                                  );
                                }
                              },
                              text: 'ลบสินค้า',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).error,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Colors.white,
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
                      ]
                          .addToStart(SizedBox(height: 16.0))
                          .addToEnd(SizedBox(height: 16.0)),
                    ),
                  ),
                ),
              ),
              if (_model.isUploading)
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0x44000000),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          'assets/lottie_animations/Animation_-_1709005578891.json',
                          width: 150.0,
                          height: 130.0,
                          fit: BoxFit.cover,
                          animate: true,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
