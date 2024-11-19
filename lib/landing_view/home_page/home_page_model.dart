import '/auth/firebase_auth/auth_util.dart';
import '/authen_view/main_background_view/main_background_view_widget.dart';
import '/backend/backend.dart';
import '/component/info_custom_view/info_custom_view_widget.dart';
import '/component/select_month_and_year_to_export_view/select_month_and_year_to_export_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/product_view/manage_stock_view/manage_stock_view_widget.dart';
import '/walkthroughs/add_product.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  bool isLoading = true;

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? addProductController;
  // Model for MainBackgroundView component.
  late MainBackgroundViewModel mainBackgroundViewModel;
  // Stores action output result for [Action Block - checkIsExpire] action in Container widget.
  bool? isExpire;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  int? totalProduct;
  // Stores action output result for [Action Block - checkIsExpire] action in Container widget.
  bool? isExpire2;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  int? totalProduct2;
  // Stores action output result for [Action Block - checkIsExpire] action in Container widget.
  bool? isExpire3;
  // Stores action output result for [Action Block - checkIsExpire] action in Container widget.
  bool? isExpire4;
  // Stores action output result for [Action Block - checkIsExpire] action in Container widget.
  bool? isExpire5;
  // Stores action output result for [Custom Action - exportProductExcel] action in Container widget.
  String? path;
  // Stores action output result for [Action Block - checkIsExpire] action in Container widget.
  bool? isExpire6;

  @override
  void initState(BuildContext context) {
    mainBackgroundViewModel =
        createModel(context, () => MainBackgroundViewModel());
  }

  @override
  void dispose() {
    addProductController?.finish();
    mainBackgroundViewModel.dispose();
  }

  /// Action blocks.
  Future<bool?> checkIsExpire(BuildContext context) async {
    if (getCurrentTimestamp > FFAppState().customerData.expireDate!) {
      await showDialog(
        context: context,
        builder: (dialogContext) {
          return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            child: WebViewAware(
              child: InfoCustomViewWidget(
                title: 'ขออภัยบัญชีของท่านหมดอายุการใช้งาน',
                status: 'error',
                detail:
                    'กรุณาต่ออายุการใช้งาน ดูรายละเอียดเพิ่มเติมได้ที่เมนู \"ตั้งค่า\" > \"ต่ออายุการใช้งาน\"',
              ),
            ),
          );
        },
      );

      return true;
    } else {
      return false;
    }
  }
}
