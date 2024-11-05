import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import '/actions/actions.dart' as action_blocks;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'category_setting_view_model.dart';
export 'category_setting_view_model.dart';

class CategorySettingViewWidget extends StatefulWidget {
  const CategorySettingViewWidget({super.key});

  @override
  State<CategorySettingViewWidget> createState() =>
      _CategorySettingViewWidgetState();
}

class _CategorySettingViewWidgetState extends State<CategorySettingViewWidget>
    with TickerProviderStateMixin {
  late CategorySettingViewModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategorySettingViewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.tmpCatagoryList =
          FFAppState().customerData.categoryList.toList().cast<String>();
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(-5.0, -5.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
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
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 32.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: Text(
                          'จัดการหมวดหมู่',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 22.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 0.0),
                                    child: Container(
                                      width: 200.0,
                                      child: TextFormField(
                                        controller: _model.textController,
                                        focusNode: _model.textFieldFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    fontSize: 22.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: 'ชื่อหมวดหมู่',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    fontSize: 22.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
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
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .textControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    if (_model.textController.text != null &&
                                        _model.textController.text != '') {
                                      if (!_model.tmpCatagoryList.contains(
                                          _model.textController.text)) {
                                        _model.addToTmpCatagoryList(
                                            _model.textController.text);

                                        await FFAppState()
                                            .customerData
                                            .customerRef!
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'category_list':
                                                  _model.tmpCatagoryList,
                                            },
                                          ),
                                        });
                                        FFAppState().updateCustomerDataStruct(
                                          (e) => e
                                            ..categoryList =
                                                _model.tmpCatagoryList.toList(),
                                        );
                                        safeSetState(() {
                                          _model.textController?.clear();
                                        });
                                      }
                                    }
                                  },
                                  text: 'เพิ่ม',
                                  options: FFButtonOptions(
                                    height: 56.0,
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
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (_model.tmpCatagoryList.isNotEmpty)
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      '(แตะเพื่อลบ)',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                                FlutterFlowChoiceChips(
                                  options: _model.tmpCatagoryList
                                      .map((label) => ChipData(label))
                                      .toList(),
                                  onChanged: (val) async {
                                    safeSetState(() => _model.choiceChipsValue =
                                        val?.firstOrNull);
                                    _model.isConfirm =
                                        await action_blocks.confirmBlock(
                                      context,
                                      title: 'ต้องการลบหมวดนี้?',
                                    );
                                    if (_model.isConfirm!) {
                                      _model.removeFromTmpCatagoryList(
                                          _model.choiceChipsValue!);

                                      await FFAppState()
                                          .customerData
                                          .customerRef!
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'category_list':
                                                _model.tmpCatagoryList,
                                          },
                                        ),
                                      });
                                      FFAppState().updateCustomerDataStruct(
                                        (e) => e
                                          ..categoryList =
                                              _model.tmpCatagoryList.toList(),
                                      );
                                      safeSetState(() {});
                                    }

                                    safeSetState(() {});
                                  },
                                  selectedChipStyle: ChipStyle(
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 22.0,
                                          letterSpacing: 0.0,
                                        ),
                                    iconColor: Color(0x00000000),
                                    iconSize: 16.0,
                                    labelPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16.0, 8.0, 16.0, 8.0),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  unselectedChipStyle: ChipStyle(
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 22.0,
                                          letterSpacing: 0.0,
                                        ),
                                    iconColor: Color(0x00000000),
                                    iconSize: 16.0,
                                    labelPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16.0, 8.0, 16.0, 8.0),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  chipSpacing: 8.0,
                                  rowSpacing: 8.0,
                                  multiselect: false,
                                  alignment: WrapAlignment.start,
                                  controller:
                                      _model.choiceChipsValueController ??=
                                          FormFieldController<List<String>>(
                                    [],
                                  ),
                                  wrapped: true,
                                ),
                              ],
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
