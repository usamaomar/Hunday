import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui_screens/components/scanned_card_animation_component/scanned_card_animation_component_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_screen_widget.dart' show HomeScreenWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreenModel extends FlutterFlowModel<HomeScreenWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  List<dynamic> listOfJsons = [];
  void addToListOfJsons(dynamic item) => listOfJsons.add(item);
  void removeFromListOfJsons(dynamic item) => listOfJsons.remove(item);
  void removeAtIndexFromListOfJsons(int index) => listOfJsons.removeAt(index);
  void insertAtIndexInListOfJsons(int index, dynamic item) =>
      listOfJsons.insert(index, item);
  void updateListOfJsonsAtIndex(int index, Function(dynamic) updateFn) =>
      listOfJsons[index] = updateFn(listOfJsons[index]);

  String firstImage = 'false';

  String secondImage = 'false';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (TestAuthUserApi)] action in HomeScreen widget.
  ApiCallResponse? localTestAuth2;
  // Stores action output result for [Backend Call - API (SettingApi)] action in HomeScreen widget.
  ApiCallResponse? socialMediaOut;
  // Stores action output result for [Backend Call - API (LocationApi)] action in HomeScreen widget.
  ApiCallResponse? locationsApiResponce;
  // Stores action output result for [Backend Call - API (SliderApi)] action in HomeScreen widget.
  ApiCallResponse? apiResultSlider;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  ApiCallResponse? apiResult8am;
  double aspectRatio = 0;


  int carouselCurrentIndex = 1;

  // Stores action output result for [Backend Call - API (VehicleApi)] action in Column widget.
  ApiCallResponse? apiResult2kt;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
