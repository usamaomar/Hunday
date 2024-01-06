import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/ui_screens/components/modal06_basic_information/modal06_basic_information_widget.dart';
import '/ui_screens/components/reset_password_component/reset_password_component_widget.dart';
import '/backend/schema/structs/index.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'verify_forget_password_bottom_dialog_widget.dart'
    show VerifyForgetPasswordBottomDialogWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VerifyForgetPasswordBottomDialogModel
    extends FlutterFlowModel<VerifyForgetPasswordBottomDialogWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Stores action output result for [Backend Call - API (GetVerifiedCodeApi)] action in PinCode widget.
  ApiCallResponse? apiResultpqp;
  // Stores action output result for [Backend Call - API (GetMobileNumber)] action in TextCounterCustomWidget widget.
  ApiCallResponse? apiResultjcw;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  void dispose() {
    pinCodeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
