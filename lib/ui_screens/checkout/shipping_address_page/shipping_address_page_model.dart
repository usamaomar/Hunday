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
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'shipping_address_page_widget.dart' show ShippingAddressPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ShippingAddressPageModel
    extends FlutterFlowModel<ShippingAddressPageWidget> {
  ///  Local state fields for this page.

  List<DeliveryPriceModelStruct> listOfLocalDeliveryPriceModels = [];
  void addToListOfLocalDeliveryPriceModels(DeliveryPriceModelStruct item) =>
      listOfLocalDeliveryPriceModels.add(item);
  void removeFromListOfLocalDeliveryPriceModels(
          DeliveryPriceModelStruct item) =>
      listOfLocalDeliveryPriceModels.remove(item);
  void removeAtIndexFromListOfLocalDeliveryPriceModels(int index) =>
      listOfLocalDeliveryPriceModels.removeAt(index);
  void insertAtIndexInListOfLocalDeliveryPriceModels(
          int index, DeliveryPriceModelStruct item) =>
      listOfLocalDeliveryPriceModels.insert(index, item);
  void updateListOfLocalDeliveryPriceModelsAtIndex(
          int index, Function(DeliveryPriceModelStruct) updateFn) =>
      listOfLocalDeliveryPriceModels[index] =
          updateFn(listOfLocalDeliveryPriceModels[index]);

  AddressModelStruct? addressModel;
  void updateAddressModelStruct(Function(AddressModelStruct) updateFn) =>
      updateFn(addressModel ??= AddressModelStruct());

  String selectedCityModelString = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (deliveryPrices Api)] action in ShippingAddressPage widget.
  ApiCallResponse? apiResult5ds;
  // Stores action output result for [Backend Call - API (getAddressApi)] action in ShippingAddressPage widget.
  ApiCallResponse? apiResultqwk;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
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
  // Stores action output result for [Backend Call - API (addAddressApi)] action in Button widget.
  ApiCallResponse? apiResultdip;
  // Model for HyndayAppBar component.
  late HyndayAppBarModel hyndayAppBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    hyndayAppBarModel = createModel(context, () => HyndayAppBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
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

    hyndayAppBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
