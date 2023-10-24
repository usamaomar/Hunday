import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui_screens/components/bottom_nav_bar_component/bottom_nav_bar_component_widget.dart';
import '/ui_screens/components/hynday_app_bar/hynday_app_bar_widget.dart';
import '/ui_screens/nav_home_pakage/news_bottom_sheet_component/news_bottom_sheet_component_widget.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'news_page_model.dart';
export 'news_page_model.dart';

class NewsPageWidget extends StatefulWidget {
  const NewsPageWidget({Key? key}) : super(key: key);

  @override
  _NewsPageWidgetState createState() => _NewsPageWidgetState();
}

class _NewsPageWidgetState extends State<NewsPageWidget>
    with TickerProviderStateMixin {
  late NewsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'newsBottomSheetComponentOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 500.ms,
          begin: Offset(0.0, 700.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResult44r = await NewsApiCall.call(
        token: FFAppState().userModel.token,
      );
      if ((_model.apiResult44r?.succeeded ?? true)) {
        setState(() {
          FFAppState().newsModelList = NewsApiCall.listOfNewsJson(
            (_model.apiResult44r?.jsonBody ?? ''),
          )!
              .map((e) =>
                  e != null && e != '' ? NewsModelStruct.fromMap(e) : null)
              .withoutNulls
              .toList()
              .toList()
              .cast<NewsModelStruct>();
        });
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 33.0, 0.0, 0.0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/Mask_Group_70057.png',
                ).image,
              ),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.00, 0.90),
                  child: wrapWithModel(
                    model: _model.newsBottomSheetComponentModel,
                    updateCallback: () => setState(() {}),
                    child: NewsBottomSheetComponentWidget(),
                  ).animateOnPageLoad(animationsMap[
                      'newsBottomSheetComponentOnPageLoadAnimation']!),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    wrapWithModel(
                      model: _model.hyndayAppBarModel,
                      updateCallback: () => setState(() {}),
                      child: HyndayAppBarWidget(
                        appBarTitle:
                            FFLocalizations.of(context).getVariableText(
                          enText: 'News',
                          arText: 'الاخبار',
                        ),
                        isMyProfileOpend: false,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.bottomNavBarComponentModel,
                      updateCallback: () => setState(() {}),
                      child: BottomNavBarComponentWidget(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
