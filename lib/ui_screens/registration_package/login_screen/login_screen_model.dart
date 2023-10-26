import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui_screens/components/edit_text_values/edit_text_values_widget.dart';
import '/ui_screens/components/forget_password_component/forget_password_component_widget.dart';
import '/ui_screens/components/modal06_basic_information/modal06_basic_information_widget.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'login_screen_widget.dart' show LoginScreenWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreenModel extends FlutterFlowModel<LoginScreenWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  String phoneNumber = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for EditTextValues component.
  late EditTextValuesModel editTextValuesModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (LoginApi)] action in Button widget.
  ApiCallResponse? loginApiRes;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    editTextValuesModel = createModel(context, () => EditTextValuesModel());
    passwordVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    editTextValuesModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
