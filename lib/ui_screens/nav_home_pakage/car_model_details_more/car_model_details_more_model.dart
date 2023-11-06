import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui_screens/components/bottom_nav_bar_component/bottom_nav_bar_component_widget.dart';
import '/ui_screens/components/car_deteails_components/car_deteails_components_widget.dart';
import '/ui_screens/components/hynday_app_bar/hynday_app_bar_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'car_model_details_more_widget.dart' show CarModelDetailsMoreWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CarModelDetailsMoreModel
    extends FlutterFlowModel<CarModelDetailsMoreWidget> {
  ///  Local state fields for this page.

  List<dynamic> listOfCarsModel = [];
  void addToListOfCarsModel(dynamic item) => listOfCarsModel.add(item);
  void removeFromListOfCarsModel(dynamic item) => listOfCarsModel.remove(item);
  void removeAtIndexFromListOfCarsModel(int index) =>
      listOfCarsModel.removeAt(index);
  void insertAtIndexInListOfCarsModel(int index, dynamic item) =>
      listOfCarsModel.insert(index, item);
  void updateListOfCarsModelAtIndex(int index, Function(dynamic) updateFn) =>
      listOfCarsModel[index] = updateFn(listOfCarsModel[index]);

  dynamic detailsJsonObject;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetCarsApi)] action in CarModelDetailsMore widget.
  ApiCallResponse? apiResulthju;
  // Stores action output result for [Backend Call - API (GetCarDetailsApi)] action in CarModelDetailsMore widget.
  ApiCallResponse? apiResultrr9;
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
    hyndayAppBarModel.dispose();
    bottomNavBarComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
