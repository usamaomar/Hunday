import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui_screens/components/bottom_nav_bar_component/bottom_nav_bar_component_widget.dart';
import '/ui_screens/components/hynday_app_bar/hynday_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'offers_details_page_model.dart';
export 'offers_details_page_model.dart';

class OffersDetailsPageWidget extends StatefulWidget {
  const OffersDetailsPageWidget({
    Key? key,
    required this.itemIndex,
  }) : super(key: key);

  final int? itemIndex;

  @override
  _OffersDetailsPageWidgetState createState() =>
      _OffersDetailsPageWidgetState();
}

class _OffersDetailsPageWidgetState extends State<OffersDetailsPageWidget>
    with TickerProviderStateMixin {
  late OffersDetailsPageModel _model;

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
    _model = createModel(context, () => OffersDetailsPageModel());

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
                  alignment: AlignmentDirectional(0.00, 1.00),
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: 650.0,
                    ),
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 5.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    40.0, 0.0, 40.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Flexible(
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Container(
                                          constraints: BoxConstraints(
                                            maxHeight: 202.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .white,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              getJsonField(
                                                FFAppState().listOfPublicOffers[
                                                    widget.itemIndex!],
                                                r'''$.full_image_node''',
                                              ),
                                              width: 300.0,
                                              height: 200.0,
                                              fit: BoxFit.fill,
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
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 5.0, 5.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).white,
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 60.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 10.0, 0.0, 0.0),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 15.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      getJsonField(
                                                        FFAppState()
                                                                .listOfPublicOffers[
                                                            widget.itemIndex!],
                                                        r'''$.offer_title''',
                                                      ).toString(),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'HeeboBold',
                                                            color: Color(
                                                                0xFF3D6398),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 15.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      getJsonField(
                                                        FFAppState()
                                                                .listOfPublicOffers[
                                                            widget.itemIndex!],
                                                        r'''$.description''',
                                                      ).toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: SvgPicture.asset(
                                              'assets/images/text_(2).svg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          1.0, 0.0, 1.0, 20.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF092853),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      15.0,
                                                                      10.0,
                                                                      0.0,
                                                                      10.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                            child: SvgPicture
                                                                .asset(
                                                              'assets/images/Group_72215.svg',
                                                              width: 20.0,
                                                              height: 20.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      20.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'g6x2pbik' /* Share */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Heebo Regular',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .white,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFC1D6EF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      15.0,
                                                                      10.0,
                                                                      0.0,
                                                                      10.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                            child: SvgPicture
                                                                .asset(
                                                              'assets/images/Group_72282.svg',
                                                              width: 20.0,
                                                              height: 20.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      20.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'guoi6rgz' /* Share */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'HeeboBold',
                                                                  color: Color(
                                                                      0xFF092853),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: SvgPicture.asset(
                                                      'assets/images/Group_72890.svg',
                                                      width: 40.0,
                                                      height: 40.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
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
                              enText: 'Offers',
                              arText: 'العروض',
                            ),
                            isMyProfileOpend: false,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.bottomNavBarComponentModel,
                          updateCallback: () => setState(() {}),
                          child: BottomNavBarComponentWidget(),
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
