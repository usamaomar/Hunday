import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui_screens/components/hynday_app_bar/hynday_app_bar_widget.dart';
import 'car_model_details_widget.dart' show CarModelDetailsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CarModelDetailsModel extends FlutterFlowModel<CarModelDetailsWidget> {
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

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetCarsApi)] action in CarModelDetails widget.
  ApiCallResponse? apiResulthju;
  // Stores action output result for [Backend Call - API (GetCarDetailsApi)] action in Card widget.
  ApiCallResponse? responceFromGetCarDetails;
  // Model for HyndayAppBar component.
  late HyndayAppBarModel hyndayAppBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    hyndayAppBarModel = createModel(context, () => HyndayAppBarModel());
  }

  void dispose() {
    hyndayAppBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
