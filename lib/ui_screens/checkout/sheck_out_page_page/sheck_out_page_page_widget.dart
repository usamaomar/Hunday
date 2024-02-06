import 'package:flutter/foundation.dart';
import 'package:hyperpay_plugin/flutter_hyperpay.dart';
import 'package:hyperpay_plugin/model/custom_ui.dart';
import 'package:hyperpay_plugin/model/ready_ui.dart';

import '../../components/modal06_basic_information/modal06_basic_information_widget.dart';
import '../shipping_address_page/in_app_payment_setting.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui_screens/components/hynday_app_bar/hynday_app_bar_widget.dart';
import '/ui_screens/components/thank_you_component/thank_you_component_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'sheck_out_page_page_model.dart';
export 'sheck_out_page_page_model.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:io' show Platform;

class SheckOutPagePageWidget extends StatefulWidget {
  const SheckOutPagePageWidget({
    Key? key,
    this.deepLinkId,
  }) : super(key: key);

  final String? deepLinkId;

  @override
  _SheckOutPagePageWidgetState createState() => _SheckOutPagePageWidgetState();
}

class _SheckOutPagePageWidgetState extends State<SheckOutPagePageWidget>
    with TickerProviderStateMixin  , WidgetsBindingObserver{
  late SheckOutPagePageModel _model;
  late FlutterHyperPay flutterHyperPay;
  bool isLoading = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? redirect;
  Map<String, AnimationInfo> animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 500.ms,
          begin: Offset(0.0, 650.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    _model = createModel(context, () => SheckOutPagePageModel());

    // if (Platform.isAndroid) {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      flutterHyperPay = FlutterHyperPay(
        shopperResultUrl: InAppPaymentSetting.shopperResultUrl,
        // return back to app
        paymentMode: PaymentMode.live,
        // test or live
        lang: InAppPaymentSetting.getLang(),
      );
      if (widget.deepLinkId != null) {
        isLoading = true;
        checks();
      }
    });
    // }

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  void checks() async {
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
          return Material(
            color: Colors.transparent,
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
    WidgetsBinding.instance.removeObserver(this);
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
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).white,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 150.0, 0.0, 0.0),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        50.0, 0.0, 50.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/Group_72049.png',
                                        width: 240.0,
                                        height: 230.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 5.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFC1D6EF),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(25.0),
                                        topRight: Radius.circular(25.0),
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30.0, 20.0, 30.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'utnohcb9' /* Payment Method */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'HeeboBold',
                                                        color:
                                                            Color(0xFF092853),
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30.0, 40.0, 30.0, 0.0),
                                            child: Container(
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  setState(() {
                                                    _model.isPaymentSelected =
                                                        _model.isPaymentSelected ==
                                                                true
                                                            ? false
                                                            : true;
                                                    _model.isCashOnDeliverySelected =
                                                        _model.isPaymentSelected ==
                                                                true
                                                            ? false
                                                            : true;
                                                  });
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 20.0,
                                                            height: 20.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              shape: BoxShape
                                                                  .circle,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .ahayundai,
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            child: Visibility(
                                                              visible: _model
                                                                      .isPaymentSelected ==
                                                                  true,
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation:
                                                                      0.0,
                                                                  shape:
                                                                      const CircleBorder(),
                                                                  child:
                                                                      Container(
                                                                    width: 10.0,
                                                                    height:
                                                                        10.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .ahayundai,
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        width:
                                                                            0.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'zc0zuzu7' /* Payment Gateway */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: Image.asset(
                                                          'assets/images/paypal.png',
                                                          width: 100.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30.0, 35.0, 30.0, 0.0),
                                            child: Container(
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  setState(() {
                                                    _model.isCashOnDeliverySelected =
                                                        _model.isCashOnDeliverySelected ==
                                                                true
                                                            ? false
                                                            : true;
                                                    _model.isPaymentSelected =
                                                        _model.isCashOnDeliverySelected ==
                                                                true
                                                            ? false
                                                            : true;
                                                  });
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 20.0,
                                                            height: 20.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              shape: BoxShape
                                                                  .circle,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .ahayundai,
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            child: Visibility(
                                                              visible: _model
                                                                      .isCashOnDeliverySelected ==
                                                                  true,
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation:
                                                                      0.0,
                                                                  shape:
                                                                      const CircleBorder(),
                                                                  child:
                                                                      Container(
                                                                    width: 10.0,
                                                                    height:
                                                                        10.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .ahayundai,
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        width:
                                                                            0.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'p8ns4vw1' /* Cash on Delivery */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: Image.asset(
                                                          'assets/images/Group_71575@2x.png',
                                                          width: 61.0,
                                                          height: 33.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30.0, 30.0, 30.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        CheckboxThemeData(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0),
                                                      ),
                                                    ),
                                                    unselectedWidgetColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent2,
                                                  ),
                                                  child: Checkbox(
                                                    value:
                                                        _model.checkboxValue ??=
                                                            false,
                                                    onChanged:
                                                        (newValue) async {
                                                      setState(() =>
                                                          _model.checkboxValue =
                                                              newValue!);
                                                    },
                                                    activeColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .ahayundai,
                                                    checkColor:
                                                        Color(0xEBFFFFFF),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'nmxvz08q' /* By clicking the button you agr... */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'HeeboBold',
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    60.0, 5.0, 60.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Builder(
                                                  builder: (context) => InkWell(
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
                                                        'c4kn7j9t' /* Terms & Conditions */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'HeeboBold',
                                                            color: Color(
                                                                0xFF3D6398),
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30.0, 30.5, 30.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Builder(
                                                  builder: (context) =>
                                                      FFButtonWidget(
                                                    onPressed: () async {
                                                      // context.pushNamed(
                                                      //     'PaymentPagePage');
                                                      // return;
                                                      var _shouldSetState =
                                                          false;
                                                      if (_model
                                                              .checkboxValue ==
                                                          true) {
                                                        if ((_model.isCashOnDeliverySelected ==
                                                                true) ||
                                                            (_model.isPaymentSelected ==
                                                                true)) {
                                                          if (_model
                                                                  .isPaymentSelected ==
                                                              true) {
                                                            _model.apiResultgyn =
                                                                await GetPaymentIdApiCall
                                                                    .call(
                                                              token:
                                                                  FFAppState()
                                                                      .userModel
                                                                      .token,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            if ((_model
                                                                    .apiResultgyn
                                                                    ?.succeeded ??
                                                                true)) {
                                                              setState(() {
                                                                _model.paymentModel =
                                                                    PaymentModelStruct.maybeFromMap((_model
                                                                            .apiResultgyn
                                                                            ?.jsonBody ??
                                                                        ''));
                                                              });
                                                              payRequestNowReadyUI(
                                                                  checkoutId: _model
                                                                          .paymentModel
                                                                          ?.id ??
                                                                      "null",
                                                                  merchantId: _model
                                                                          .paymentModel
                                                                          ?.merchantTransactionId ??
                                                                      "null");
                                                            }
                                                          } else {
                                                            _model.apiResultmcd =
                                                                await CashOnDeliveryApiCall
                                                                    .call(
                                                              token:
                                                                  FFAppState()
                                                                      .userModel
                                                                      .token,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            if ((_model
                                                                    .apiResultmcd
                                                                    ?.succeeded ??
                                                                true)) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Dialog(
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap: () => _model
                                                                              .unfocusNode
                                                                              .canRequestFocus
                                                                          ? FocusScope.of(context).requestFocus(_model
                                                                              .unfocusNode)
                                                                          : FocusScope.of(context)
                                                                              .unfocus(),
                                                                      child:
                                                                          ThankYouComponentWidget(),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) {
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                      .badgeCount = 0;
                                                                });
                                                                context.pushReplacementNamed(
                                                                    'HomeScreen');
                                                              });
                                                            } else {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap: () => _model
                                                                              .unfocusNode
                                                                              .canRequestFocus
                                                                          ? FocusScope.of(context).requestFocus(_model
                                                                              .unfocusNode)
                                                                          : FocusScope.of(context)
                                                                              .unfocus(),
                                                                      child:
                                                                          Modal06BasicInformationWidget(
                                                                        body: (_model.apiResultmcd?.bodyText ??
                                                                            ''),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));
                                                            }
                                                          }
                                                        } else {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(FFLocalizations.of(
                                                                        context)
                                                                    .getVariableText(
                                                                  enText:
                                                                      'Aleart',
                                                                  arText:
                                                                      'تنبيه',
                                                                )),
                                                                content: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getVariableText(
                                                                  enText:
                                                                      'Please select payment method',
                                                                  arText:
                                                                      'قم بأختيار طريقة للدفع',
                                                                )),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        'Ok'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                          if (_shouldSetState)
                                                            setState(() {});
                                                          return;
                                                        }
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getVariableText(
                                                                enText:
                                                                    'Aleart',
                                                                arText: 'تنبيه',
                                                              )),
                                                              content: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getVariableText(
                                                                enText:
                                                                    'Dont forget to applay on privacy and policy',
                                                                arText:
                                                                    'لا تنسى الموافقة على الشروط والاحكام',
                                                              )),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                        if (_shouldSetState)
                                                          setState(() {});
                                                        return;
                                                      }

                                                      if (_shouldSetState)
                                                        setState(() {});
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      '7cavw78u' /* Complete your purchase */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      height: 40.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  50.0,
                                                                  0.0,
                                                                  50.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .ahayundai,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ].addToEnd(SizedBox(height: 50.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ).animateOnPageLoad(
                            animationsMap['columnOnPageLoadAnimation']!),
                      ),
                    ],
                  ),
                ),
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
                            enText: 'Checkout',
                            arText: 'الدفع',
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
    );
  }

  static const platform = const MethodChannel("com.comc.hyundai/paymentMethod");
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
        if(redirect!=null){
          context.pushReplacementNamed(
            'HomeScreen',
            queryParameters: {
              'deepLinkId': serializeParam(
                redirect,
                ParamType.String,
              ),
            }.withoutNulls,
          );
        }
    }
  }
  payRequestNowReadyUI(
      {required String checkoutId, required merchantId}) async {
    if (Platform.isIOS || kDebugMode) {
      var result =
          await platform.invokeMethod('getPaymentMetod', <String, dynamic>{
        'checkoutId': checkoutId,
      }).then((value) {
        //https://eu-test.oppwa.com/v1/checkouts/F7172ECA6D1F040A85FFB1BBAEC14673.uat01-vm-tx02/redirect
      redirect = value;
      }).catchError((onError) {
        print("object");
      });
      // context.pushNamed(
      //   'PaymentPagePage',
      //   queryParameters: {
      //     'checkoutId': serializeParam(
      //       checkoutId,
      //       ParamType.String,
      //     ),
      //   }.withoutNulls,
      // );
    } else {
      await flutterHyperPay
          .readyUICards(
        readyUI: ReadyUI(
            brandsName: ["VISA", "MASTER"],
            checkoutId: checkoutId,
            merchantIdApplePayIOS: merchantId,
            countryCodeApplePayIOS: InAppPaymentSetting.countryCode,
            // applePay
            themColorHexIOS: "#000000",
            companyNameApplePayIOS: "Huyndai",
            // FOR IOS ONLY
            setStorePaymentDetailsMode:
                false // store payment details for future use
            ),
      )
          .then((value) async {
        if (value.errorString?.isNotEmpty == true &&
            value.errorString != null) {
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
      }).catchError((onError) {
        print("object");
      });
    }
  }
}
