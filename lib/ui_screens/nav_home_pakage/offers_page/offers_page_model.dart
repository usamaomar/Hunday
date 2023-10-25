import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui_screens/components/bottom_nav_bar_component/bottom_nav_bar_component_widget.dart';
import '/ui_screens/components/hynday_app_bar/hynday_app_bar_widget.dart';
import 'offers_page_widget.dart' show OffersPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OffersPageModel extends FlutterFlowModel<OffersPageWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  List<dynamic> localJsonList = [];
  void addToLocalJsonList(dynamic item) => localJsonList.add(item);
  void removeFromLocalJsonList(dynamic item) => localJsonList.remove(item);
  void removeAtIndexFromLocalJsonList(int index) =>
      localJsonList.removeAt(index);
  void insertAtIndexInLocalJsonList(int index, dynamic item) =>
      localJsonList.insert(index, item);
  void updateLocalJsonListAtIndex(int index, Function(dynamic) updateFn) =>
      localJsonList[index] = updateFn(localJsonList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (OfferApi)] action in OffersPage widget.
  ApiCallResponse? apiResultz7m;
  // Model for HyndayAppBar component.
  late HyndayAppBarModel hyndayAppBarModel;
  // Model for BottomNavBarComponent component.
  late BottomNavBarComponentModel bottomNavBarComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    hyndayAppBarModel = createModel(context, () => HyndayAppBarModel());
    bottomNavBarComponentModel =
        createModel(context, () => BottomNavBarComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    hyndayAppBarModel.dispose();
    bottomNavBarComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
