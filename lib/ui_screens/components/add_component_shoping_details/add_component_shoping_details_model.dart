import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/ui_screens/components/modal06_basic_information/modal06_basic_information_widget.dart';
import '/ui_screens/nav_pakege/cart_bottom_sheet/cart_bottom_sheet_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_component_shoping_details_widget.dart'
    show AddComponentShopingDetailsWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddComponentShopingDetailsModel
    extends FlutterFlowModel<AddComponentShopingDetailsWidget> {
  ///  Local state fields for this component.

  List<PartModelStruct> listOfPartsModelLocal = [];
  void addToListOfPartsModelLocal(PartModelStruct item) =>
      listOfPartsModelLocal.add(item);
  void removeFromListOfPartsModelLocal(PartModelStruct item) =>
      listOfPartsModelLocal.remove(item);
  void removeAtIndexFromListOfPartsModelLocal(int index) =>
      listOfPartsModelLocal.removeAt(index);
  void insertAtIndexInListOfPartsModelLocal(int index, PartModelStruct item) =>
      listOfPartsModelLocal.insert(index, item);
  void updateListOfPartsModelLocalAtIndex(
          int index, Function(PartModelStruct) updateFn) =>
      listOfPartsModelLocal[index] = updateFn(listOfPartsModelLocal[index]);

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

  String selectedYear = '-';

  String titleHeade = '-';

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (PartsApi)] action in AddComponentShopingDetails widget.
  ApiCallResponse? apiResultjaz;
  // Stores action output result for [Backend Call - API (VehicleApi)] action in AddComponentShopingDetails widget.
  ApiCallResponse? apiResultoqe;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - API (AddToCartApi)] action in Card widget.
  ApiCallResponse? apiResulto0l;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
