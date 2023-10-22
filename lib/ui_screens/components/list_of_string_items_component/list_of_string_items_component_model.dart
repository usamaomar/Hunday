import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/ui_screens/components/dash_board_input_fieald/dash_board_input_fieald_widget.dart';
import 'list_of_string_items_component_widget.dart'
    show ListOfStringItemsComponentWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListOfStringItemsComponentModel
    extends FlutterFlowModel<ListOfStringItemsComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for DashBoardInputFieald component.
  late DashBoardInputFiealdModel dashBoardInputFiealdModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dashBoardInputFiealdModel =
        createModel(context, () => DashBoardInputFiealdModel());
  }

  void dispose() {
    dashBoardInputFiealdModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
