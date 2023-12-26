import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui_screens/components/modal06_basic_information/modal06_basic_information_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'cart_bottom_sheet_widget.dart' show CartBottomSheetWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class CartBottomSheetModel extends FlutterFlowModel<CartBottomSheetWidget> {
  ///  Local state fields for this component.

  List<PartModelStruct> listOfCartItemsLocal = [];
  void addToListOfCartItemsLocal(PartModelStruct item) =>
      listOfCartItemsLocal.add(item);
  void removeFromListOfCartItemsLocal(PartModelStruct item) =>
      listOfCartItemsLocal.remove(item);
  void removeAtIndexFromListOfCartItemsLocal(int index) =>
      listOfCartItemsLocal.removeAt(index);
  void insertAtIndexInListOfCartItemsLocal(int index, PartModelStruct item) =>
      listOfCartItemsLocal.insert(index, item);
  void updateListOfCartItemsLocalAtIndex(
          int index, Function(PartModelStruct) updateFn) =>
      listOfCartItemsLocal[index] = updateFn(listOfCartItemsLocal[index]);

  double totalPrice = 0.0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (getMyCartApi)] action in CartBottomSheet widget.
  ApiCallResponse? apiResultx44;
  // Stores action output result for [Backend Call - API (AddToCartApi)] action in Icon widget.
  ApiCallResponse? apiResulti8n;
  // Stores action output result for [Backend Call - API (getMyCartApi)] action in Icon widget.
  ApiCallResponse? apiResultx4488;
  // Stores action output result for [Backend Call - API (RemoveItemFromCartApi)] action in Icon widget.
  ApiCallResponse? apiResultxxf2;
  // Stores action output result for [Backend Call - API (getMyCartApi)] action in Icon widget.
  ApiCallResponse? apiResultx448866;
  // Stores action output result for [Backend Call - API (RemoveItemFromCartApi)] action in Column widget.
  ApiCallResponse? apiResultxxf2Copy;
  // Stores action output result for [Backend Call - API (getMyCartApi)] action in Column widget.
  ApiCallResponse? apiResultx448866Copy;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
