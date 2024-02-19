import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui_screens/components/hynday_app_bar/hynday_app_bar_widget.dart';
import '/ui_screens/nav_home_pakage/empty_list_component/empty_list_component_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'news_details_page_widget.dart' show NewsDetailsPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewsDetailsPageModel extends FlutterFlowModel<NewsDetailsPageWidget> {
  ///  Local state fields for this page.

  List<String> listOfGallaryImages = [];
  void addToListOfGallaryImages(String item) => listOfGallaryImages.add(item);
  void removeFromListOfGallaryImages(String item) =>
      listOfGallaryImages.remove(item);
  void removeAtIndexFromListOfGallaryImages(int index) =>
      listOfGallaryImages.removeAt(index);
  void insertAtIndexInListOfGallaryImages(int index, String item) =>
      listOfGallaryImages.insert(index, item);
  void updateListOfGallaryImagesAtIndex(int index, Function(String) updateFn) =>
      listOfGallaryImages[index] = updateFn(listOfGallaryImages[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (DetailsNewsApi)] action in NewsDetailsPage widget.
  ApiCallResponse? responses;
  // Model for HyndayAppBar component.
  late HyndayAppBarModel hyndayAppBarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    hyndayAppBarModel = createModel(context, () => HyndayAppBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    hyndayAppBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
