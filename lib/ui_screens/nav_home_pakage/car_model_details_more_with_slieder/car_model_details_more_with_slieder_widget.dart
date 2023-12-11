import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui_screens/components/car_deteails_components/car_deteails_components_widget.dart';
import '/ui_screens/components/hynday_app_bar/hynday_app_bar_widget.dart';
import '/ui_screens/components/test_drive_component/test_drive_component_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
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
import 'car_model_details_more_with_slieder_model.dart';
export 'car_model_details_more_with_slieder_model.dart';

class CarModelDetailsMoreWithSliederWidget extends StatefulWidget {
  const CarModelDetailsMoreWithSliederWidget({
    Key? key,
    required this.carJsonItem,
  }) : super(key: key);

  final dynamic carJsonItem;

  @override
  _CarModelDetailsMoreWithSliederWidgetState createState() =>
      _CarModelDetailsMoreWithSliederWidgetState();
}

class _CarModelDetailsMoreWithSliederWidgetState
    extends State<CarModelDetailsMoreWithSliederWidget>
    with TickerProviderStateMixin {
  late CarModelDetailsMoreWithSliederModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.linear,
          delay: 100.ms,
          duration: 500.ms,
          begin: Offset(0.0, 800.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarModelDetailsMoreWithSliederModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultrr9 = await GetCarDetailsApiCall.call(
        token: FFAppState().userModel.token,
        id: getJsonField(
          widget.carJsonItem,
          r'''$.id''',
        ).toString().toString(),
      );
      if ((_model.apiResultrr9?.succeeded ?? true)) {
        setState(() {
          _model.detailsJsonObject = GetCarDetailsApiCall.detailsModel(
            (_model.apiResultrr9?.jsonBody ?? ''),
          );
        });
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('error'),
              content: Text((_model.apiResultrr9?.bodyText ?? '')),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).white,
      body: SafeArea(
        top: true,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/mapss.png',
              ).image,
            ),
          ),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final listOfImages = getJsonField(
                            widget.carJsonItem,
                            r'''$.car_sliders''',
                          ).toList();
                          return Container(
                            width: double.infinity,
                            height: 300.0,
                            child: CarouselSlider.builder(
                              itemCount: listOfImages.length,
                              itemBuilder: (context, listOfImagesIndex, _) {
                                final listOfImagesItem =
                                    listOfImages[listOfImagesIndex];
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    'http://hyundai.completechaintech.com/storage/model/${getJsonField(
                                      widget.carJsonItem,
                                      r'''$.car''',
                                    ).toString()}/${getJsonField(
                                      listOfImagesItem,
                                      r'''$.image''',
                                    ).toString()}',
                                    width: 300.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Image.asset(
                                      'assets/images/error_image.png',
                                      width: 300.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                              carouselController: _model.carouselController ??=
                                  CarouselController(),
                              options: CarouselOptions(
                                initialPage: min(1, listOfImages.length - 1),
                                viewportFraction: 1.0,
                                disableCenter: true,
                                enlargeCenterPage: true,
                                enlargeFactor: 1.0,
                                enableInfiniteScroll: true,
                                scrollDirection: Axis.horizontal,
                                autoPlay: true,
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 200),
                                autoPlayInterval:
                                    Duration(milliseconds: (200 + 4000)),
                                autoPlayCurve: Curves.linear,
                                pauseAutoPlayInFiniteScroll: true,
                                onPageChanged: (index, _) =>
                                    _model.carouselCurrentIndex = index,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Opacity(
                      opacity: 0.9,
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 50.0,
                              color: FlutterFlowTheme.of(context).white,
                              offset: Offset(0.0, 55.0),
                              spreadRadius: 15.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 1.00),
                  child: Container(
                    height: 500.0,
                    constraints: BoxConstraints(
                      maxHeight: 600.0,
                    ),
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 5.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xFFC1D6EF),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                                border: Border.all(
                                  color: Color(0xFFC1D6EF),
                                ),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          30.0, 20.0, 30.0, 40.0),
                                      child: GridView(
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 10.0,
                                          mainAxisSpacing: 11.0,
                                          childAspectRatio: 0.9,
                                        ),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFF5584BC),
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              border: Border.all(
                                                color: Color(0xFFAFC3E1),
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 20.0,
                                                          20.0, 8.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: SvgPicture.asset(
                                                      'assets/images/Group_70647.svg',
                                                      width: 100.0,
                                                      height: 40.0,
                                                      fit: BoxFit.scaleDown,
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Text(
                                                        functions
                                                            .getNameByLanguge(
                                                                getJsonField(
                                                                  _model
                                                                      .detailsJsonObject,
                                                                  r'''$.engine_capacity_en''',
                                                                ).toString(),
                                                                getJsonField(
                                                                  _model
                                                                      .detailsJsonObject,
                                                                  r'''$.engine_capacity_ar''',
                                                                ).toString(),
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .languageCode),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Seagoe Ui Bold',
                                                              color:
                                                                  Colors.white,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFF5584BC),
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              border: Border.all(
                                                color: Color(0xFFAFC3E1),
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 20.0,
                                                          20.0, 8.0),
                                                  child: SvgPicture.asset(
                                                    'assets/images/Group_70650.svg',
                                                    width: 100.0,
                                                    height: 40.0,
                                                    fit: BoxFit.scaleDown,
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Text(
                                                        functions
                                                            .getNameByLanguge(
                                                                getJsonField(
                                                                  _model
                                                                      .detailsJsonObject,
                                                                  r'''$.battery_type_en''',
                                                                ).toString(),
                                                                getJsonField(
                                                                  _model
                                                                      .detailsJsonObject,
                                                                  r'''$.battery_type_ar''',
                                                                ).toString(),
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .languageCode),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Seagoe Ui Bold',
                                                              color:
                                                                  Colors.white,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFF5584BC),
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              border: Border.all(
                                                color: Color(0xFFAFC3E1),
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 20.0,
                                                          20.0, 8.0),
                                                  child: SvgPicture.asset(
                                                    'assets/images/Group_70649.svg',
                                                    width: 100.0,
                                                    height: 40.0,
                                                    fit: BoxFit.scaleDown,
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Text(
                                                        functions
                                                            .getNameByLanguge(
                                                                getJsonField(
                                                                  _model
                                                                      .detailsJsonObject,
                                                                  r'''$.fuel_type.name_en''',
                                                                ).toString(),
                                                                getJsonField(
                                                                  _model
                                                                      .detailsJsonObject,
                                                                  r'''$.fuel_type.name_ar''',
                                                                ).toString(),
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .languageCode),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Seagoe Ui Bold',
                                                              color:
                                                                  Colors.white,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          30.0, 0.0, 30.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'z1s82dpt' /* Description */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'HeeboBold',
                                                  color: Color(0xFF212427),
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (getJsonField(
                                          _model.detailsJsonObject,
                                          r'''$.full_description''',
                                        ) !=
                                        null)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            30.0, 15.0, 30.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              getJsonField(
                                                _model.detailsJsonObject,
                                                r'''$.description''',
                                              ).toString(),
                                              maxLines: 2,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Heebo Regular',
                                                    color: Color(0xFF212427),
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          30.0, 15.0, 30.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Builder(
                                            builder: (context) => InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await showAlignedDialog(
                                                  context: context,
                                                  isGlobal: true,
                                                  avoidOverflow: false,
                                                  targetAnchor:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  followerAnchor:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  builder: (dialogContext) {
                                                    return Material(
                                                      color: Colors.transparent,
                                                      child: Container(
                                                        height: 500.0,
                                                        child:
                                                            CarDeteailsComponentsWidget(
                                                          carJsonId:
                                                              getJsonField(
                                                            widget.carJsonItem,
                                                            r'''$.id''',
                                                          ).toString(),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));
                                              },
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '9rfbujwq' /* Specifications >> */,
                                                ),
                                                maxLines: 2,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'HeeboBold',
                                                      color: Color(0xFF092853),
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      useGoogleFonts: false,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          30.0, 20.0, 30.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Divider(
                                            thickness: 1.0,
                                            color: Color(0xFF5584BC),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'CarModelDetailsPdfViewr',
                                                queryParameters: {
                                                  'pdfLink': serializeParam(
                                                    getJsonField(
                                                      _model.detailsJsonObject,
                                                      r'''$.full_catalog''',
                                                    ).toString(),
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 2.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
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
                                                      child: Lottie.network(
                                                        'https://lottie.host/3290845a-665d-44a3-a235-9cd29b35372f/SUYNvZ7Ti2.json',
                                                        width: 40.0,
                                                        height: 30.0,
                                                        fit: BoxFit.contain,
                                                        animate: true,
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
                                                          'ca7jaj1r' /* Catalog */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                            ),
                                          ),
                                          if (getJsonField(
                                                _model.detailsJsonObject,
                                                r'''$.performance''',
                                              ) !=
                                              getJsonField(
                                                (_model.apiResultrr9
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.test_drive''',
                                              ))
                                            Builder(
                                              builder: (context) => InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await showAlignedDialog(
                                                    context: context,
                                                    isGlobal: true,
                                                    avoidOverflow: false,
                                                    targetAnchor:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    followerAnchor:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    builder: (dialogContext) {
                                                      return Material(
                                                        color:
                                                            Colors.transparent,
                                                        child: Container(
                                                          height: 500.0,
                                                          child:
                                                              TestDriveComponentWidget(),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));
                                                },
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 2.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
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
                                                            child: Image.asset(
                                                              'assets/images/Group_72207@2x.png',
                                                              width: 40.0,
                                                              height: 30.0,
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
                                                              'kgthw2vc' /* Book a test drive */,
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
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ].addToEnd(SizedBox(height: 150.0)),
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
                            appBarTitle: getJsonField(
                              widget.carJsonItem,
                              r'''$.name''',
                            ).toString(),
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
