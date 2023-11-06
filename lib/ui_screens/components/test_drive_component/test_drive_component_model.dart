import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/ui_screens/components/reguler_edit_text_values/reguler_edit_text_values_widget.dart';
import 'dart:ui';
import 'test_drive_component_widget.dart' show TestDriveComponentWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TestDriveComponentModel
    extends FlutterFlowModel<TestDriveComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for RegulerEditTextValues component.
  late RegulerEditTextValuesModel regulerEditTextValuesModel1;
  // Model for RegulerEditTextValues component.
  late RegulerEditTextValuesModel regulerEditTextValuesModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    regulerEditTextValuesModel1 =
        createModel(context, () => RegulerEditTextValuesModel());
    regulerEditTextValuesModel2 =
        createModel(context, () => RegulerEditTextValuesModel());
  }

  void dispose() {
    regulerEditTextValuesModel1.dispose();
    regulerEditTextValuesModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
