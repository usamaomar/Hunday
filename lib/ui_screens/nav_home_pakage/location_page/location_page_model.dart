import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui_screens/components/hynday_app_bar/hynday_app_bar_widget.dart';
import '/ui_screens/nav_home_pakage/empty_list_component/empty_list_component_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'location_page_widget.dart' show LocationPageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationPageModel extends FlutterFlowModel<LocationPageWidget> {
  ///  Local state fields for this page.

  List<bool> listOfSelectedAndNonSelectedLocations = [];
  void addToListOfSelectedAndNonSelectedLocations(bool item) =>
      listOfSelectedAndNonSelectedLocations.add(item);
  void removeFromListOfSelectedAndNonSelectedLocations(bool item) =>
      listOfSelectedAndNonSelectedLocations.remove(item);
  void removeAtIndexFromListOfSelectedAndNonSelectedLocations(int index) =>
      listOfSelectedAndNonSelectedLocations.removeAt(index);
  void insertAtIndexInListOfSelectedAndNonSelectedLocations(
          int index, bool item) =>
      listOfSelectedAndNonSelectedLocations.insert(index, item);
  void updateListOfSelectedAndNonSelectedLocationsAtIndex(
          int index, Function(bool) updateFn) =>
      listOfSelectedAndNonSelectedLocations[index] =
          updateFn(listOfSelectedAndNonSelectedLocations[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (LocationApi)] action in LocationPage widget.
  ApiCallResponse? locationsApiResponce1;
  // Model for HyndayAppBar component.
  late HyndayAppBarModel hyndayAppBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    hyndayAppBarModel = createModel(context, () => HyndayAppBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    hyndayAppBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
