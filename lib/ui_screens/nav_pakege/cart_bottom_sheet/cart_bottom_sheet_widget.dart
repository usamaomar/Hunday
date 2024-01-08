import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui_screens/components/delete_dialog/delete_dialog_widget.dart';
import '/ui_screens/components/modal06_basic_information/modal06_basic_information_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'cart_bottom_sheet_model.dart';
export 'cart_bottom_sheet_model.dart';

class CartBottomSheetWidget extends StatefulWidget {
  const CartBottomSheetWidget({
    Key? key,
    bool? isComponentView,
  })  : this.isComponentView = isComponentView ?? true,
        super(key: key);

  final bool isComponentView;

  @override
  _CartBottomSheetWidgetState createState() => _CartBottomSheetWidgetState();
}

class _CartBottomSheetWidgetState extends State<CartBottomSheetWidget>
    with TickerProviderStateMixin {
  late CartBottomSheetModel _model;

  final animationsMap = {
    'progressBarOnPageLoadAnimation': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 390.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartBottomSheetModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultx44 = await GetMyCartApiCall.call(
        token: FFAppState().userModel.token,
      );
      if ((_model.apiResultx44?.succeeded ?? true)) {
        if (getJsonField(
              (_model.apiResultx44?.jsonBody ?? ''),
              r'''$.cart''',
            ) !=
            null) {
          setState(() {
            _model.listOfCartItemsLocal = functions
                .convertFromJsonToCartObject(getJsonField(
                  (_model.apiResultx44?.jsonBody ?? ''),
                  r'''$.cart''',
                ))
                .cartItems
                .toList()
                .cast<PartModelStruct>();
          });
          setState(() {
            _model.totalPrice = functions
                .convertFromJsonToCartObject(getJsonField(
                  (_model.apiResultx44?.jsonBody ?? ''),
                  r'''$.cart''',
                ))
                .subTotal;
          });
          FFAppState().update(() {
            FFAppState().badgeCount = _model.listOfCartItemsLocal.length;
          });
        } else {
          FFAppState().update(() {
            FFAppState().badgeCount = 0;
          });
        }
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color(0x00FFFFFF),
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          30.0, 30.0, 30.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'xjep3rwe' /* Your Cart */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'HeeboBold',
                                  color: Color(0xFF092853),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                          ),
                          if (widget.isComponentView)
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.close,
                                color: Color(0xFF092853),
                                size: 24.0,
                              ),
                            ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1.0,
                      indent: 35.0,
                      endIndent: 35.0,
                      color: Color(0xFF092853),
                    ),
                    if (widget.isComponentView)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            30.0, 10.0, 30.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                              text: FFLocalizations.of(context).getText(
                                'eqnxfwdp' /* Add New Item */,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).white,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF092853),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Color(0xFF092853),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Builder(
                            builder: (context) {
                              final seedCartList = _model.listOfCartItemsLocal
                                  .map((e) => e)
                                  .toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: seedCartList.length,
                                itemBuilder: (context, seedCartListIndex) {
                                  final seedCartListItem =
                                      seedCartList[seedCartListIndex];
                                  return Visibility(
                                    visible: seedCartListItem.quantity > 0,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  30.0, 10.0, 30.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Card(
                                                        clipBehavior: Clip
                                                            .antiAliasWithSaveLayer,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        elevation: 4.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Stack(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, 0.0),
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .network(
                                                                        seedCartListItem
                                                                            .fullImage,
                                                                        width:
                                                                            100.0,
                                                                        height:
                                                                            95.0,
                                                                        fit: BoxFit
                                                                            .fill,
                                                                        errorBuilder: (context,
                                                                                error,
                                                                                stackTrace) =>
                                                                            Image.asset(
                                                                          'assets/images/error_image.png',
                                                                          width:
                                                                              100.0,
                                                                          height:
                                                                              95.0,
                                                                          fit: BoxFit
                                                                              .fill,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  if ((seedCartListItem.specialPrice !=
                                                                              null) &&
                                                                          (seedCartListItem.specialPrice >
                                                                              0.0)
                                                                      ? true
                                                                      : false)
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            10.0),
                                                                        child:
                                                                            Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          elevation:
                                                                              2.0,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(10.0),
                                                                              bottomRight: Radius.circular(0.0),
                                                                              topLeft: Radius.circular(10.0),
                                                                              topRight: Radius.circular(0.0),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                30.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).white,
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(10.0),
                                                                                bottomRight: Radius.circular(0.0),
                                                                                topLeft: Radius.circular(10.0),
                                                                                topRight: Radius.circular(0.0),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Text(
                                                                                      seedCartListItem.specialPrice != null
                                                                                          ? '${seedCartListItem.specialPrice.toString()} ${FFLocalizations.of(context).getVariableText(
                                                                                              enText: 'JOD',
                                                                                              arText: 'دينار',
                                                                                            )}'
                                                                                          : '0',
                                                                                      textAlign: TextAlign.center,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: Color(0xFFD60000),
                                                                                            fontSize: 12.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          30.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFF3D6398),
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(10.0),
                                                                          bottomRight:
                                                                              Radius.circular(0.0),
                                                                          topLeft:
                                                                              Radius.circular(10.0),
                                                                          topRight:
                                                                              Radius.circular(0.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              15.0,
                                                                              0.0,
                                                                              15.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Stack(
                                                                                children: [
                                                                                  if ((seedCartListItem.specialPrice != null) && (seedCartListItem.specialPrice > 0.0))
                                                                                    Text(
                                                                                      '${seedCartListItem.price.toString()} ${FFLocalizations.of(context).getVariableText(
                                                                                        enText: 'JOD',
                                                                                        arText: 'دينار',
                                                                                      )}',
                                                                                      textAlign: TextAlign.center,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: FlutterFlowTheme.of(context).white,
                                                                                            fontSize: 12.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                            decoration: TextDecoration.lineThrough,
                                                                                          ),
                                                                                    ),
                                                                                  if (seedCartListItem.specialPrice <= 0.0)
                                                                                    Text(
                                                                                      '${seedCartListItem.price.toString()} ${FFLocalizations.of(context).getVariableText(
                                                                                        enText: 'JOD',
                                                                                        arText: 'دينار',
                                                                                      )}',
                                                                                      textAlign: TextAlign.center,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: FlutterFlowTheme.of(context).white,
                                                                                            fontSize: 12.0,
                                                                                            fontWeight: FontWeight.normal,
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
                                                                ],
                                                              ),
                                                              if (seedCartListItem
                                                                  .isLoading)
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0.0),
                                                                  child:
                                                                      BackdropFilter(
                                                                    filter:
                                                                        ImageFilter
                                                                            .blur(
                                                                      sigmaX:
                                                                          2.0,
                                                                      sigmaY:
                                                                          2.0,
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100.0,
                                                                      height:
                                                                          95.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0x55FFFFFF),
                                                                      ),
                                                                      child:
                                                                          Visibility(
                                                                        visible:
                                                                            seedCartListItem.isLoading,
                                                                        child:
                                                                            CircularPercentIndicator(
                                                                          percent:
                                                                              0.7,
                                                                          radius:
                                                                              12.5,
                                                                          lineWidth:
                                                                              3.0,
                                                                          animation:
                                                                              true,
                                                                          animateFromLastPercent:
                                                                              true,
                                                                          progressColor:
                                                                              FlutterFlowTheme.of(context).ahayundai,
                                                                          backgroundColor:
                                                                              Color(0xFF7C91BB),
                                                                        ).animateOnPageLoad(animationsMap['progressBarOnPageLoadAnimation']!),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    0.0,
                                                                    15.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            ClipRRect(
                                                              child: Container(
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxWidth:
                                                                      140.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Text(
                                                                  seedCartListItem
                                                                      .name,
                                                                  maxLines: 2,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Color(
                                                                            0xFF120900),
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Builder(
                                                                  builder:
                                                                      (context) =>
                                                                          InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      setState(
                                                                          () {
                                                                        _model
                                                                            .updateListOfCartItemsLocalAtIndex(
                                                                          seedCartListIndex,
                                                                          (e) => e
                                                                            ..isLoading =
                                                                                true,
                                                                        );
                                                                      });
                                                                      _model.apiResulti8n =
                                                                          await AddToCartApiCall
                                                                              .call(
                                                                        token: FFAppState()
                                                                            .userModel
                                                                            .token,
                                                                        partId:
                                                                            seedCartListItem.id,
                                                                      );
                                                                      if ((_model
                                                                              .apiResulti8n
                                                                              ?.succeeded ??
                                                                          true)) {
                                                                        _model.apiResultx4488 =
                                                                            await GetMyCartApiCall.call(
                                                                          token: FFAppState()
                                                                              .userModel
                                                                              .token,
                                                                        );
                                                                        if ((_model.apiResultx4488?.succeeded ??
                                                                            true)) {
                                                                          setState(
                                                                              () {
                                                                            _model.listOfCartItemsLocal = functions
                                                                                .convertFromJsonToCartObject(getJsonField(
                                                                                  (_model.apiResultx4488?.jsonBody ?? ''),
                                                                                  r'''$.cart''',
                                                                                ))
                                                                                .cartItems
                                                                                .toList()
                                                                                .cast<PartModelStruct>();
                                                                          });
                                                                          setState(
                                                                              () {
                                                                            _model.totalPrice = functions
                                                                                .convertFromJsonToCartObject(getJsonField(
                                                                                  (_model.apiResultx4488?.jsonBody ?? ''),
                                                                                  r'''$.cart''',
                                                                                ))
                                                                                .subTotal;
                                                                          });
                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().badgeCount =
                                                                                _model.listOfCartItemsLocal.length;
                                                                          });
                                                                        }
                                                                      } else {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (dialogContext) {
                                                                            return Dialog(
                                                                              insetPadding: EdgeInsets.zero,
                                                                              backgroundColor: Colors.transparent,
                                                                              alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                              child: Modal06BasicInformationWidget(
                                                                                body: (_model.apiResulti8n?.bodyText ?? ''),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            setState(() {}));
                                                                      }

                                                                      setState(
                                                                          () {
                                                                        _model
                                                                            .updateListOfCartItemsLocalAtIndex(
                                                                          seedCartListIndex,
                                                                          (e) => e
                                                                            ..isLoading =
                                                                                false,
                                                                        );
                                                                      });

                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .add_circle_outline,
                                                                      color: Color(
                                                                          0xFFC1D6EF),
                                                                      size:
                                                                          29.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Stack(
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            15.0,
                                                                            0.0,
                                                                            15.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          seedCartListItem
                                                                              .quantity
                                                                              .toString(),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: Color(0xFF343434),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Builder(
                                                                  builder:
                                                                      (context) =>
                                                                          InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      setState(
                                                                          () {
                                                                        _model
                                                                            .updateListOfCartItemsLocalAtIndex(
                                                                          seedCartListIndex,
                                                                          (e) => e
                                                                            ..isLoading =
                                                                                true,
                                                                        );
                                                                      });
                                                                      _model.apiResultxxf2 =
                                                                          await RemoveItemFromCartApiCall
                                                                              .call(
                                                                        token: FFAppState()
                                                                            .userModel
                                                                            .token,
                                                                        partId: seedCartListItem
                                                                            .id
                                                                            .toString(),
                                                                      );
                                                                      if ((_model
                                                                              .apiResultxxf2
                                                                              ?.succeeded ??
                                                                          true)) {
                                                                        _model.apiResultx448866 =
                                                                            await GetMyCartApiCall.call(
                                                                          token: FFAppState()
                                                                              .userModel
                                                                              .token,
                                                                        );
                                                                        if ((_model.apiResultx448866?.succeeded ??
                                                                            true)) {
                                                                          if (getJsonField(
                                                                                    (_model.apiResultx448866?.jsonBody ?? ''),
                                                                                    r'''$.cart''',
                                                                                  ) ==
                                                                                  null
                                                                              ? true
                                                                              : false) {
                                                                            _model.updatePage(() {
                                                                              _model.listOfCartItemsLocal = [];
                                                                            });
                                                                            setState(() {
                                                                              _model.totalPrice = 0.0;
                                                                            });
                                                                          } else {
                                                                            setState(() {
                                                                              _model.listOfCartItemsLocal = functions
                                                                                  .convertFromJsonToCartObject(getJsonField(
                                                                                    (_model.apiResultx448866?.jsonBody ?? ''),
                                                                                    r'''$.cart''',
                                                                                  ))
                                                                                  .cartItems
                                                                                  .toList()
                                                                                  .cast<PartModelStruct>();
                                                                            });
                                                                            setState(() {
                                                                              _model.totalPrice = functions
                                                                                  .convertFromJsonToCartObject(getJsonField(
                                                                                    (_model.apiResultx448866?.jsonBody ?? ''),
                                                                                    r'''$.cart''',
                                                                                  ))
                                                                                  .subTotal;
                                                                            });
                                                                          }
                                                                        }
                                                                      } else {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (dialogContext) {
                                                                            return Dialog(
                                                                              insetPadding: EdgeInsets.zero,
                                                                              backgroundColor: Colors.transparent,
                                                                              alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                              child: Modal06BasicInformationWidget(
                                                                                body: (_model.apiResultxxf2?.bodyText ?? ''),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            setState(() {}));
                                                                      }

                                                                      setState(
                                                                          () {
                                                                        if (_model
                                                                            .listOfCartItemsLocal
                                                                            .isNotEmpty) {
                                                                          _model
                                                                              .updateListOfCartItemsLocalAtIndex(
                                                                            seedCartListIndex,
                                                                            (e) => e
                                                                              ..isLoading = false,
                                                                          );
                                                                        }
                                                                      });
                                                                      FFAppState()
                                                                          .update(
                                                                              () {
                                                                        FFAppState().badgeCount = _model
                                                                            .listOfCartItemsLocal
                                                                            .length;
                                                                      });

                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .remove_circle_outline_sharp,
                                                                      color: Color(
                                                                          0xFFB6CBE5),
                                                                      size:
                                                                          29.0,
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
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child:
                                                              DeleteDialogWidget(
                                                            title: FFLocalizations
                                                                    .of(context)
                                                                .getVariableText(
                                                              enText:
                                                                  'Are you sure you want to remove product from cart',
                                                              arText:
                                                                  'هل انت متأكد من انك تود ازالة المنتج من السلة',
                                                            ),
                                                            confirmTextButton:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getVariableText(
                                                              enText: 'Yes',
                                                              arText: 'نعم',
                                                            ),
                                                            rejectTextButton:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getVariableText(
                                                              enText: 'No',
                                                              arText: 'لا',
                                                            ),
                                                            onConfirmTextButton:
                                                                () async {
                                                              setState(() {
                                                                _model
                                                                    .updateListOfCartItemsLocalAtIndex(
                                                                  seedCartListIndex,
                                                                  (e) => e
                                                                    ..isLoading =
                                                                        true,
                                                                );
                                                              });
                                                              _model.apiResultxxf2Copy =
                                                                  await RemoveItemFromCartApiCall
                                                                      .call(
                                                                token:
                                                                    FFAppState()
                                                                        .userModel
                                                                        .token,
                                                                partId: seedCartListItem
                                                                    .id
                                                                    .toString(),
                                                                quantity: '0',
                                                              );
                                                              if ((_model
                                                                      .apiResultxxf2Copy
                                                                      ?.succeeded ??
                                                                  true)) {
                                                                _model.apiResultx448866Copy =
                                                                    await GetMyCartApiCall
                                                                        .call(
                                                                  token: FFAppState()
                                                                      .userModel
                                                                      .token,
                                                                );
                                                                if ((_model
                                                                        .apiResultx448866Copy
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  if (getJsonField(
                                                                            (_model.apiResultx448866Copy?.jsonBody ??
                                                                                ''),
                                                                            r'''$.cart''',
                                                                          ) ==
                                                                          null
                                                                      ? true
                                                                      : false) {
                                                                    _model
                                                                        .updatePage(
                                                                            () {
                                                                      _model.listOfCartItemsLocal =
                                                                          [];
                                                                    });
                                                                    setState(
                                                                        () {
                                                                      _model.totalPrice =
                                                                          0.0;
                                                                    });
                                                                  } else {
                                                                    setState(
                                                                        () {
                                                                      _model.listOfCartItemsLocal = functions
                                                                          .convertFromJsonToCartObject(getJsonField(
                                                                            (_model.apiResultx448866Copy?.jsonBody ??
                                                                                ''),
                                                                            r'''$.cart''',
                                                                          ))
                                                                          .cartItems
                                                                          .toList()
                                                                          .cast<PartModelStruct>();
                                                                    });
                                                                    setState(
                                                                        () {
                                                                      _model.totalPrice = functions
                                                                          .convertFromJsonToCartObject(getJsonField(
                                                                            (_model.apiResultx448866Copy?.jsonBody ??
                                                                                ''),
                                                                            r'''$.cart''',
                                                                          ))
                                                                          .subTotal;
                                                                    });
                                                                  }
                                                                }
                                                              } else {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          Modal06BasicInformationWidget(
                                                                        body: (_model.apiResultxxf2Copy?.bodyText ??
                                                                            ''),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    setState(
                                                                        () {}));
                                                              }

                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                        .badgeCount =
                                                                    _model
                                                                        .listOfCartItemsLocal
                                                                        .length;
                                                              });


                                                              Navigator.pop(dialogContext);
                                                            },
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));

                                                    setState(() {
                                                      if (_model
                                                          .listOfCartItemsLocal
                                                          .isNotEmpty) {
                                                        _model
                                                            .updateListOfCartItemsLocalAtIndex(
                                                          seedCartListIndex,
                                                          (e) => e
                                                            ..isLoading = false,
                                                        );
                                                      }
                                                    });

                                                    setState(() {});
                                                  },
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    9.0,
                                                                    10.0,
                                                                    9.0),
                                                        child: Card(
                                                          clipBehavior: Clip
                                                              .antiAliasWithSaveLayer,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .white,
                                                          elevation: 10.0,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                            child: SvgPicture
                                                                .asset(
                                                              'assets/images/Group_72259.svg',
                                                              fit: BoxFit.cover,
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
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          indent: 35.0,
                                          endIndent: 35.0,
                                          color: Color(0xFFC1D6EF),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          30.0, 30.0, 30.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'g0l0qlnf' /* Total */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'HeeboBold',
                                  color: Color(0xFF092853),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                          ),
                          Text(
                            '${functions.roundDoubleToThreeDigits(valueOrDefault<double>(
                              _model.totalPrice,
                              0.0,
                            ))} ${FFLocalizations.of(context).getVariableText(
                              enText: 'JOD',
                              arText: 'دينار',
                            )}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'HeeboBold',
                                  color: Color(0xFFE50D23),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(30.0, 15.0, 30.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Opacity(
                              opacity: _model.totalPrice <= 0.0 ? 0.5 : 1.0,
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (_model.totalPrice > 0.0) {
                                    context.pushNamed('ShippingAddressPage');
                                  }
                                },
                                text: FFLocalizations.of(context).getText(
                                  'qpf5wtpv' /* Proceed To Checkout */,
                                ),
                                options: FFButtonOptions(
                                  width: 130.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).ahayundai,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ]
                  .addToStart(SizedBox(
                      height: widget.isComponentView == true ? 30.0 : 0.0))
                  .addToEnd(SizedBox(height: 50.0)),
            ),
          ),
        ),
      ),
    );
  }
}
