import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/ui_screens/components/hynday_app_bar/hynday_app_bar_widget.dart';
import '/ui_screens/nav_home_pakage/empty_list_component/empty_list_component_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'news_details_page_model.dart';
export 'news_details_page_model.dart';

class NewsDetailsPageWidget extends StatefulWidget {
  const NewsDetailsPageWidget({
    super.key,
    required this.itemIndex,
    required this.itemId,
  });

  final int? itemIndex;
  final String? itemId;

  @override
  State<NewsDetailsPageWidget> createState() => _NewsDetailsPageWidgetState();
}

class _NewsDetailsPageWidgetState extends State<NewsDetailsPageWidget>
    with TickerProviderStateMixin {
  late NewsDetailsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 500.ms,
          begin: Offset(0.0, 600.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewsDetailsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.responses = await DetailsNewsApiCall.call(
        token: FFAppState().userModel.token,
        id: widget.itemId,
      );
      if ((_model.responses?.succeeded ?? true)) {
        setState(() {
          _model.listOfGallaryImages = functions
              .convertFromJsonListToImagePathes(getJsonField(
                (_model.responses?.jsonBody ?? ''),
                r'''$.details.news_gallery''',
                true,
              ) ?? [])
              .toList()
              .cast<String>();
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
    context.watch<FFAppState>();
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).white,
        body: SafeArea(
          top: true,
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
                Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Stack(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).white,
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(0.0),
                                          bottomRight: Radius.circular(0.0),
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0),
                                        ),
                                        border: Border.all(
                                          color:
                                              FlutterFlowTheme.of(context).white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          40.0, 0.0, 40.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Flexible(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              child: Container(
                                                constraints: const BoxConstraints(
                                                  maxHeight: 202.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color:
                                                      FlutterFlowTheme.of(context)
                                                          .white,
                                                  borderRadius:
                                                      BorderRadius.circular(20.0),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8.0),
                                                  child: AspectRatio(
                                                    aspectRatio: 2.0,
                                                    child: Image.network(
                                                      getJsonField(
                                                        FFAppState()
                                                                .newsModelJsonList[
                                                            widget.itemIndex!],
                                                        r'''$.full_node_image''',
                                                      ).toString(),
                                                      fit: BoxFit.cover,
                                                      errorBuilder: (context, error,
                                                              stackTrace) =>
                                                          Image.asset(
                                                        'assets/images/error_image.png',
                                                        width: 300.0,
                                                        height: 200.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 5.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).white,
                                      borderRadius: BorderRadius.circular(0.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context).white,
                                      ),
                                    ),
                                    child: SingleChildScrollView(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              functions.newsFormatDateFunction(
                                                  getJsonField(
                                                FFAppState().newsModelJsonList[
                                                    widget.itemIndex!],
                                                r'''$.date''',
                                              ).toString()),
                                              style: FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: const Color(0xFF4E4E4E),
                                                    fontSize: 10.0,
                                                  ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional.fromSTEB(
                                                      0.0, 15.0, 0.0, 0.0),
                                              child: Text(
                                                getJsonField(
                                                  FFAppState().newsModelJsonList[
                                                      widget.itemIndex!],
                                                  r'''$.title''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'HeeboBold',
                                                      color: Color(0xFF3D6398),
                                                      fontWeight: FontWeight.bold,
                                                      useGoogleFonts: false,
                                                    ),
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 15.0, 0.0, 0.0),
                                                    child: Text(
                                                      DetailsNewsApiCall
                                                          .description(
                                                        (_model.responses
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString(),
                                                      style: FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Poppins',
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight.normal,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsetsDirectional.fromSTEB(
                                                      1.0, 0.0, 1.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                25.0),
                                                      ),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final imagesList = _model
                                                              .listOfGallaryImages
                                                              .toList();
                                                          return Visibility(
                                                            visible: !imagesList.isEmpty,
                                                            child: ListView.builder(
                                                              padding:
                                                                  EdgeInsets.zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              itemCount:
                                                                  imagesList.length,
                                                              itemBuilder: (context,
                                                                  imagesListIndex) {
                                                                final imagesListItem =
                                                                    imagesList[
                                                                        imagesListIndex];
                                                                return Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0.0,
                                                                              5.0,
                                                                              10.0,
                                                                              0.0),
                                                                  child: Container(
                                                                    width: 110.0,
                                                                    height: 95.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: const Color(
                                                                          0xFFF5F0F0),
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                                  0.0),
                                                                    ),
                                                                    child: ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                                  8.0),
                                                                      child: Image
                                                                          .network(
                                                                        imagesListItem,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        errorBuilder: (context,
                                                                                error,
                                                                                stackTrace) =>
                                                                            Image
                                                                                .asset(
                                                                          'assets/images/error_image.png',
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ]
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation']!),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
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
                      ],
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
