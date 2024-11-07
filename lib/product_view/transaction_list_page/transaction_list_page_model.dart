import '/authen_view/main_background_view/main_background_view_widget.dart';
import '/backend/backend.dart';
import '/component/back_button_view/back_button_view_widget.dart';
import '/component/loading_view/loading_view_widget.dart';
import '/component/no_data_view/no_data_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/product_view/product_form_view/product_form_view_widget.dart';
import '/product_view/transasction_detail_view/transasction_detail_view_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'transaction_list_page_widget.dart' show TransactionListPageWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class TransactionListPageModel
    extends FlutterFlowModel<TransactionListPageWidget> {
  ///  Local state fields for this page.

  bool isLoading = true;

  bool isSearched = false;

  DateTime? startDate;

  DateTime? endDate;

  ///  State fields for stateful widgets in this page.

  // Model for MainBackgroundView component.
  late MainBackgroundViewModel mainBackgroundViewModel;
  // Model for BackButtonView component.
  late BackButtonViewModel backButtonViewModel;
  DateTime? datePicked;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for LoadingView component.
  late LoadingViewModel loadingViewModel;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, TransactionListRecord>?
      listViewPagingController1;
  Query? listViewPagingQuery1;
  List<StreamSubscription?> listViewStreamSubscriptions1 = [];

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, TransactionListRecord>?
      listViewPagingController2;
  Query? listViewPagingQuery2;
  List<StreamSubscription?> listViewStreamSubscriptions2 = [];

  @override
  void initState(BuildContext context) {
    mainBackgroundViewModel =
        createModel(context, () => MainBackgroundViewModel());
    backButtonViewModel = createModel(context, () => BackButtonViewModel());
    loadingViewModel = createModel(context, () => LoadingViewModel());
  }

  @override
  void dispose() {
    mainBackgroundViewModel.dispose();
    backButtonViewModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    loadingViewModel.dispose();
    listViewStreamSubscriptions1.forEach((s) => s?.cancel());
    listViewPagingController1?.dispose();

    listViewStreamSubscriptions2.forEach((s) => s?.cancel());
    listViewPagingController2?.dispose();
  }

  /// Action blocks.
  Future editProductBlock(
    BuildContext context, {
    required ProductListRecord? productDocument,
  }) async {
    String? isUpdate;

    await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      useSafeArea: true,
      context: context,
      builder: (context) {
        return WebViewAware(
          child: Padding(
            padding: MediaQuery.viewInsetsOf(context),
            child: ProductFormViewWidget(
              productDocument: productDocument,
            ),
          ),
        );
      },
    ).then((value) => isUpdate = value);

    if ((isUpdate != null && isUpdate != '') && (isUpdate == 'update')) {
      await actions.pushReplacement(
        context,
        'ProductListPage',
      );
    }
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, TransactionListRecord>
      setListViewController1(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController1 ??= _createListViewController1(query, parent);
    if (listViewPagingQuery1 != query) {
      listViewPagingQuery1 = query;
      listViewPagingController1?.refresh();
    }
    return listViewPagingController1!;
  }

  PagingController<DocumentSnapshot?, TransactionListRecord>
      _createListViewController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, TransactionListRecord>(
            firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryTransactionListRecordPage(
          parent: parent,
          queryBuilder: (_) => listViewPagingQuery1 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions1,
          controller: controller,
          pageSize: 15,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, TransactionListRecord>
      setListViewController2(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController2 ??= _createListViewController2(query, parent);
    if (listViewPagingQuery2 != query) {
      listViewPagingQuery2 = query;
      listViewPagingController2?.refresh();
    }
    return listViewPagingController2!;
  }

  PagingController<DocumentSnapshot?, TransactionListRecord>
      _createListViewController2(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, TransactionListRecord>(
            firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryTransactionListRecordPage(
          parent: parent,
          queryBuilder: (_) => listViewPagingQuery2 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions2,
          controller: controller,
          pageSize: 15,
          isStream: true,
        ),
      );
  }
}
