import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/ui_screens/components/modal06_basic_information/modal06_basic_information_widget.dart';
import '/ui_screens/components/password_edit_text_values/password_edit_text_values_widget.dart';
import '/ui_screens/components/phone_edit_text_values/phone_edit_text_values_widget.dart';
import '/ui_screens/components/reguler_edit_text_values/reguler_edit_text_values_widget.dart';
import '/ui_screens/components/verify_bottom_dialog/verify_bottom_dialog_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'registraation_page_widget.dart' show RegistraationPageWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegistraationPageModel extends FlutterFlowModel<RegistraationPageWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  bool localEmailIsValid = false;

  bool localIsPasswordConfirme = false;

  bool localPhoneNumberValid = false;

  String localPhoneNumber = '';

  bool localNameValid = false;

  bool privacyOne = false;

  String? localDateOfBirth = '  ';

  dynamic userJsonModel;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for RegulerEditTextValues component.
  late RegulerEditTextValuesModel regulerEditTextValuesModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for PhoneEditTextValues component.
  late PhoneEditTextValuesModel phoneEditTextValuesModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  DateTime? datePicked;
  // Model for PasswordEditTextValues component.
  late PasswordEditTextValuesModel passwordEditTextValuesModel1;
  // Model for PasswordEditTextValues component.
  late PasswordEditTextValuesModel passwordEditTextValuesModel2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // Stores action output result for [Backend Call - API (RegisterApi)] action in Button widget.
  ApiCallResponse? apiResult7h5;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    regulerEditTextValuesModel =
        createModel(context, () => RegulerEditTextValuesModel());
    phoneEditTextValuesModel =
        createModel(context, () => PhoneEditTextValuesModel());
    passwordEditTextValuesModel1 =
        createModel(context, () => PasswordEditTextValuesModel());
    passwordEditTextValuesModel2 =
        createModel(context, () => PasswordEditTextValuesModel());
  }

  void dispose() {
    unfocusNode.dispose();
    regulerEditTextValuesModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    phoneEditTextValuesModel.dispose();
    passwordEditTextValuesModel1.dispose();
    passwordEditTextValuesModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
