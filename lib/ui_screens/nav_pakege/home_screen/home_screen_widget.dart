import 'package:hyundai/ui_screens/components/progress_component/progress_component_widget.dart';

import '../../components/thank_you_component/thank_you_component_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/ui_screens/components/scanned_card_animation_component/scanned_card_animation_component_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'home_screen_model.dart';
export 'home_screen_model.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({
    Key? key,
    this.deepLinkId,
  }) : super(key: key);

  final String? deepLinkId;

  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  late HomeScreenModel _model;
  bool isLoading = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeScreenModel());
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.deepLinkId != null) {
        checks();
      }
      _model.localTestAuth2 = await TestAuthUserApiCall.call(
        token: FFAppState().userModel.token,
      );
      if ((_model.localTestAuth2?.succeeded ?? true)) {
        FFAppState().update(() {
          FFAppState().badgeCount = 0;
        });
        setState(() {
          FFAppState().updateUserModelStruct(
            (e) => e
              ..language = getJsonField(
                (_model.localTestAuth2?.jsonBody ?? ''),
                r'''$.user.language''',
              ).toString().toString()
              ..bod = getJsonField(
                (_model.localTestAuth2?.jsonBody ?? ''),
                r'''$.user.bod''',
              ).toString().toString()
              ..name = getJsonField(
                (_model.localTestAuth2?.jsonBody ?? ''),
                r'''$.user.name''',
              ).toString().toString()
              ..email = getJsonField(
                (_model.localTestAuth2?.jsonBody ?? ''),
                r'''$.user.email''',
              ).toString().toString()
              ..phone = getJsonField(
                (_model.localTestAuth2?.jsonBody ?? ''),
                r'''$.user.phone''',
              ).toString().toString(),
          );
        });
      } else {
        setState(() {
          FFAppState().userModel =
              UserModelStruct.fromSerializableMap(jsonDecode('{}'));
        });
        if (Navigator.of(context).canPop()) {
          context.pop();
        }
        context.pushNamed(
          'splashPage',
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );
        return;
      }

      _model.socialMediaOut = await SettingApiCall.call(
        token: FFAppState().userModel.token,
      );
      if ((_model.socialMediaOut?.succeeded ?? true)) {
        setState(() {
          FFAppState().socialMediaJsonObject =
              SettingApiCall.socialMediaJsonObject(
            (_model.socialMediaOut?.jsonBody ?? ''),
          )!
                  .toList()
                  .cast<dynamic>();
        });
      }
      _model.locationsApiResponce = await LocationApiCall.call(
        token: FFAppState().userModel.token,
      );
      if ((_model.locationsApiResponce?.succeeded ?? true)) {
        setState(() {
          FFAppState().sharedLocationsJsonList =
              LocationApiCall.apiLocationsJsonList(
            (_model.locationsApiResponce?.jsonBody ?? ''),
          )!
                  .toList()
                  .cast<dynamic>();
          FFAppState().listOfOpendItems = functions
              .addFalseValuesToList(LocationApiCall.apiLocationsJsonList(
                (_model.locationsApiResponce?.jsonBody ?? ''),
              )!
                  .length)
              .toList()
              .cast<bool>();
        });
        setState(() {
          _model.listOfJsons = FFAppState().sliderList.toList().cast<dynamic>();
        });
      }
      _model.apiResultSlider = await SliderApiCall.call(
        token: FFAppState().userModel.token,
      );
      if ((_model.apiResultSlider?.succeeded ?? true)) {
        setState(() {
          FFAppState().sliderList = SliderApiCall.listSliderItems(
            (_model.apiResultSlider?.jsonBody ?? ''),
          )!
              .toList()
              .cast<dynamic>();
        });
        setState(() {
          _model.listOfJsons = FFAppState().sliderList.toList().cast<dynamic>();
        });
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  void checks() async {
    isLoading = true;
    _model.apiResult8am = await GetPaymentStatusApiCall.call(
      token: FFAppState().userModel.token,
    );


    if ((_model.apiResult8am?.succeeded ?? true)) {
      isLoading = false;
      print('${_model.apiResult8am?.bodyText}');
      print('---------------------------------');
      print('${_model.apiResult8am?.jsonBody}');
      await showDialog(
        context: context,
        builder: (dialogContext) {
          return Dialog(child: GestureDetector(
            onTap: () => _model.unfocusNode.canRequestFocus
                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                : FocusScope.of(context).unfocus(),
            child: ThankYouComponentWidget(),
          ),);
        },
      ).then((value) => setState(() {
            FFAppState().update(() {
              FFAppState().badgeCount = 0;
            });
          }));
    } else {
      isLoading = false;
      await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text(FFLocalizations.of(context).getVariableText(
                enText: 'Error',
                arText: 'مشكلة خادم',
              )),
              content: Text(FFLocalizations.of(context).getVariableText(
                enText: 'Issue With Payment Method',
                arText: 'مشكلة في عملية الدفع',
              )),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text(FFLocalizations.of(context).getVariableText(
                    enText: 'Ok',
                    arText: 'حسنا',
                  )),
                ),
              ],
            );
          });
    }
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
        backgroundColor: Color(0xFFAFC3E1),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFC1D6EF),
                      FlutterFlowTheme.of(context).white,
                      FlutterFlowTheme.of(context).white,
                      FlutterFlowTheme.of(context).white
                    ],
                    stops: [0.0, 1.0, 1.0, 1.0],
                    begin: AlignmentDirectional(0.0, -1.0),
                    end: AlignmentDirectional(0, 1.0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 25.0, 0.0, 0.0),
                          child: SvgPicture.asset(
                            'assets/images/Group_70060.svg',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ],
                    ),
                    ClipRRect(
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (FFAppState().sliderList.length > 0)
                              Expanded(
                                child: Builder(
                                  builder: (context) {
                                    final sliderSlideList = FFAppState()
                                        .sliderList
                                        .map((e) => e)
                                        .toList();
                                    return Container(
                                      width: double.infinity,
                                      child: CarouselSlider.builder(
                                        itemCount: sliderSlideList.length,
                                        itemBuilder:
                                            (context, sliderSlideListIndex, _) {
                                          final sliderSlideListItem =
                                              sliderSlideList[
                                                  sliderSlideListIndex];
                                          return Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        30.0, 0.0, 30.0, 0.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: Duration(
                                                        milliseconds: 200),
                                                    fadeOutDuration: Duration(
                                                        milliseconds: 200),
                                                    imageUrl: getJsonField(
                                                      sliderSlideListItem,
                                                      r'''$.full_image''',
                                                    ).toString(),
                                                    width: double.infinity,
                                                    height: 150.0,
                                                    fit: BoxFit.cover,
                                                    errorWidget: (context,
                                                            error,
                                                            stackTrace) =>
                                                        Image.asset(
                                                      'assets/images/error_image.png',
                                                      width: double.infinity,
                                                      height: 150.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(30.0, 10.0,
                                                          30.0, 10.0),
                                                  child: Text(
                                                    functions.getNameByLanguge(
                                                        getJsonField(
                                                          sliderSlideListItem,
                                                          r'''$.slogan_en''',
                                                        ).toString(),
                                                        getJsonField(
                                                          sliderSlideListItem,
                                                          r'''$.slogan_ar''',
                                                        ).toString(),
                                                        FFAppState().currentLanguge),
                                                    textAlign: TextAlign.center,
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'HeeboBold',
                                                          color:
                                                              Color(0xFF212427),
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                        carouselController:
                                            _model.carouselController ??=
                                                CarouselController(),
                                        options: CarouselOptions(
                                          initialPage: min(
                                              1, sliderSlideList.length - 1),
                                          viewportFraction: 1.0,
                                          disableCenter: true,
                                          enlargeCenterPage: true,
                                          enlargeFactor: 1.0,
                                          enableInfiniteScroll: true,
                                          scrollDirection: Axis.horizontal,
                                          autoPlay: true,
                                          autoPlayAnimationDuration:
                                              Duration(milliseconds: 1000),
                                          autoPlayInterval: Duration(
                                              milliseconds: (1000 + 1000)),
                                          autoPlayCurve: Curves.linear,
                                          pauseAutoPlayInFiniteScroll: true,
                                          onPageChanged: (index, _) => _model
                                              .carouselCurrentIndex = index,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            30.0, 0.0, 30.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Container(
                                height: 1.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF3D6398),
                                  border: Border.all(
                                    color: Color(0xFF3D6398),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 0.0, 30.0, 75.0),
                            child: GridView(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 11.0,
                                childAspectRatio: 0.71,
                              ),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: [
                                Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(19.0),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF3D6398),
                                      borderRadius: BorderRadius.circular(19.0),
                                      border: Border.all(
                                        color: Color(0xFFAFC3E1),
                                      ),
                                    ),
                                    child: Builder(
                                      builder: (context) => InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.apiResult2kt =
                                              await VehicleApiCall.call(
                                            token: FFAppState().userModel.token,
                                          );
                                          if ((_model.apiResult2kt?.succeeded ??
                                              true)) {
                                            if (getJsonField(
                                                      (_model.apiResult2kt
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.vehicles''',
                                                    ) !=
                                                    null &&
                                                (getJsonField(
                                                  (_model.apiResult2kt
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.vehicles''',
                                                ) as List)
                                                    .isNotEmpty) {
                                              context.pushNamed('ShopPage');
                                            } else {
                                              await showDialog(
                                                barrierColor:
                                                    Colors.transparent,
                                                barrierDismissible: false,
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    child: ScannedCardAnimationComponentWidget(),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            }
                                          }
                                          setState(() {});
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 8.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/Group_70549.svg',
                                                  width: 100.0,
                                                  height: 40.0,
                                                  fit: BoxFit.scaleDown,
                                                ),
                                              ),
                                            ),
                                            Divider(
                                              thickness: 1.0,
                                              indent: 25.0,
                                              endIndent: 25.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent4,
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '0pq4i1m3' /* Parts Shop */,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Seagoe Ui Bold',
                                                          color: Colors.white,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(19.0),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF3D6398),
                                      borderRadius: BorderRadius.circular(19.0),
                                      border: Border.all(
                                        color: Color(0xFFAFC3E1),
                                      ),
                                    ),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'MaintenancePage',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 20.0, 20.0, 8.0),
                                            child: SvgPicture.asset(
                                              'assets/images/Group_70550.svg',
                                              width: 100.0,
                                              height: 40.0,
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1.0,
                                            indent: 25.0,
                                            endIndent: 25.0,
                                            color: FlutterFlowTheme.of(context)
                                                .accent4,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '8io5q1kq' /* Services */,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Seagoe Ui Bold',
                                                        color: Colors.white,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(19.0),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF3D6398),
                                      borderRadius: BorderRadius.circular(19.0),
                                      border: Border.all(
                                        color: Color(0xFFAFC3E1),
                                      ),
                                    ),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'CarModelPage',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .bottomToTop,
                                              duration:
                                                  Duration(milliseconds: 500),
                                            ),
                                          },
                                        );
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 20.0, 20.0, 8.0),
                                            child: SvgPicture.asset(
                                              'assets/images/Group_70551.svg',
                                              width: 100.0,
                                              height: 40.0,
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1.0,
                                            indent: 25.0,
                                            endIndent: 25.0,
                                            color: FlutterFlowTheme.of(context)
                                                .accent4,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'qts15g7r' /* Car model */,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Seagoe Ui Bold',
                                                        color: Colors.white,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(19.0),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF3D6398),
                                      borderRadius: BorderRadius.circular(19.0),
                                      border: Border.all(
                                        color: Color(0xFFAFC3E1),
                                      ),
                                    ),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'LocationPage',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 20.0, 20.0, 8.0),
                                            child: Image.asset(
                                              'assets/images/Group_70552@2x.png',
                                              width: 100.0,
                                              height: 40.0,
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1.0,
                                            indent: 25.0,
                                            endIndent: 25.0,
                                            color: FlutterFlowTheme.of(context)
                                                .accent4,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '2xlj2tf9' /* Locations */,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Seagoe Ui Bold',
                                                        color: Colors.white,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(19.0),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF3D6398),
                                      borderRadius: BorderRadius.circular(19.0),
                                      border: Border.all(
                                        color: Color(0xFFAFC3E1),
                                      ),
                                    ),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed('OffersPage');
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 20.0, 20.0, 8.0),
                                            child: SvgPicture.asset(
                                              'assets/images/Group_72070.svg',
                                              width: 100.0,
                                              height: 40.0,
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1.0,
                                            indent: 25.0,
                                            endIndent: 25.0,
                                            color: FlutterFlowTheme.of(context)
                                                .accent4,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'xifs34ig' /* Monthly offers */,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Seagoe Ui Bold',
                                                        color: Colors.white,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(19.0),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF3D6398),
                                      borderRadius: BorderRadius.circular(19.0),
                                      border: Border.all(
                                        color: Color(0xFFAFC3E1),
                                      ),
                                    ),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'NewsPage',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 20.0, 20.0, 8.0),
                                            child: SvgPicture.asset(
                                              'assets/images/Group_70554.svg',
                                              width: 100.0,
                                              height: 40.0,
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1.0,
                                            indent: 25.0,
                                            endIndent: 25.0,
                                            color: FlutterFlowTheme.of(context)
                                                .accent4,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'rncq54oc' /* News */,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Seagoe Ui Bold',
                                                        color: Colors.white,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
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
                  ],
                ),
              ),
              isLoading
                  ? Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0x6A030303),
                      ),
                      child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: ProgressComponentWidget()),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
