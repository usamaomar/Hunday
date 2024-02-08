import 'package:percent_indicator/circular_percent_indicator.dart';

import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/ui_screens/components/hynday_app_bar/hynday_app_bar_widget.dart';
import '/ui_screens/components/modal06_basic_information/modal06_basic_information_widget.dart';
import '/ui_screens/nav_pakege/time_component_list/time_component_list_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'regular_page_model.dart';
export 'regular_page_model.dart';

class RegularPageWidget extends StatefulWidget {
  const RegularPageWidget({super.key});

  @override
  State<RegularPageWidget> createState() => _RegularPageWidgetState();
}

class _RegularPageWidgetState extends State<RegularPageWidget>
    with TickerProviderStateMixin {
  late RegularPageModel _model;
  bool isLoading = false;

  bool? isServiceNtSelected;
  bool? isCarNtSelected;
  bool? isDateNtSelected;
  bool? isTimeNtSelected;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
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
  void initState() {
    super.initState();
    _model = createModel(context, () => RegularPageModel());
    FFAppState().selectedTimeFromHundai = '';
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
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
      }
      _model.apiResultjfk = await ServiceTypeApiCall.call(
        token: FFAppState().userModel.token,
      );
      if ((_model.apiResultjfk?.succeeded ?? true)) {
        setState(() {
          _model.serviceTypeList = functions
              .fromJsonListToServiceTypeModel(getJsonField(
                (_model.apiResultjfk?.jsonBody ?? ''),
                r'''$.ServiceTypes''',
              ))
              .toList()
              .cast<ServiceTypeModelStruct>();
        });
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          isServiceNtSelected = false;
          isCarNtSelected = false;
          isDateNtSelected = false;
          isTimeNtSelected = false;
        }));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  void holderState() {
    setState(() {
      isServiceNtSelected = _model.dropDownValue1?.isEmpty;
      isCarNtSelected = _model.dropDownValue2?.isEmpty;
      isDateNtSelected = _model.selectedDate.isEmpty;
      isTimeNtSelected = FFAppState().selectedTimeFromHundai.isEmpty;
    });
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
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/mapss.png',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                              decoration: BoxDecoration(),
                              child: Stack(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 0.0),
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 0.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0.0),
                                          bottomRight: Radius.circular(0.0),
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0),
                                        ),
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFC1D6EF),
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(20.0),
                                            topRight: Radius.circular(20.0),
                                          ),
                                          border: Border.all(
                                            color: Color(0xFFC1D6EF),
                                            width: 0.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            50.0, 0.0, 50.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: SvgPicture.asset(
                                            'assets/images/Group_71459_(1).svg',
                                            width: 250.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 5.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFC1D6EF),
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Opacity(
                                        opacity: 0.8,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  30.0, 20.0, 30.0, 0.0),
                                          child: FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownValueController1 ??=
                                                FormFieldController<String>(
                                                    null),
                                            options: _model.serviceTypeList
                                                .map((e) => e.name)
                                                .toList(),
                                            onChanged: (val) async {
                                              setState(() =>
                                                  _model.dropDownValue1 = val);
                                              setState(() {
                                                _model.selectedServiceType =
                                                    functions
                                                        .getSelectedServiceType(
                                                            _model
                                                                .dropDownValue1!,
                                                            _model
                                                                .serviceTypeList
                                                                .toList(),
                                                            FFAppState()
                                                                .currentLanguge);
                                              });
                                              setState(() {
                                                isServiceNtSelected = _model
                                                    .dropDownValue1?.isEmpty;
                                              });
                                            },
                                            width: double.infinity,
                                            height: 40.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium,
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'atzmlm1q' /* Service Type */,
                                            ),
                                            icon: Icon(
                                              Icons.arrow_drop_down,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .white,
                                            elevation: 2.0,
                                            borderColor:
                                                (isServiceNtSelected ?? true)
                                                    ? Color(0xFFEF2121)
                                                    : Colors.transparent,
                                            borderWidth: 1.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 4.0),
                                            hidesUnderline: true,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            30.0, 15.0, 30.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Opacity(
                                                opacity: 0.8,
                                                child:
                                                    FlutterFlowDropDown<String>(
                                                  controller: _model
                                                          .dropDownValueController2 ??=
                                                      FormFieldController<
                                                          String>(null),
                                                  options: _model
                                                      .listOfMyVehicle
                                                      .map((e) =>
                                                          '${e.carModel.name}/${e.plateNumber}')
                                                      .toList(),
                                                  onChanged: (val) async {
                                                    setState(() => _model
                                                        .dropDownValue2 = val);
                                                    setState(() {
                                                      _model.selectedVehicleModel =
                                                          functions.getSelectedVehicle(
                                                              _model
                                                                  .dropDownValue2!,
                                                              _model
                                                                  .listOfMyVehicle
                                                                  .toList());
                                                    });

                                                    setState(() {
                                                      isCarNtSelected = _model
                                                          .dropDownValue2
                                                          ?.isEmpty;
                                                    });
                                                  },
                                                  height: 40.0,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium,
                                                  hintText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '3jd0kk0r' /* Car Model / License Plate */,
                                                  ),
                                                  icon: Icon(
                                                    Icons.arrow_drop_down_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  elevation: 2.0,
                                                  borderColor:
                                                      (isCarNtSelected ?? true)
                                                          ? Color(0xFFEF2121)
                                                          : Colors.transparent,
                                                  borderWidth: 1.0,
                                                  borderRadius: 8.0,
                                                  margin: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 4.0, 16.0, 4.0),
                                                  hidesUnderline: true,
                                                  isSearchable: false,
                                                  isMultiSelect: false,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            30.0, 20.0, 30.0, 20.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            final _datePickedDate =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: _model.datePicked ??
                                                  getTomorrow,
                                              firstDate: getTomorrow,
                                              lastDate: DateTime(2050),
                                              builder: (context, child) {
                                                return wrapInMaterialDatePickerTheme(
                                                  context,
                                                  child!,
                                                  headerBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .white,
                                                  headerForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                  headerTextStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineLarge
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 32.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                  pickerBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  pickerForegroundColor:
                                                      Colors.black,
                                                  selectedDateTimeBackgroundColor:
                                                      Colors.white,
                                                  selectedDateTimeForegroundColor:
                                                      Colors.black,
                                                  actionButtonForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  iconSize: 24.0,
                                                );
                                              },
                                            );
                                            if (_datePickedDate != null) {
                                              safeSetState(() {
                                                _model.datePicked = DateTime(
                                                  _datePickedDate.year,
                                                  _datePickedDate.month,
                                                  _datePickedDate.day,
                                                );
                                              });
                                            }
                                            setState(() {
                                              _model.selectedDate =
                                                  dateTimeFormat(
                                                'yyyy/MM/dd',
                                                _model.datePicked,
                                                locale: 'en',
                                              );

                                              isDateNtSelected =
                                                  _model.selectedDate.isEmpty;
                                            });
                                            setState(() {
                                              isLoading = true;
                                            });
                                            _model.apiDateTimes =
                                                await CheckAvailableTimeCall
                                                    .call(
                                              token:
                                                  FFAppState().userModel.token,
                                              serviceType: 'regular',
                                              date: dateTimeFormat(
                                                'yyyy-MM-dd',
                                                _model.datePicked,
                                                locale: 'en',
                                              ),
                                            );

                                            setState(() {
                                              isLoading = false;
                                            });
                                          },
                                          child: Opacity(
                                            opacity: 0.8,
                                            child: Container(
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .white,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                    color: (isDateNtSelected ??
                                                            true)
                                                        ? Color(0xFFEF2121)
                                                        : Colors.transparent,
                                                    width: 1),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      _model.selectedDate !=
                                                                  null &&
                                                              _model.selectedDate !=
                                                                  ''
                                                          ? _model.selectedDate
                                                          : FFLocalizations.of(
                                                                  context)
                                                              .getVariableText(
                                                              enText: 'Date',
                                                              arText: 'التاريخ',
                                                            ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Icon(
                                                      Icons
                                                          .calendar_month_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 21.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Builder(
                                        builder: (context) => Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  30.0, 0.0, 30.0, 20.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (_model.selectedDate != null &&
                                                      _model.selectedDate != ''
                                                  ? true
                                                  : false) {
                                                if (isLoading) {
                                                  return;
                                                }

                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: GestureDetector(
                                                        onTap: () => _model
                                                                .unfocusNode
                                                                .canRequestFocus
                                                            ? FocusScope.of(
                                                                    context)
                                                                .requestFocus(_model
                                                                    .unfocusNode)
                                                            : FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child:
                                                            TimeComponentListWidget(
                                                          list: getJsonField(
                                                                    _model
                                                                        .apiDateTimes
                                                                        ?.jsonBody,
                                                                    r'''$.availableTime''',
                                                                  ) ==
                                                                  null
                                                              ? []
                                                              : getJsonField(
                                                                  _model
                                                                      .apiDateTimes
                                                                      ?.jsonBody,
                                                                  r'''$.availableTime''',
                                                                ).toList(),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) => setState(() {
                                                      isTimeNtSelected =
                                                          FFAppState()
                                                              .selectedTimeFromHundai
                                                              .isEmpty;
                                                    }));
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        enText:
                                                            'Date is Not Selected',
                                                        arText:
                                                            'قم بتعيين التاريخ',
                                                      ),
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .white,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                );
                                              }
                                            },
                                            child: Stack(
                                              alignment: Alignment(1, 1),
                                              children: [
                                                Opacity(
                                                  opacity: 0.8,
                                                  child: Container(
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color:
                                                            (isTimeNtSelected ??
                                                                    true)
                                                                ? Color(
                                                                    0xFFEF2121)
                                                                : Colors
                                                                    .transparent,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFAppState().selectedTimeFromHundai !=
                                                                        null &&
                                                                    FFAppState()
                                                                            .selectedTimeFromHundai !=
                                                                        ''
                                                                ? FFAppState()
                                                                    .selectedTimeFromHundai
                                                                : FFLocalizations.of(
                                                                        context)
                                                                    .getVariableText(
                                                                    enText:
                                                                        'Time',
                                                                    arText:
                                                                        'الوقت',
                                                                  ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons
                                                                .access_time_filled,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  child: Visibility(
                                                    visible: isLoading,
                                                    child:
                                                        CircularPercentIndicator(
                                                      percent: 0.7,
                                                      radius: 12.5,
                                                      lineWidth: 3.0,
                                                      animation: true,
                                                      animateFromLastPercent:
                                                          true,
                                                      progressColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .ahayundai,
                                                      backgroundColor:
                                                          Color(0xFF7C91BB),
                                                    ).animateOnPageLoad(
                                                            animationsMap[
                                                                'progressBarOnPageLoadAnimation']!),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            30.0, 30.5, 30.0, 75.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Builder(
                                              builder: (context) =>
                                                  FFButtonWidget(
                                                onPressed: () async {
                                                  holderState();
                                                  if ((isServiceNtSelected ??
                                                              true) ==
                                                          true ||
                                                      (isCarNtSelected ??
                                                              true) ==
                                                          true ||
                                                      (isDateNtSelected ??
                                                              true) ==
                                                          true ||
                                                      (isTimeNtSelected ??
                                                              true) ==
                                                          true) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getVariableText(
                                                            enText: 'Aleart',
                                                            arText: 'تنبيه',
                                                          )),
                                                          content: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getVariableText(
                                                            enText:
                                                                'Select From Items',
                                                            arText:
                                                                'يرجى التأكد من اختيار البيانات',
                                                          )),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getVariableText(
                                                                enText: 'Ok',
                                                                arText: 'حسنا',
                                                              )),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                    return;
                                                  }
                                                  _model.apiResult6ff =
                                                      await RegularServiceApiCall
                                                          .call(
                                                    token: FFAppState()
                                                        .userModel
                                                        .token,
                                                    date: _model.selectedDate
                                                            .isNotEmpty
                                                        ? conveFrom(
                                                            '${_model.selectedDate} ${FFAppState().selectedTimeFromHundai}')
                                                        : '',
                                                    serviceTypeId: _model
                                                        .selectedServiceType
                                                        ?.id,
                                                    vehicleId: _model
                                                        .selectedVehicleModel
                                                        ?.id,
                                                  );
                                                  if ((_model.apiResult6ff
                                                          ?.succeeded ??
                                                      true)) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getVariableText(
                                                            enText: 'Aleart',
                                                            arText: 'تنبيه',
                                                          )),
                                                          content: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getVariableText(
                                                            enText:
                                                                'Your Requst is Sent',
                                                            arText:
                                                                'تم ارسال المعلومات',
                                                          )),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getVariableText(
                                                                enText: 'Ok',
                                                                arText: 'حسنا',
                                                              )),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                    if (Navigator.of(context)
                                                        .canPop()) {
                                                      context.pop();
                                                    }
                                                    context
                                                        .pushReplacementNamed(
                                                            'HomeScreen');
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
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
                                                              GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child:
                                                                Modal06BasicInformationWidget(
                                                              body: (_model
                                                                      .apiResult6ff
                                                                      ?.bodyText ??
                                                                  ''),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));
                                                  }

                                                  setState(() {});
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'j3282cea' /* Book Now */,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          50.0, 0.0, 50.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .ahayundai,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
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
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ).animateOnPageLoad(
                            animationsMap['columnOnPageLoadAnimation']!),
                      ),
                    ),
                  ],
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
                            enText: 'Regular',
                            arText: 'عادي',
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

  String conveFrom(String value) {
    DateTime startDate =
        DateFormat("yyyy/MM/dd HH:mm").parse(value.split(' - ')[0]);
    String formattedDateString =
        DateFormat("yyyy-MM-dd HH:mm:ss").format(startDate);
    return formattedDateString;
  }
}
