import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui_screens/components/bottom_nav_bar_component/bottom_nav_bar_component_widget.dart';
import '/ui_screens/components/hynday_app_bar/hynday_app_bar_widget.dart';
import '/ui_screens/nav_home_pakage/news_bottom_sheet_component/news_bottom_sheet_component_widget.dart';
import 'news_page_widget.dart' show NewsPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewsPageModel extends FlutterFlowModel<NewsPageWidget> {
  ///  Local state fields for this page.

  List<NewsModelStruct> localModelNewsList = [];
  void addToLocalModelNewsList(NewsModelStruct item) =>
      localModelNewsList.add(item);
  void removeFromLocalModelNewsList(NewsModelStruct item) =>
      localModelNewsList.remove(item);
  void removeAtIndexFromLocalModelNewsList(int index) =>
      localModelNewsList.removeAt(index);
  void insertAtIndexInLocalModelNewsList(int index, NewsModelStruct item) =>
      localModelNewsList.insert(index, item);
  void updateLocalModelNewsListAtIndex(
          int index, Function(NewsModelStruct) updateFn) =>
      localModelNewsList[index] = updateFn(localModelNewsList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (NewsApi)] action in NewsPage widget.
  ApiCallResponse? apiResult44r;
  // Model for NewsBottomSheetComponent component.
  late NewsBottomSheetComponentModel newsBottomSheetComponentModel;
  // Model for HyndayAppBar component.
  late HyndayAppBarModel hyndayAppBarModel;
  // Model for BottomNavBarComponent component.
  late BottomNavBarComponentModel bottomNavBarComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    newsBottomSheetComponentModel =
        createModel(context, () => NewsBottomSheetComponentModel());
    hyndayAppBarModel = createModel(context, () => HyndayAppBarModel());
    bottomNavBarComponentModel =
        createModel(context, () => BottomNavBarComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    newsBottomSheetComponentModel.dispose();
    hyndayAppBarModel.dispose();
    bottomNavBarComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
