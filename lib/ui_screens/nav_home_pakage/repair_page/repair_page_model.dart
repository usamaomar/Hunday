import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/ui_screens/components/hynday_app_bar/hynday_app_bar_widget.dart';
import '/ui_screens/components/modal06_basic_information/modal06_basic_information_widget.dart';
import '/ui_screens/nav_pakege/time_component_list/time_component_list_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'repair_page_widget.dart' show RepairPageWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RepairPageModel extends FlutterFlowModel<RepairPageWidget> {
  ///  Local state fields for this page.

  List<MyVehicleModelStruct> listOfMyVehicleModels = [];
  void addToListOfMyVehicleModels(MyVehicleModelStruct item) =>
      listOfMyVehicleModels.add(item);
  void removeFromListOfMyVehicleModels(MyVehicleModelStruct item) =>
      listOfMyVehicleModels.remove(item);
  void removeAtIndexFromListOfMyVehicleModels(int index) =>
      listOfMyVehicleModels.removeAt(index);
  void insertAtIndexInListOfMyVehicleModels(
          int index, MyVehicleModelStruct item) =>
      listOfMyVehicleModels.insert(index, item);
  void updateListOfMyVehicleModelsAtIndex(
          int index, Function(MyVehicleModelStruct) updateFn) =>
      listOfMyVehicleModels[index] = updateFn(listOfMyVehicleModels[index]);

  MyVehicleModelStruct? selectedVehicleModel;
  void updateSelectedVehicleModelStruct(
          Function(MyVehicleModelStruct) updateFn) =>
      updateFn(selectedVehicleModel ??= MyVehicleModelStruct());

  String selectedDate = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (VehicleApi)] action in RepairPage widget.
  ApiCallResponse? apiResultoqe;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  DateTime? datePicked;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (RepairServiceApi)] action in Button widget.
  ApiCallResponse? apiResult6ff;
  // Model for HyndayAppBar component.
  late HyndayAppBarModel hyndayAppBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    hyndayAppBarModel = createModel(context, () => HyndayAppBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    hyndayAppBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
