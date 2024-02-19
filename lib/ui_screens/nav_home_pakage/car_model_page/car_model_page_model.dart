import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui_screens/components/hynday_app_bar/hynday_app_bar_widget.dart';
import 'dart:ui';
import 'car_model_page_widget.dart' show CarModelPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CarModelPageModel extends FlutterFlowModel<CarModelPageWidget> {
  ///  Local state fields for this page.

  List<dynamic> listOfCarModels = [];
  void addToListOfCarModels(dynamic item) => listOfCarModels.add(item);
  void removeFromListOfCarModels(dynamic item) => listOfCarModels.remove(item);
  void removeAtIndexFromListOfCarModels(int index) =>
      listOfCarModels.removeAt(index);
  void insertAtIndexInListOfCarModels(int index, dynamic item) =>
      listOfCarModels.insert(index, item);
  void updateListOfCarModelsAtIndex(int index, Function(dynamic) updateFn) =>
      listOfCarModels[index] = updateFn(listOfCarModels[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (CarModelsApi)] action in CarModelPage widget.
  ApiCallResponse? apiResultzn4;
  // Model for HyndayAppBar component.
  late HyndayAppBarModel hyndayAppBarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    hyndayAppBarModel = createModel(context, () => HyndayAppBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    hyndayAppBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
