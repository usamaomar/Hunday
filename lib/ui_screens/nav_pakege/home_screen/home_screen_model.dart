import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/ui_screens/components/bottom_nav_bar_component/bottom_nav_bar_component_widget.dart';
import '/ui_screens/components/list_of_string_items_component/list_of_string_items_component_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_screen_widget.dart' show HomeScreenWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreenModel extends FlutterFlowModel<HomeScreenWidget> {
  ///  Local state fields for this page.

  List<String> itemsImagesList = [];
  void addToItemsImagesList(String item) => itemsImagesList.add(item);
  void removeFromItemsImagesList(String item) => itemsImagesList.remove(item);
  void removeAtIndexFromItemsImagesList(int index) =>
      itemsImagesList.removeAt(index);
  void insertAtIndexInItemsImagesList(int index, String item) =>
      itemsImagesList.insert(index, item);
  void updateItemsImagesListAtIndex(int index, Function(String) updateFn) =>
      itemsImagesList[index] = updateFn(itemsImagesList[index]);

  bool isLoading = false;

  List<String> listOfImagesSlider = [];
  void addToListOfImagesSlider(String item) => listOfImagesSlider.add(item);
  void removeFromListOfImagesSlider(String item) =>
      listOfImagesSlider.remove(item);
  void removeAtIndexFromListOfImagesSlider(int index) =>
      listOfImagesSlider.removeAt(index);
  void insertAtIndexInListOfImagesSlider(int index, String item) =>
      listOfImagesSlider.insert(index, item);
  void updateListOfImagesSliderAtIndex(int index, Function(String) updateFn) =>
      listOfImagesSlider[index] = updateFn(listOfImagesSlider[index]);

  List<String> listOfTestList = [];
  void addToListOfTestList(String item) => listOfTestList.add(item);
  void removeFromListOfTestList(String item) => listOfTestList.remove(item);
  void removeAtIndexFromListOfTestList(int index) =>
      listOfTestList.removeAt(index);
  void insertAtIndexInListOfTestList(int index, String item) =>
      listOfTestList.insert(index, item);
  void updateListOfTestListAtIndex(int index, Function(String) updateFn) =>
      listOfTestList[index] = updateFn(listOfTestList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (TestAuthUserApi)] action in HomeScreen widget.
  ApiCallResponse? localTestAuth2;
  // Stores action output result for [Backend Call - API (SocialMediaApi)] action in HomeScreen widget.
  ApiCallResponse? socialMediaOut;
  // Stores action output result for [Backend Call - API (LocationApi)] action in HomeScreen widget.
  ApiCallResponse? locationsApiResponce;
  // Stores action output result for [Backend Call - API (SliderApi)] action in HomeScreen widget.
  ApiCallResponse? apiResultSlider;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (NewsApi)] action in Column widget.
  ApiCallResponse? listOfValues;
  // Model for BottomNavBarComponent component.
  late BottomNavBarComponentModel bottomNavBarComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    bottomNavBarComponentModel =
        createModel(context, () => BottomNavBarComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    bottomNavBarComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
