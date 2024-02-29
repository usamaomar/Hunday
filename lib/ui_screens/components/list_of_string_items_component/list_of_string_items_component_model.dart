import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/ui_screens/components/modal06_basic_information/modal06_basic_information_widget.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'list_of_string_items_component_widget.dart'
    show ListOfStringItemsComponentWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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

  CarModelStruct? selectedCarModel;
  void updateSelectedCarModelStruct(Function(CarModelStruct) updateFn) =>
      updateFn(selectedCarModel ??= CarModelStruct());

  // CarCategoriesStruct? selectedCarCategories;
  // void updateSelectedCarCategoriesStruct(
  //         Function(CarCategoriesStruct) updateFn) =>
  //     updateFn(selectedCarCategories ??= CarCategoriesStruct());

  FuelTypeModelStruct? selectedFuelType;
  void updateSelectedFuelTypeStruct(Function(FuelTypeModelStruct) updateFn) =>
      updateFn(selectedFuelType ??= FuelTypeModelStruct());

  String yearOfManufacturingString = '';

  String registeredUntil = '';

  String selectedStringCarModel = '';

  // String selectedStringCarCategory = '';

  String selectedStringFuelType = '';

  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for TextField widget.
  String? dropDownValueYearOfCreation;
  FormFieldController<String>? dropDownValueYearOfCreationController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextFieldCapacity widget.
  FocusNode? textFieldCapacityFocusNode;
  TextEditingController? textFieldCapacityController;
  String? Function(BuildContext, String?)? textFieldCapacityControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;
  // Stores action output result for [Backend Call - API (StoreVehicleApi)] action in Button widget.
  ApiCallResponse? apiResult4m8;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldCapacityFocusNode?.dispose();
    textFieldCapacityController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
