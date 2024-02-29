import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui_screens/components/hynday_app_bar/hynday_app_bar_widget.dart';
import '/ui_screens/components/modal06_basic_information/modal06_basic_information_widget.dart';
import '/ui_screens/nav_pakege/cart_bottom_sheet/cart_bottom_sheet_widget.dart';
import '/backend/schema/structs/index.dart';
import 'item_details_page_widget.dart' show ItemDetailsPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ItemDetailsPageModel extends FlutterFlowModel<ItemDetailsPageWidget> {
  ///  Local state fields for this page.

  PartModelStruct? localMyPart;
  void updateLocalMyPartStruct(Function(PartModelStruct) updateFn) =>
      updateFn(localMyPart ??= PartModelStruct());

  bool allowToUpdate = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (AddToCartApi)] action in Button widget.
  ApiCallResponse? apiResulto0l;
  // Model for HyndayAppBar component.
  late HyndayAppBarModel hyndayAppBarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    hyndayAppBarModel = createModel(context, () => HyndayAppBarModel());
  }

  @override
  void dispose() {
    hyndayAppBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
