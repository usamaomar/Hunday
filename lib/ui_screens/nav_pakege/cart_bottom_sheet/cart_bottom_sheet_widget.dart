import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui_screens/components/modal06_basic_information/modal06_basic_information_widget.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
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
        setState(() {
          _model.listOfCartItemsLocal = functions
              .convertFromJsonListToCarttList(getJsonField(
                (_model.apiResultx44?.jsonBody ?? ''),
                r'''$.cartItem''',
              ))
              .toList()
              .cast<CartModelStruct>();
        });
        setState(() {
          _model.totalPrice = valueOrDefault<double>(
            ((_model.apiResultx44?.jsonBody ?? '') != null &&
                        (_model.apiResultx44?.jsonBody ?? '') != ''
                    ? CartItemModelStruct.fromMap(
                        (_model.apiResultx44?.jsonBody ?? ''))
                    : null)
                ?.totalPrice,
            0.0,
          );
        });
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
      alignment: AlignmentDirectional(0.00, 1.00),
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
                      Container(
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                                alignment: AlignmentDirectional(
                                                    1.00, 0.00),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
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
                                                                .circular(8.0),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.00, 0.00),
                                                        child: Stack(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 1.0),
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.00,
                                                                      0.00),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  seedCartListItem
                                                                      .part
                                                                      .fullImage,
                                                                  width: 95.0,
                                                                  height: 95.0,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                if (seedCartListItem
                                                                            .part
                                                                            .specialPrice !=
                                                                        null
                                                                    ? false
                                                                    : true)
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Card(
                                                                        clipBehavior:
                                                                            Clip.antiAliasWithSaveLayer,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        elevation:
                                                                            0.0,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(20.0),
                                                                            bottomRight:
                                                                                Radius.circular(0.0),
                                                                            topLeft:
                                                                                Radius.circular(20.0),
                                                                            topRight:
                                                                                Radius.circular(0.0),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 5.0),
                                                                              child: Text(
                                                                                seedCartListItem.part.specialPrice != null
                                                                                    ? '${seedCartListItem.part.price.toString()} ${FFLocalizations.of(context).getVariableText(
                                                                                        enText: 'JOD',
                                                                                        arText: 'دينار',
                                                                                      )}'
                                                                                    : '0',
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      decoration: TextDecoration.lineThrough,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.00,
                                                                          0.00),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            10.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          75.0,
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
                                                                            0.00,
                                                                            0.00),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              '${(seedCartListItem.part.specialPrice == null) || (seedCartListItem.part.specialPrice == 0.0) ? '${seedCartListItem.part.price.toString()} ${FFLocalizations.of(context).getVariableText(
                                                                                  enText: 'JOD',
                                                                                  arText: 'دينار',
                                                                                )}' : '${seedCartListItem.part.specialPrice.toString()} ${FFLocalizations.of(context).getVariableText(
                                                                                  enText: 'JOD',
                                                                                  arText: 'دينار',
                                                                                )}'} ${FFLocalizations.of(context).getVariableText(
                                                                                enText: 'JOD',
                                                                                arText: 'دينار',
                                                                              )}',
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: FlutterFlowTheme.of(context).white,
                                                                                    fontSize: 12.0,
                                                                                    fontWeight: FontWeight.w600,
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
                                                                maxWidth: 140.0,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Text(
                                                                seedCartListItem
                                                                    .part.name,
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
                                                                          FontWeight
                                                                              .bold,
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
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    setState(
                                                                        () {
                                                                      _model.isLoading =
                                                                          true;
                                                                    });
                                                                    _model.apiResulti8n =
                                                                        await AddToCartApiCall
                                                                            .call(
                                                                      token: FFAppState()
                                                                          .userModel
                                                                          .token,
                                                                      partId: seedCartListItem
                                                                          .partId,
                                                                    );
                                                                    if ((_model
                                                                            .apiResulti8n
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      _model.apiResultx4488 =
                                                                          await GetMyCartApiCall
                                                                              .call(
                                                                        token: FFAppState()
                                                                            .userModel
                                                                            .token,
                                                                      );
                                                                      if ((_model
                                                                              .apiResultx4488
                                                                              ?.succeeded ??
                                                                          true)) {
                                                                        setState(
                                                                            () {
                                                                          _model.listOfCartItemsLocal = functions
                                                                              .convertFromJsonListToCarttList(getJsonField(
                                                                                (_model.apiResultx4488?.jsonBody ?? ''),
                                                                                r'''$.cartItem''',
                                                                              ))
                                                                              .toList()
                                                                              .cast<CartModelStruct>();
                                                                        });
                                                                        setState(
                                                                            () {
                                                                          _model.totalPrice =
                                                                              CartItemModelStruct.fromMap((_model.apiResultx4488?.jsonBody ?? '')).totalPrice;
                                                                        });
                                                                      }
                                                                    } else {
                                                                      await showAlignedDialog(
                                                                        context:
                                                                            context,
                                                                        isGlobal:
                                                                            true,
                                                                        avoidOverflow:
                                                                            false,
                                                                        targetAnchor:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        followerAnchor:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            child:
                                                                                Modal06BasicInformationWidget(
                                                                              body: (_model.apiResulti8n?.bodyText ?? ''),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));
                                                                    }

                                                                    setState(
                                                                        () {
                                                                      _model.isLoading =
                                                                          false;
                                                                    });

                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .add_circle_outline,
                                                                    color: Color(
                                                                        0xFFC1D6EF),
                                                                    size: 29.0,
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.00,
                                                                        0.00),
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
                                                                    if (_model
                                                                            .isLoading ==
                                                                        true)
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.00,
                                                                            0.00),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              15.0,
                                                                              0.0,
                                                                              15.0,
                                                                              0.0),
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
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    setState(
                                                                        () {
                                                                      _model.isLoading =
                                                                          true;
                                                                    });
                                                                    _model.apiResultxxf2 =
                                                                        await RemoveItemFromCartApiCall
                                                                            .call(
                                                                      token: FFAppState()
                                                                          .userModel
                                                                          .token,
                                                                      cartId:
                                                                          seedCartListItem
                                                                              .id,
                                                                    );
                                                                    if ((_model
                                                                            .apiResultxxf2
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      _model.apiResultx448866 =
                                                                          await GetMyCartApiCall
                                                                              .call(
                                                                        token: FFAppState()
                                                                            .userModel
                                                                            .token,
                                                                      );
                                                                      if ((_model
                                                                              .apiResultx448866
                                                                              ?.succeeded ??
                                                                          true)) {
                                                                        setState(
                                                                            () {
                                                                          _model.listOfCartItemsLocal = functions
                                                                              .convertFromJsonListToCarttList(getJsonField(
                                                                                (_model.apiResultx448866?.jsonBody ?? ''),
                                                                                r'''$.cartItem''',
                                                                              ))
                                                                              .toList()
                                                                              .cast<CartModelStruct>();
                                                                        });
                                                                        setState(
                                                                            () {
                                                                          _model.totalPrice =
                                                                              CartItemModelStruct.fromMap((_model.apiResultx448866?.jsonBody ?? '')).totalPrice;
                                                                        });
                                                                      }
                                                                    } else {
                                                                      await showAlignedDialog(
                                                                        context:
                                                                            context,
                                                                        isGlobal:
                                                                            true,
                                                                        avoidOverflow:
                                                                            false,
                                                                        targetAnchor:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        followerAnchor:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            child:
                                                                                Modal06BasicInformationWidget(
                                                                              body: (_model.apiResultxxf2?.bodyText ?? ''),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));
                                                                    }

                                                                    setState(
                                                                        () {
                                                                      _model.isLoading =
                                                                          false;
                                                                    });

                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .remove_circle_outline_sharp,
                                                                    color: Color(
                                                                        0xFFB6CBE5),
                                                                    size: 29.0,
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
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  setState(() {
                                                    _model.isLoading = true;
                                                  });
                                                  _model.apiResultxxf2Copy =
                                                      await UpdateCartApiCall
                                                          .call(
                                                    id: seedCartListItem.id,
                                                    partId:
                                                        seedCartListItem.partId,
                                                    token: FFAppState()
                                                        .userModel
                                                        .token,
                                                    quantity: 0,
                                                  );
                                                  if ((_model.apiResultxxf2Copy
                                                          ?.succeeded ??
                                                      true)) {
                                                    _model.apiResu8 =
                                                        await GetMyCartApiCall
                                                            .call(
                                                      token: FFAppState()
                                                          .userModel
                                                          .token,
                                                    );
                                                    if ((_model.apiResu8
                                                            ?.succeeded ??
                                                        true)) {
                                                      setState(() {
                                                        _model.listOfCartItemsLocal =
                                                            functions
                                                                .convertFromJsonListToCarttList(
                                                                    getJsonField(
                                                                  (_model.apiResu8
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                  r'''$.cartItem''',
                                                                ))
                                                                .toList()
                                                                .cast<
                                                                    CartModelStruct>();
                                                      });
                                                      setState(() {
                                                        _model.totalPrice =
                                                            CartItemModelStruct
                                                                    .fromMap((_model
                                                                            .apiResu8
                                                                            ?.jsonBody ??
                                                                        ''))
                                                                .totalPrice;
                                                      });
                                                    }
                                                  } else {
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
                                                          color: Colors
                                                              .transparent,
                                                          child:
                                                              Modal06BasicInformationWidget(
                                                            body: (_model
                                                                    .apiResultxxf2Copy
                                                                    ?.bodyText ??
                                                                ''),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));
                                                  }

                                                  setState(() {
                                                    _model.isLoading = false;
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                          child:
                                                              SvgPicture.asset(
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
                            '${valueOrDefault<String>(
                              _model.totalPrice.toString(),
                              '0',
                            )} ${FFLocalizations.of(context).getVariableText(
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
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed('ShippingAddressPage');
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
