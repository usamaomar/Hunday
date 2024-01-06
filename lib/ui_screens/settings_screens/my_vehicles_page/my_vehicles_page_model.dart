import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui_screens/components/hynday_app_bar/hynday_app_bar_widget.dart';
import '/ui_screens/components/scanned_card_animation_component/scanned_card_animation_component_widget.dart';
import '/ui_screens/nav_home_pakage/empty_list_component/empty_list_component_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'my_vehicles_page_widget.dart' show MyVehiclesPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyVehiclesPageModel extends FlutterFlowModel<MyVehiclesPageWidget> {
  ///  Local state fields for this page.

  List<MyVehicleModelStruct> myCarsList = [];
  void addToMyCarsList(MyVehicleModelStruct item) => myCarsList.add(item);
  void removeFromMyCarsList(MyVehicleModelStruct item) =>
      myCarsList.remove(item);
  void removeAtIndexFromMyCarsList(int index) => myCarsList.removeAt(index);
  void insertAtIndexInMyCarsList(int index, MyVehicleModelStruct item) =>
      myCarsList.insert(index, item);
  void updateMyCarsListAtIndex(
          int index, Function(MyVehicleModelStruct) updateFn) =>
      myCarsList[index] = updateFn(myCarsList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (VehicleApi)] action in MyVehiclesPage widget.
  ApiCallResponse? apiResultoqe;
  // Stores action output result for [Backend Call - API (VehicleApi)] action in Button widget.
  ApiCallResponse? apiResultoqe12;
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
