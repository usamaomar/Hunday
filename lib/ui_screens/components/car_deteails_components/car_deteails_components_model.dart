import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'car_deteails_components_widget.dart' show CarDeteailsComponentsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CarDeteailsComponentsModel
    extends FlutterFlowModel<CarDeteailsComponentsWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - carDetialsAction] action in carDeteailsComponents widget.
  List<String>? listOfPerformance;
  // Stores action output result for [Custom Action - carDetialsAction] action in carDeteailsComponents widget.
  List<String>? listOfSafty;
  // Stores action output result for [Custom Action - carDetialsAction] action in carDeteailsComponents widget.
  List<String>? listOfInterior;
  // Stores action output result for [Custom Action - carDetialsAction] action in carDeteailsComponents widget.
  List<String>? listOfExterior;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
