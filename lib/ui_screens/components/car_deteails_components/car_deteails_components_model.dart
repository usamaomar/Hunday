import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
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
  ///  Local state fields for this component.

  dynamic carModel;

  List<String> listOfExteriors = [];
  void addToListOfExteriors(String item) => listOfExteriors.add(item);
  void removeFromListOfExteriors(String item) => listOfExteriors.remove(item);
  void removeAtIndexFromListOfExteriors(int index) =>
      listOfExteriors.removeAt(index);
  void insertAtIndexInListOfExteriors(int index, String item) =>
      listOfExteriors.insert(index, item);
  void updateListOfExteriorsAtIndex(int index, Function(String) updateFn) =>
      listOfExteriors[index] = updateFn(listOfExteriors[index]);

  List<String> listOfPerformances = [];
  void addToListOfPerformances(String item) => listOfPerformances.add(item);
  void removeFromListOfPerformances(String item) =>
      listOfPerformances.remove(item);
  void removeAtIndexFromListOfPerformances(int index) =>
      listOfPerformances.removeAt(index);
  void insertAtIndexInListOfPerformances(int index, String item) =>
      listOfPerformances.insert(index, item);
  void updateListOfPerformancesAtIndex(int index, Function(String) updateFn) =>
      listOfPerformances[index] = updateFn(listOfPerformances[index]);

  List<String> listOfSafety = [];
  void addToListOfSafety(String item) => listOfSafety.add(item);
  void removeFromListOfSafety(String item) => listOfSafety.remove(item);
  void removeAtIndexFromListOfSafety(int index) => listOfSafety.removeAt(index);
  void insertAtIndexInListOfSafety(int index, String item) =>
      listOfSafety.insert(index, item);
  void updateListOfSafetyAtIndex(int index, Function(String) updateFn) =>
      listOfSafety[index] = updateFn(listOfSafety[index]);

  List<String> listOfInteriors = [];
  void addToListOfInteriors(String item) => listOfInteriors.add(item);
  void removeFromListOfInteriors(String item) => listOfInteriors.remove(item);
  void removeAtIndexFromListOfInteriors(int index) =>
      listOfInteriors.removeAt(index);
  void insertAtIndexInListOfInteriors(int index, String item) =>
      listOfInteriors.insert(index, item);
  void updateListOfInteriorsAtIndex(int index, Function(String) updateFn) =>
      listOfInteriors[index] = updateFn(listOfInteriors[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (GetCarDetailsApi)] action in carDeteailsComponents widget.
  ApiCallResponse? apiResultCarDeteails;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
