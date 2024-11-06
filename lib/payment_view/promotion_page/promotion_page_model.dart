import '/component/back_button_view/back_button_view_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/payment_view/payment_view/payment_view_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'promotion_page_widget.dart' show PromotionPageWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PromotionPageModel extends FlutterFlowModel<PromotionPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BackButtonView component.
  late BackButtonViewModel backButtonViewModel;

  @override
  void initState(BuildContext context) {
    backButtonViewModel = createModel(context, () => BackButtonViewModel());
  }

  @override
  void dispose() {
    backButtonViewModel.dispose();
  }
}
