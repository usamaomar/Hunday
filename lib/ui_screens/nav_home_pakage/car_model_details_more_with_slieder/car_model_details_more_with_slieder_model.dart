import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui_screens/components/car_deteails_components/car_deteails_components_widget.dart';
import '/ui_screens/components/hynday_app_bar/hynday_app_bar_widget.dart';
import '/ui_screens/components/test_drive_component/test_drive_component_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'car_model_details_more_with_slieder_widget.dart'
    show CarModelDetailsMoreWithSliederWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class CarModelDetailsMoreWithSliederModel
    extends FlutterFlowModel<CarModelDetailsMoreWithSliederWidget> {
  ///  Local state fields for this page.

  List<dynamic> listOfCarsModel = [];
  void addToListOfCarsModel(dynamic item) => listOfCarsModel.add(item);
  void removeFromListOfCarsModel(dynamic item) => listOfCarsModel.remove(item);
  void removeAtIndexFromListOfCarsModel(int index) =>
      listOfCarsModel.removeAt(index);
  void insertAtIndexInListOfCarsModel(int index, dynamic item) =>
      listOfCarsModel.insert(index, item);
  void updateListOfCarsModelAtIndex(int index, Function(dynamic) updateFn) =>
      listOfCarsModel[index] = updateFn(listOfCarsModel[index]);

  dynamic detailsJsonObject;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetCarDetailsApi)] action in CarModelDetailsMoreWithSlieder widget.
  ApiCallResponse? apiResultrr9;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

  // Model for HyndayAppBar component.
  late HyndayAppBarModel hyndayAppBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    hyndayAppBarModel = createModel(context, () => HyndayAppBarModel());
  }

  void dispose() {
    hyndayAppBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
