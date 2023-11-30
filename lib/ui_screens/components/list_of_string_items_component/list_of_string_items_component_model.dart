import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'list_of_string_items_component_widget.dart'
    show ListOfStringItemsComponentWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListOfStringItemsComponentModel
    extends FlutterFlowModel<ListOfStringItemsComponentWidget> {
  ///  Local state fields for this component.

  CarInfoModelStruct? carInfoLocalModel;
  void updateCarInfoLocalModelStruct(Function(CarInfoModelStruct) updateFn) =>
      updateFn(carInfoLocalModel ??= CarInfoModelStruct());

  List<CarModelStruct> carModelList = [];
  void addToCarModelList(CarModelStruct item) => carModelList.add(item);
  void removeFromCarModelList(CarModelStruct item) => carModelList.remove(item);
  void removeAtIndexFromCarModelList(int index) => carModelList.removeAt(index);
  void insertAtIndexInCarModelList(int index, CarModelStruct item) =>
      carModelList.insert(index, item);
  void updateCarModelListAtIndex(
          int index, Function(CarModelStruct) updateFn) =>
      carModelList[index] = updateFn(carModelList[index]);

  List<CarCategoriesStruct> carCategoriesList = [];
  void addToCarCategoriesList(CarCategoriesStruct item) =>
      carCategoriesList.add(item);
  void removeFromCarCategoriesList(CarCategoriesStruct item) =>
      carCategoriesList.remove(item);
  void removeAtIndexFromCarCategoriesList(int index) =>
      carCategoriesList.removeAt(index);
  void insertAtIndexInCarCategoriesList(int index, CarCategoriesStruct item) =>
      carCategoriesList.insert(index, item);
  void updateCarCategoriesListAtIndex(
          int index, Function(CarCategoriesStruct) updateFn) =>
      carCategoriesList[index] = updateFn(carCategoriesList[index]);

  List<FuelTypeModelStruct> fuelTypesList = [];
  void addToFuelTypesList(FuelTypeModelStruct item) => fuelTypesList.add(item);
  void removeFromFuelTypesList(FuelTypeModelStruct item) =>
      fuelTypesList.remove(item);
  void removeAtIndexFromFuelTypesList(int index) =>
      fuelTypesList.removeAt(index);
  void insertAtIndexInFuelTypesList(int index, FuelTypeModelStruct item) =>
      fuelTypesList.insert(index, item);
  void updateFuelTypesListAtIndex(
          int index, Function(FuelTypeModelStruct) updateFn) =>
      fuelTypesList[index] = updateFn(fuelTypesList[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode7;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode8;
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode9;
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textController5?.dispose();

    textFieldFocusNode6?.dispose();
    textController6?.dispose();

    textFieldFocusNode7?.dispose();
    textController7?.dispose();

    textFieldFocusNode8?.dispose();
    textController8?.dispose();

    textFieldFocusNode9?.dispose();
    textController9?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
