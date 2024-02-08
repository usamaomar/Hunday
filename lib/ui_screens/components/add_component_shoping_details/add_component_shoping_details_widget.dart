import 'package:easy_debounce/easy_debounce.dart';

import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/ui_screens/components/modal06_basic_information/modal06_basic_information_widget.dart';
import '/ui_screens/nav_pakege/cart_bottom_sheet/cart_bottom_sheet_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'add_component_shoping_details_model.dart';
export 'add_component_shoping_details_model.dart';

class AddComponentShopingDetailsWidget extends StatefulWidget {
  const AddComponentShopingDetailsWidget({
    Key? key,
    required this.partId,
    required this.titleh,
  }) : super(key: key);

  final int? partId;
  final String? titleh;

  @override
  _AddComponentShopingDetailsWidgetState createState() =>
      _AddComponentShopingDetailsWidgetState();
}

class _AddComponentShopingDetailsWidgetState
    extends State<AddComponentShopingDetailsWidget> {
  late AddComponentShopingDetailsModel _model;
  final GlobalKey dropdownKey = GlobalKey();

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddComponentShopingDetailsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultjaz = await PartsApiCall.call(
        token: FFAppState().userModel.token,
        id: widget.partId,
      );
      if ((_model.apiResultjaz?.succeeded ?? true)) {
        setState(() {
          _model.listOfPartsModelLocal = getJsonField(
                    (_model.apiResultjaz?.jsonBody ?? ''),
                    r'''$.parts''',
                  ) ==
                  null
              ? []
              : functions
                  .fromJsonArrayToPartModelList(getJsonField(
                    (_model.apiResultjaz?.jsonBody ?? ''),
                    r'''$.parts''',
                  ))
                  .toList()
                  .cast<PartModelStruct>();
        });
      }
      _model.apiResultoqe = await VehicleApiCall.call(
        token: FFAppState().userModel.token,
      );
      if ((_model.apiResultoqe?.succeeded ?? true)) {
        setState(() {
          _model.listOfMyVehicle = functions
              .fromJsonArrayToMyVycalesList(getJsonField(
                (_model.apiResultoqe?.jsonBody ?? ''),
                r'''$.vehicles''',
              ))
              .toList()
              .cast<MyVehicleModelStruct>();
        });
        setState(() {
          _model.titleHeade = widget.titleh!;
        });


        // setState(() {
        //
        //   FlutterFlowDropDown state = dropdownKey.currentState as FlutterFlowDropDown;
        //   state.onChanged!('${_model.listOfMyVehicle[0].carModel.name}/${_model.listOfMyVehicle[0].plateNumber}');
        //   // _model.dropDownValueController?.indexOf(0);
        //   //
        //
        //   // _model.dropDownValueController  =
        //   //     FormFieldController<String>('${_model.listOfMyVehicle[0].carModel.name}/${_model.listOfMyVehicle[0].plateNumber}');
        // });


      }
    });
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
      alignment: AlignmentDirectional(0, 1),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
            child: Material(
              color: Colors.transparent,
              elevation: 15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  maxHeight: 600,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 60.0,
                                    child: Divider(
                                      height: 5.0,
                                      thickness: 2.0,
                                      color: Color(0xFF3D6398),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40.0,
                                    child: Divider(
                                      height: 9.0,
                                      thickness: 2.0,
                                      color: Color(0xFF3D6398),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 0.0, 25.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.arrow_back_outlined,
                                    color: Color(0xFF3D6398),
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              18.0, 20.0, 18.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: TextFormField(
                                    onChanged: (value) => EasyDebounce.debounce(
                                      '_model.textController',
                                      Duration(milliseconds: 500),
                                      () async {
                                        _model.apiResultjaz =
                                            await PartsApiCall.call(
                                          token: FFAppState().userModel.token,
                                          id: widget.partId,
                                          vehicleId: _model
                                              .selectedVehicleModel?.id
                                              .toString(),
                                          searchKey: value,
                                        );
                                        if ((_model.apiResultjaz?.succeeded ??
                                            true)) {
                                          setState(() {
                                            _model.listOfPartsModelLocal =
                                                getJsonField(
                                                          (_model.apiResultjaz
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.parts''',
                                                        ) ==
                                                        null
                                                    ? []
                                                    : functions
                                                        .fromJsonArrayToPartModelList(
                                                            getJsonField(
                                                          (_model.apiResultjaz
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.parts''',
                                                        ))
                                                        .toList()
                                                        .cast<
                                                            PartModelStruct>();
                                          });
                                        }
                                      },
                                    ),
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText:
                                          FFLocalizations.of(context).getText(
                                        'ebrw9fwu' /* Search by Name or Part Number */,
                                      ),
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFE1E1E1),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFE1E1E1),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      filled: true,
                                      fillColor:
                                          FlutterFlowTheme.of(context).white,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Heebo Regular',
                                          color: Color(0xFF747474),
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: false,
                                        ),
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              25.0, 15.0, 25.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: FlutterFlowDropDown<String>(
                                  controller: _model.dropDownValueController ??=
                                      FormFieldController<String>(null),
                                  options: _model.listOfMyVehicle
                                      .map((e) => '${e.carModel.name}/${e.plateNumber}')
                                      .toList(),
                                  key: dropdownKey,
                                  onChanged: (val) async {
                                    setState(() => _model.dropDownValue = val);
                                    setState(() {
                                      _model.selectedVehicleModel =
                                          functions.getSelectedVehicle(
                                              _model.dropDownValue!,
                                              _model.listOfMyVehicle.toList());
                                      _model.selectedYear = _model
                                              .selectedVehicleModel
                                              ?.yearOfManufacturing ??
                                          '-';
                                    });
                                    _model.apiResultjaz =
                                        await PartsApiCall.call(
                                      token: FFAppState().userModel.token,
                                      id: widget.partId,
                                      vehicleId: _model.selectedVehicleModel?.id
                                          .toString(),
                                    );
                                    if ((_model.apiResultjaz?.succeeded ??
                                        true)) {
                                      setState(() {
                                        _model.listOfPartsModelLocal =
                                            getJsonField(
                                                      (_model.apiResultjaz
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.parts''',
                                                    ) ==
                                                    null
                                                ? []
                                                : functions
                                                    .fromJsonArrayToPartModelList(
                                                        getJsonField(
                                                      (_model.apiResultjaz
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.parts''',
                                                    ))
                                                    .toList()
                                                    .cast<PartModelStruct>();
                                      });
                                    }
                                  },
                                  height: 50.0,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  hintText: FFLocalizations.of(context).getText(
                                    'rt1i3fku' /* Car Model / License Plate */,
                                  ),
                                  icon: Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: FaIcon(
                                      FontAwesomeIcons.caretDown,
                                      color: Colors.black,
                                      size: 20.0,
                                    ),
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor: Color(0xFFE1E1E1),
                                  borderWidth: 1.0,
                                  borderRadius: 5.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 5.0, 0.0),
                                  hidesUnderline: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              25.0, 15.0, 25.0, 20.0),
                          child: Container(
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).white,
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                color: Color(0xFFE1E1E1),
                                width: 1.0,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      _model.selectedYear != null &&
                                              _model.selectedYear != ''
                                          ? _model.selectedYear
                                          : valueOrDefault<String>(
                                              FFLocalizations.of(context)
                                                  .getVariableText(
                                                enText: ' Model year',
                                                arText: 'سنة الصنع',
                                              ),
                                              '٫',
                                            ),
                                      '-',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: Icon(
                                    Icons.calendar_month_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 21.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              final listLcs = _model.listOfPartsModelLocal
                                  .map((e) => e)
                                  .toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: listLcs.length,
                                itemBuilder: (context, listLcsIndex) {
                                  final listLcsItem = listLcs[listLcsIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'ItemDetailsPage',
                                        queryParameters: {
                                          'jsonObject': serializeParam(
                                            listLcsItem.toMap(),
                                            ParamType.JSON,
                                          ),
                                          'titleHeader': serializeParam(
                                            _model.titleHeade,
                                            ParamType.String,
                                          ),
                                          'yearOf': serializeParam(
                                            _model.selectedYear ?? '',
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                          ),
                                        },
                                      );
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 15, 20, 0),
                                            child: Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 4,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(20,
                                                                    15, 20, 0),
                                                        child: Text(
                                                          listLcsItem.name,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'HeeboBold',
                                                                color: Color(
                                                                    0xFF092853),
                                                                fontSize: 14,
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
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(20,
                                                                    10, 0, 10),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(0),
                                                          child: Image.network(
                                                            listLcsItem
                                                                .fullImage,
                                                            width: 100,
                                                            height: 100,
                                                            fit: BoxFit.cover,
                                                            errorBuilder: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                Image.asset(
                                                              'assets/images/error_image.png',
                                                              width: 100,
                                                              height: 100,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          if (listLcsItem
                                                                      .specialPrice >
                                                                  0
                                                              ? true
                                                              : false)
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Card(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              20),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              20),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              0),
                                                                    ),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            20,
                                                                            5,
                                                                            20,
                                                                            5),
                                                                        child:
                                                                            Text(
                                                                          listLcsItem.specialPrice >= 0
                                                                              ? '${listLcsItem.specialPrice.toString()} ${FFLocalizations.of(context).getVariableText(
                                                                                  enText: 'JOD',
                                                                                  arText: 'دينار',
                                                                                )}'
                                                                              : '0 ${FFLocalizations.of(context).getVariableText(
                                                                                  enText: 'JOD',
                                                                                  arText: 'دينار',
                                                                                )}',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
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
                                                                    _model.apiResulto0l =
                                                                        await AddToCartApiCall
                                                                            .call(
                                                                      token: FFAppState()
                                                                          .userModel
                                                                          .token,
                                                                      partId:
                                                                          listLcsItem
                                                                              .id,
                                                                    );
                                                                    if ((_model
                                                                            .apiResulto0l
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        enableDrag:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                CartBottomSheetWidget(
                                                                              isComponentView: true,
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
                                                                    } else {
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            child:
                                                                                Modal06BasicInformationWidget(
                                                                              body: (_model.apiResulto0l?.bodyText ?? ''),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));
                                                                    }

                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  child: Card(
                                                                    clipBehavior:
                                                                        Clip.antiAliasWithSaveLayer,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    elevation:
                                                                        4,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              5),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                        child: SvgPicture
                                                                            .asset(
                                                                          'assets/images/Group_72250.svg',
                                                                          width:
                                                                              25,
                                                                          height:
                                                                              25,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 100,
                                                                height: 35,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFF3D6398),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            20),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            20),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            0),
                                                                  ),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      listLcsItem.specialPrice <=
                                                                              0
                                                                          ? '${listLcsItem.price.toString()} ${FFLocalizations.of(context).getVariableText(
                                                                              enText: 'JOD',
                                                                              arText: 'دينار',
                                                                            )}'
                                                                          : '${listLcsItem.price.toString()} ${FFLocalizations.of(context).getVariableText(
                                                                              enText: 'JOD',
                                                                              arText: 'دينار',
                                                                            )}',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).white,
                                                                            decoration: listLcsItem.specialPrice <= 0
                                                                                ? TextDecoration.none
                                                                                : TextDecoration.lineThrough,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
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
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
