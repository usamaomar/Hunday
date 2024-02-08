import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/ui_screens/components/hynday_app_bar/hynday_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'settings_page_model.dart';
export 'settings_page_model.dart';
import '/flutter_flow/custom_functions.dart' as functions;

class SettingsPageWidget extends StatefulWidget {
  const SettingsPageWidget({super.key});

  @override
  State<SettingsPageWidget> createState() => _SettingsPageWidgetState();
}

class _SettingsPageWidgetState extends State<SettingsPageWidget>
    with TickerProviderStateMixin {
  late SettingsPageModel _model;
  bool canSupportVals = false;
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
    _model = createModel(context, () => SettingsPageModel());
  }

  Future<bool> canSupport() async {
    final _localAuth = LocalAuthentication();
    bool _isBiometricSupported = await _localAuth.isDeviceSupported();
    bool canCheckBiometrics = await _localAuth.canCheckBiometrics;
    return _isBiometricSupported || canCheckBiometrics;
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
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: SingleChildScrollView(
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
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
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
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        40.0, 120.0, 40.0, 0.0),
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
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    20.0),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    8.0),
                                                child: AspectRatio(
                                                  aspectRatio: 1.6,
                                                  child: Image.asset(
                                                    'assets/images/tucson-nx4-fmc-highlights-4th-generation-tucson-poised-to-set-new-record-pc@2x.png',
                                                    fit: BoxFit.contain,
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
                            Padding(
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
                                      5.0, 0.0, 5.0, 100.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                          BorderRadius.circular(20.0),
                                        ),
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  30.0, 20.0, 30.0, 20.0),
                                              child: Column(
                                                mainAxisSize:
                                                MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0.0,
                                                        10.0,
                                                        0.0,
                                                        0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                context)
                                                                .getText(
                                                              'av01m895' /* Settings */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                .of(context)
                                                                .bodyMedium
                                                                .override(
                                                              fontFamily:
                                                              'Heebo',
                                                              color: Colors
                                                                  .black,
                                                              fontSize:
                                                              14.0,
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
                                                ],
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  15.0, 20.0, 15.0, 20.0),
                                              child: Row(
                                                mainAxisSize:
                                                MainAxisSize.max,
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Flexible(
                                                    child: Column(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        SizedBox(
                                                          width: 135.0,
                                                          child: Divider(
                                                            height: 0.0,
                                                            thickness: 8.0,
                                                            color: Color(
                                                                0xFF092853),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                          MainAxisSize
                                                              .min,
                                                          children: [
                                                            SizedBox(
                                                              height: 50.0,
                                                              child:
                                                              VerticalDivider(
                                                                width: 0.0,
                                                                thickness:
                                                                8.0,
                                                                color: Color(
                                                                    0xFF092853),
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
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 15.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Flexible(
                                              child: Opacity(
                                                opacity: 0.8,
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(5.0, 0.0,
                                                      5.0, 0.0),
                                                  child: FlutterFlowDropDown<
                                                      String>(
                                                    controller: _model
                                                        .dropDownValueController ??=
                                                        FormFieldController<
                                                            String>(null),
                                                    options: [
                                                      FFLocalizations.of(
                                                          context)
                                                          .getText(
                                                        '6tp1dk3s' /* English */,
                                                      ),
                                                      FFLocalizations.of(
                                                          context)
                                                          .getText(
                                                        's66g1rxi' /* Arabic */,
                                                      )
                                                    ],
                                                    onChanged: (val) async {
                                                      setState(() => _model
                                                          .dropDownValue =
                                                          val);
                                                      var shouldSetState =
                                                      false;
                                                      if (_model
                                                          .dropDownValue ==
                                                          FFLocalizations.of(
                                                              context)
                                                              .getVariableText(
                                                            enText: 'English',
                                                            arText:
                                                            'الانجليزية',
                                                          )) {
                                                        setAppLanguage(
                                                            context, 'en');
                                                        setState(() {
                                                          FFAppState()
                                                              .currentLanguge =
                                                          'en';
                                                        });
                                                      } else {
                                                        setAppLanguage(
                                                            context, 'ar');
                                                        setState(() {
                                                          FFAppState()
                                                              .currentLanguge =
                                                          'ar';
                                                        });
                                                      }
                                                      _model.updateResponse =
                                                      await UpdateUserApiCall
                                                          .call(
                                                        name: FFAppState()
                                                            .userModel
                                                            .name,
                                                        email: FFAppState()
                                                            .userModel
                                                            .email,
                                                        bod: FFAppState()
                                                            .userModel
                                                            .bod,
                                                        token: FFAppState()
                                                            .userModel
                                                            .token,
                                                        phone: FFAppState()
                                                            .userModel
                                                            .phone,
                                                        lang: FFAppState()
                                                            .currentLanguge,
                                                      );
                                                      shouldSetState = true;
                                                      if ((_model
                                                          .updateResponse
                                                          ?.succeeded ??
                                                          true)) {
                                                        setState(() {});
                                                      } else {
                                                        if (shouldSetState)
                                                          setState(() {});
                                                        return;
                                                      }

                                                      if (shouldSetState) {
                                                        setState(() {});
                                                      }
                                                    },
                                                    textStyle:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .bodyMedium,
                                                    hintText:
                                                    FFLocalizations.of(
                                                        context)
                                                        .getText(
                                                      'icx7hoih' /* Languge */,
                                                    ),
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    fillColor: FlutterFlowTheme
                                                        .of(context)
                                                        .secondaryBackground,
                                                    elevation: 0.0,
                                                    borderColor:
                                                    Color(0xFFC2C4C5),
                                                    borderWidth: 1.0,
                                                    borderRadius: 3.0,
                                                    margin:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        10.0,
                                                        0.0,
                                                        10.0,
                                                        0.0),
                                                    hidesUnderline: true,
                                                    isSearchable: false,
                                                    isMultiSelect: false,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        height: 0.0,
                                        thickness: 0.5,
                                        indent: 15.0,
                                        endIndent: 15.0,
                                        color: Color(0xFFABADAE),
                                      ),
                                      Padding(
                                        padding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 15.0, 15.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Column(
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
                                                    FFLocalizations.of(
                                                        context)
                                                        .getText(
                                                      'ue3obsq6' /* App Version */,
                                                    ),
                                                    textAlign:
                                                    TextAlign.start,
                                                    style: FlutterFlowTheme
                                                        .of(context)
                                                        .bodyMedium
                                                        .override(
                                                      fontFamily:
                                                      'HeeboBold',
                                                      color: Color(
                                                          0xFF3D6398),
                                                      fontSize: 14.0,
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
                                                      .fromSTEB(0.0, 5.0,
                                                      0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(
                                                        context)
                                                        .getText(
                                                      '8muh1h1k' /* 3.8.10 */,
                                                    ),
                                                    textAlign:
                                                    TextAlign.start,
                                                    style: FlutterFlowTheme
                                                        .of(context)
                                                        .bodyMedium
                                                        .override(
                                                      fontFamily:
                                                      'HeeboBold',
                                                      color: Color(
                                                          0xFF212427),
                                                      fontSize: 13.0,
                                                      fontWeight:
                                                      FontWeight.bold,
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
                                      Divider(
                                        height: 0.0,
                                        thickness: 0.5,
                                        indent: 15.0,
                                        endIndent: 15.0,
                                        color: Color(0xFFABADAE),
                                      ),
                                      // Opacity(
                                      //   opacity: 0.5,
                                      //   child: Padding(
                                      //     padding:
                                      //         EdgeInsetsDirectional.fromSTEB(
                                      //             15.0, 10.0, 15.0, 10.0),
                                      //     child: Row(
                                      //       mainAxisSize: MainAxisSize.max,
                                      //       mainAxisAlignment:
                                      //           MainAxisAlignment
                                      //               .spaceBetween,
                                      //       children: [
                                      //         Row(
                                      //           mainAxisSize:
                                      //               MainAxisSize.max,
                                      //           children: [
                                      //             Container(
                                      //               decoration: BoxDecoration(
                                      //                 color: FlutterFlowTheme
                                      //                         .of(context)
                                      //                     .secondaryBackground,
                                      //                 borderRadius:
                                      //                     BorderRadius
                                      //                         .circular(3.0),
                                      //                 border: Border.all(
                                      //                   color: FlutterFlowTheme
                                      //                           .of(context)
                                      //                       .ahayundai,
                                      //                   width: 0.5,
                                      //                 ),
                                      //               ),
                                      //               child: Padding(
                                      //                 padding:
                                      //                     EdgeInsets.all(5.0),
                                      //                 child: Icon(
                                      //                   Icons
                                      //                       .nightlight_rounded,
                                      //                   color:
                                      //                       Color(0xFF212427),
                                      //                   size: 20.0,
                                      //                 ),
                                      //               ),
                                      //             ),
                                      //             Padding(
                                      //               padding:
                                      //                   EdgeInsetsDirectional
                                      //                       .fromSTEB(
                                      //                           10.0,
                                      //                           0.0,
                                      //                           10.0,
                                      //                           0.0),
                                      //               child: Text(
                                      //                 FFLocalizations.of(
                                      //                         context)
                                      //                     .getText(
                                      //                   'rf3peq4r' /* Dark mode */,
                                      //                 ),
                                      //                 textAlign:
                                      //                     TextAlign.start,
                                      //                 style: FlutterFlowTheme
                                      //                         .of(context)
                                      //                     .bodyMedium
                                      //                     .override(
                                      //                       fontFamily:
                                      //                           'HeeboBold',
                                      //                       color: Color(
                                      //                           0xFF3D6398),
                                      //                       fontSize: 14.0,
                                      //                       fontWeight:
                                      //                           FontWeight
                                      //                               .bold,
                                      //                       useGoogleFonts:
                                      //                           false,
                                      //                     ),
                                      //               ),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //         Switch.adaptive(
                                      //           value: _model.switchValue1 ??=
                                      //               FFAppState().isDarkMode,
                                      //           onChanged: (newValue) async {
                                      //             setState(() =>
                                      //                 _model.switchValue1 =
                                      //                     newValue!);
                                      //
                                      //             if (!newValue!) {
                                      //               setDarkModeSetting(
                                      //                   context,
                                      //                   ThemeMode.light);
                                      //               setState(() {
                                      //                 FFAppState()
                                      //                     .isDarkMode = false;
                                      //               });
                                      //             }
                                      //           },
                                      //           activeColor: Color(0xFFFFFF),
                                      //           activeTrackColor:
                                      //           Color(0xFF4caf50),
                                      //           inactiveTrackColor:
                                      //           Color(0xFFABADAE),
                                      //           inactiveThumbColor:
                                      //           FlutterFlowTheme.of(context)
                                      //               .secondaryText,
                                      //         ),
                                      //       ],
                                      //     ),
                                      //   ),
                                      // ),
                                      // Divider(
                                      //   height: 0.0,
                                      //   thickness: 0.5,
                                      //   indent: 15.0,
                                      //   endIndent: 15.0,
                                      //   color: Color(0xFFABADAE),
                                      // ),
                                      FutureBuilder(
                                        future: canSupport(),
                                        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                                          return Visibility(
                                            visible : snapshot.connectionState.name == 'done' && snapshot.data == true,
                                            child: Padding(
                                              padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 10.0, 15.0, 10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        decoration: BoxDecoration(
                                                          color: FlutterFlowTheme
                                                              .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(3.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .ahayundai,
                                                            width: 0.5,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                          EdgeInsets.all(5.0),
                                                          child: Icon(
                                                            Icons.fingerprint,
                                                            color:
                                                            Color(0xFF3D6398),
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            10.0,
                                                            0.0,
                                                            10.0,
                                                            0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                              context)
                                                              .getText(
                                                            'gup13knb' /* Enable fingerprint */,
                                                          ),
                                                          textAlign:
                                                          TextAlign.start,
                                                          style: FlutterFlowTheme
                                                              .of(context)
                                                              .bodyMedium
                                                              .override(
                                                            fontFamily:
                                                            'HeeboBold',
                                                            color: Color(
                                                                0xFF3D6398),
                                                            fontSize: 14.0,
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
                                                  Switch.adaptive(
                                                    value: _model.switchValue2 ??=
                                                        FFAppState()
                                                            .isFingerEnabled,
                                                    onChanged: (newValue) async {
                                                      setState(() =>
                                                      _model.switchValue2 =
                                                      newValue!);
                                                      if (newValue!) {
                                                        final _localAuth =
                                                        LocalAuthentication();
                                                        bool
                                                        _isBiometricSupported =
                                                        await _localAuth
                                                            .isDeviceSupported();
                                                        bool canCheckBiometrics =
                                                        await _localAuth
                                                            .canCheckBiometrics;
                                                        if (_isBiometricSupported &&
                                                            canCheckBiometrics) {
                                                          _model.allowsBes = await _localAuth
                                                              .authenticate(
                                                              localizedReason:
                                                              FFLocalizations.of(
                                                                  context)
                                                                  .getText(
                                                                '6yklnh8p' /* app is requesting your finger ... */,
                                                              ),
                                                              options: const AuthenticationOptions(
                                                                  biometricOnly:
                                                                  true));
                                                          setState(() {});
                                                        }

                                                        if (_model.allowsBes ==
                                                            true) {
                                                          setState(() {
                                                            FFAppState()
                                                                .isFingerEnabled =
                                                            true;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            FFAppState()
                                                                .isFingerEnabled =
                                                            false;
                                                          });
                                                        }

                                                        setState(() {});
                                                      } else {
                                                        setState(() {
                                                          FFAppState()
                                                              .isFingerEnabled =
                                                          false;
                                                        });
                                                      }
                                                    },
                                                    activeColor: Color(0xFFFFFF),
                                                    activeTrackColor:
                                                    Color(0xFF4caf50),
                                                    inactiveTrackColor:
                                                    Color(0xFFABADAE),
                                                    inactiveThumbColor:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .secondaryText,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      Divider(
                                        height: 0.0,
                                        thickness: 0.5,
                                        indent: 15.0,
                                        endIndent: 15.0,
                                        color: Color(0xFFABADAE),
                                      ),
                                      Padding(
                                        padding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 15.0, 15.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Column(
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
                                                    FFLocalizations.of(
                                                        context)
                                                        .getText(
                                                      'zgpc70uw' /* Terms And Conditions */,
                                                    ),
                                                    textAlign:
                                                    TextAlign.start,
                                                    style: FlutterFlowTheme
                                                        .of(context)
                                                        .bodyMedium
                                                        .override(
                                                      fontFamily:
                                                      'HeeboBold',
                                                      color: Color(
                                                          0xFF3D6398),
                                                      fontSize: 14.0,
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
                                                      .fromSTEB(0.0, 5.0,
                                                      0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                    Colors.transparent,
                                                    focusColor:
                                                    Colors.transparent,
                                                    hoverColor:
                                                    Colors.transparent,
                                                    highlightColor:
                                                    Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'AboutAppPage',
                                                        queryParameters: {
                                                          'title':
                                                          serializeParam(
                                                            FFLocalizations.of(
                                                                context)
                                                                .getVariableText(
                                                              enText:
                                                              'Privacy & Terms',
                                                              arText:
                                                              'الشروط والاحكام',
                                                            ),
                                                            ParamType.String,
                                                          ),
                                                          'body':
                                                          serializeParam(
                                                            functions.getSettingByKey(
                                                                FFAppState().currentLanguge ==
                                                                    'en'
                                                                    ? 'condition_en'
                                                                    : 'condition_ar',
                                                                FFAppState()
                                                                    .socialMediaJsonObject
                                                                    .toList()),
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Text(
                                                      FFLocalizations.of(
                                                          context)
                                                          .getText(
                                                        'kuzu2j3c' /* Read More */,
                                                      ),
                                                      textAlign:
                                                      TextAlign.start,
                                                      style: FlutterFlowTheme
                                                          .of(context)
                                                          .bodyMedium
                                                          .override(
                                                        fontFamily:
                                                        'HeeboBold',
                                                        color: Color(
                                                            0xFF212427),
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold,
                                                        decoration:
                                                        TextDecoration
                                                            .underline,
                                                        useGoogleFonts:
                                                        false,
                                                      ),
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
                              ),
                            ),
                          ],
                        ),
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
                                enText: 'Settings',
                                arText: 'الأعدادات',
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
      ),
    );
  }
}
