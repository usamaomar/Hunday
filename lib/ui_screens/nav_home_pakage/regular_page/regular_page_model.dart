import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
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
import 'regular_page_widget.dart' show RegularPageWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegularPageModel extends FlutterFlowModel<RegularPageWidget> {
  ///  Local state fields for this page.

  List<MyVehicleModelStruct> listOfMyVehicle = [];
  void addToListOfMyVehicle(MyVehicleModelStruct item) =>
      listOfMyVehicle.add(item);
  void removeFromListOfMyVehicle(MyVehicleModelStruct item) =>
      listOfMyVehicle.remove(item);
  void removeAtIndexFromListOfMyVehicle(int index) =>
      listOfMyVehicle.removeAt(index);
  void insertAtIndexInListOfMyVehicle(int index, MyVehicleModelStruct item) =>
      listOfMyVehicle.insert(index, item);
  void updateListOfMyVehicleAtIndex(
          int index, Function(MyVehicleModelStruct) updateFn) =>
      listOfMyVehicle[index] = updateFn(listOfMyVehicle[index]);

  MyVehicleModelStruct? selectedVehicleModel;
  void updateSelectedVehicleModelStruct(
          Function(MyVehicleModelStruct) updateFn) =>
      updateFn(selectedVehicleModel ??= MyVehicleModelStruct());

  String selectedDate = '';

  List<ServiceTypeModelStruct> serviceTypeList = [];
  void addToServiceTypeList(ServiceTypeModelStruct item) =>
      serviceTypeList.add(item);
  void removeFromServiceTypeList(ServiceTypeModelStruct item) =>
      serviceTypeList.remove(item);
  void removeAtIndexFromServiceTypeList(int index) =>
      serviceTypeList.removeAt(index);
  void insertAtIndexInServiceTypeList(int index, ServiceTypeModelStruct item) =>
      serviceTypeList.insert(index, item);
  void updateServiceTypeListAtIndex(
          int index, Function(ServiceTypeModelStruct) updateFn) =>
      serviceTypeList[index] = updateFn(serviceTypeList[index]);

  ServiceTypeModelStruct? selectedServiceType;
  void updateSelectedServiceTypeStruct(
          Function(ServiceTypeModelStruct) updateFn) =>
      updateFn(selectedServiceType ??= ServiceTypeModelStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (VehicleApi)] action in RegularPage widget.
  ApiCallResponse? apiResultoqe;
  // Stores action output result for [Backend Call - API (ServiceTypeApi)] action in RegularPage widget.
  ApiCallResponse? apiResultjfk;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - API (RegularServiceApi)] action in Button widget.
  ApiCallResponse? apiResult6ff;
  // Model for HyndayAppBar component.
  late HyndayAppBarModel hyndayAppBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    hyndayAppBarModel = createModel(context, () => HyndayAppBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    hyndayAppBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
