import 'package:hyundai/ui_screens/components/progress_component/progress_component_widget.dart';

import '../../components/login_card_animation_component/login_card_animation_component_widget.dart';
import '../../components/modal06_basic_information/modal06_basic_information_widget.dart';
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

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeScreenModel());
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.deepLinkId != null) {
        checks();
      }
      if (!FFAppState().isGust) {
        _model.localTestAuth2 = await TestAuthUserApiCall.call(
          token: FFAppState().userModel.token,
        );
        if ((_model.localTestAuth2?.succeeded ?? true)) {
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

          if (FFAppState().currentLanguge.isEmpty) {
            FFAppState().currentLanguge =
                FFAppState().userModel.language.isEmpty
                    ? FFLocalizations.of(context).languageCode
                    : FFAppState().userModel.language;
            await UpdateUserApiCall.call(
              name: FFAppState().userModel.name,
              email: FFAppState().userModel.email,
              bod: FFAppState().userModel.bod,
              token: FFAppState().userModel.token,
              phone: FFAppState().userModel.phone,
              lang: FFAppState().currentLanguge,
            );
            setAppLanguage(context, FFAppState().currentLanguge);
          } else {
            setAppLanguage(context, FFAppState().currentLanguge);
          }
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
      await showDialog(
        context: context,
        builder: (dialogContext) {
          return Dialog(
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: ThankYouComponentWidget(),
            ),
          );
        },
      ).then((value) => setState(() {
            FFAppState().update(() {
              FFAppState().badgeCount = 0;
            });
            context.pushReplacementNamed('HomeScreen');
          }));
    } else {
      isLoading = false;
      await showDialog(
        context: context,
        builder: (dialogContext) {
          return Dialog(
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: const AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Modal06BasicInformationWidget(
                body: (_model.apiResult8am?.bodyText ?? ''),
              ),
            ),
          );
        },
      ).then((value) {
        context.pushReplacementNamed('HomeScreen');
      });
    }
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  static const int _crossAxisCount = 3;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height / 1.5;
    double aspectRatio =
        (screenWidth / _crossAxisCount) / (screenHeight / _crossAxisCount);
    _model.aspectRatio = aspectRatio;
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
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFFC1D6EF),
                      FlutterFlowTheme.of(context).white,
                      FlutterFlowTheme.of(context).white,
                      FlutterFlowTheme.of(context).white
                    ],
                    stops: const [0.0, 1.0, 1.0, 1.0],
                    begin: const AlignmentDirectional(0.0, -1.0),
                    end: const AlignmentDirectional(0, 1.0),
                  ),
                ),
                child: ListView(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: SvgPicture.asset(
                            'assets/images/Group_70060.svg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    if (FFAppState().sliderList.isNotEmpty)
                      Builder(
                        builder: (context) {
                          final sliderSlideList =
                              FFAppState().sliderList.map((e) => e).toList();
                          return CarouselSlider.builder(
                            itemCount: sliderSlideList.length,
                            itemBuilder: (context, sliderSlideListIndex, _) {
                              final sliderSlideListItem =
                                  sliderSlideList[sliderSlideListIndex];
                              return ListView(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            30.0, 10.0, 30.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: CachedNetworkImage(
                                        fadeInDuration:
                                            const Duration(milliseconds: 200),
                                        fadeOutDuration:
                                            const Duration(milliseconds: 200),
                                        imageUrl: getJsonField(
                                          sliderSlideListItem,
                                          r'''$.full_image''',
                                        ).toString(),
                                        fit: BoxFit.cover,
                                        errorWidget:
                                            (context, error, stackTrace) =>
                                                Image.asset(
                                          'assets/images/error_image.png',
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            30.0, 10.0, 30.0, 5.0),
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
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'HeeboBold',
                                            color: const Color(0xFF212427),
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ],
                              );
                            },
                            carouselController: _model.carouselController ??=
                                CarouselController(),
                            options: CarouselOptions(
                              initialPage: min(1, sliderSlideList.length - 1),
                              viewportFraction: 1.3,
                              disableCenter: true,
                              enlargeCenterPage: true,
                              enlargeFactor: 1.0,
                              enableInfiniteScroll: true,
                              scrollDirection: Axis.horizontal,
                              autoPlay: true,
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 1000),
                              autoPlayInterval:
                                  Duration(milliseconds: (1000 + 1000)),
                              autoPlayCurve: Curves.linear,
                              pauseAutoPlayInFiniteScroll: true,
                              onPageChanged: (index, _) =>
                                  _model.carouselCurrentIndex = index,
                            ),
                          );
                        },
                      ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          20.0, 0.0, 20.0, 0.0),
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
                    Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 5.0, 10.0, 5.0),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                  childAspectRatio: _model.aspectRatio),
                          scrollDirection: Axis.vertical,
                          itemCount: 6,
                          itemBuilder: (context, gridOfCarModelsItemIndex) {
                            return Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF3D6398),
                                borderRadius: BorderRadius.circular(19.0),
                                border: Border.all(
                                  color: const Color(0xFFAFC3E1),
                                ),
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  clickValue(gridOfCarModelsItemIndex);
                                },
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          5, 5, 5, 5),
                                      child: AspectRatio(
                                        aspectRatio: 1.8,
                                        child: getImageWidget(
                                            gridOfCarModelsItemIndex),
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1.0,
                                      indent: 25.0,
                                      endIndent: 25.0,
                                      color: FlutterFlowTheme.of(context)
                                          .accent4,
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                          textTitleId(
                                              gridOfCarModelsItemIndex)),
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Seagoe Ui Bold',
                                            color: Colors.white,
                                            useGoogleFonts: false,
                                          ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        )),
                  ],
                ),
              ),
              isLoading
                  ? Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0x6A030303),
                      ),
                      child: const Align(
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

  void clickValue(int index) async {
    if (index == 0) {
      if (FFAppState().isGust == true) {
        await showDialog(
          barrierColor: Colors.transparent,
          barrierDismissible: false,
          context: context,
          builder: (dialogContext) {
            return const Dialog(
              child: LoginCardAnimationComponentWidget(),
            );
          },
        ).then((value) => setState(() {}));
        return;
      }
      _model.apiResult2kt = await VehicleApiCall.call(
        token: FFAppState().userModel.token,
      );
      if ((_model.apiResult2kt?.succeeded ?? true)) {
        if (getJsonField(
                  (_model.apiResult2kt?.jsonBody ?? ''),
                  r'''$.vehicles''',
                ) !=
                null &&
            (getJsonField(
              (_model.apiResult2kt?.jsonBody ?? ''),
              r'''$.vehicles''',
            ) as List)
                .isNotEmpty) {
          context.pushNamed('ShopPage');
        } else {
          await showDialog(
            barrierColor: Colors.transparent,
            barrierDismissible: true,
            context: context,
            builder: (dialogContext) {
              return Dialog(
                child: ScannedCardAnimationComponentWidget(),
              );
            },
          ).then((value) => setState(() {}));
        }
      }
      setState(() {});
    } else if (index == 1) {
      if (FFAppState().isGust == true) {
        await showDialog(
          barrierColor: Colors.transparent,
          barrierDismissible: false,
          context: context,
          builder: (dialogContext) {
            return const Dialog(
              child: LoginCardAnimationComponentWidget(),
            );
          },
        ).then((value) => setState(() {}));
        return;
      }
      _model.apiResult2kt = await VehicleApiCall.call(
        token: FFAppState().userModel.token,
      );
      if ((_model.apiResult2kt?.succeeded ?? true)) {
        if (getJsonField(
                  (_model.apiResult2kt?.jsonBody ?? ''),
                  r'''$.vehicles''',
                ) !=
                null &&
            (getJsonField(
              (_model.apiResult2kt?.jsonBody ?? ''),
              r'''$.vehicles''',
            ) as List)
                .isNotEmpty) {
          context.pushNamed(
            'MaintenancePage',
            extra: <String, dynamic>{
              kTransitionInfoKey: TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
              ),
            },
          );
        } else {
          await showDialog(
            barrierColor: Colors.transparent,
            barrierDismissible: true,
            context: context,
            builder: (dialogContext) {
              return Dialog(
                child: ScannedCardAnimationComponentWidget(),
              );
            },
          ).then((value) => setState(() {}));
        }
      }
      setState(() {});
    } else if (index == 2) {
      context.pushNamed(
        'CarModelPage',
        extra: <String, dynamic>{
          kTransitionInfoKey: const TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.bottomToTop,
            duration: Duration(milliseconds: 500),
          ),
        },
      );
    } else if (index == 3) {
      context.pushNamed(
        'LocationPage',
        extra: <String, dynamic>{
          kTransitionInfoKey: const TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 0),
          ),
        },
      );
    } else if (index == 4) {
      context.pushNamed('OffersPage');
    } else if (index == 5) {
      context.pushNamed(
        'NewsPage',
        extra: <String, dynamic>{
          kTransitionInfoKey: const TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 0),
          ),
        },
      );
    }
  }

  Widget getImageWidget(int index) {
    if (index == 0) {
      return SvgPicture.asset(
        'assets/images/Group_70549.svg',
        fit: BoxFit.contain,
      );
    } else if (index == 1) {
      return SvgPicture.asset(
        'assets/images/Group_70550.svg',
        fit: BoxFit.contain,
      );
    } else if (index == 2) {
      return SvgPicture.asset(
        'assets/images/Group_70551.svg',
        fit: BoxFit.contain,
      );
    } else if (index == 3) {
      return Image.asset(
        'assets/images/Group_70552@2x.png',
        fit: BoxFit.contain,
      );
    } else if (index == 4) {
      return SvgPicture.asset(
        'assets/images/Group_72070.svg',
        fit: BoxFit.contain,
      );
    } else {
      return SvgPicture.asset(
        'assets/images/Group_70554.svg',
        fit: BoxFit.contain,
      );
    }
  }

  String textTitleId(int index) {
    if (index == 0) {
      return '0pq4i1m3';
    } else if (index == 1) {
      return '8io5q1kq';
    } else if (index == 2) {
      return 'qts15g7r';
    } else if (index == 3) {
      return '2xlj2tf9';
    } else if (index == 4) {
      return 'xifs34ig';
    } else {
      return 'rncq54oc';
    }
  }
}
