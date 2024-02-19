import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui_screens/components/add_component_shoping_details/add_component_shoping_details_widget.dart';
import '/ui_screens/components/hynday_app_bar/hynday_app_bar_widget.dart';
import '/ui_screens/components/shop_list_item_component/shop_list_item_component_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'shop_page_widget.dart' show ShopPageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class ShopPageModel extends FlutterFlowModel<ShopPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for HyndayAppBar component.
  late HyndayAppBarModel hyndayAppBarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall;

  // Models for ShopListItemComponent dynamic component.
  late FlutterFlowDynamicModels<ShopListItemComponentModel>
      shopListItemComponentModels;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    hyndayAppBarModel = createModel(context, () => HyndayAppBarModel());
    shopListItemComponentModels =
        FlutterFlowDynamicModels(() => ShopListItemComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    hyndayAppBarModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    listViewPagingController?.dispose();
    shopListItemComponentModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<ApiPagingParams, dynamic> setListViewController(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall = apiCall;
    return listViewPagingController ??= _createListViewController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewPartsCategoryApiPage);
  }

  void listViewPartsCategoryApiPage(ApiPagingParams nextPageMarker) =>
      listViewApiCall!(nextPageMarker).then((listViewPartsCategoryApiResponse) {
        final pageItems = (getJsonField(
                  listViewPartsCategoryApiResponse.jsonBody,
                  r'''$.PartsCategory.data''',
                ) ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewPartsCategoryApiResponse,
                )
              : null,
        );
      });
}
