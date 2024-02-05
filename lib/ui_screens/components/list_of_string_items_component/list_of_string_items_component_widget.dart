import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/ui_screens/components/modal06_basic_information/modal06_basic_information_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'list_of_string_items_component_model.dart';
export 'list_of_string_items_component_model.dart';

class ListOfStringItemsComponentWidget extends StatefulWidget {
  const ListOfStringItemsComponentWidget({
    super.key,
    required this.jsonData,
  });

  final dynamic jsonData;

  @override
  State<ListOfStringItemsComponentWidget> createState() =>
      _ListOfStringItemsComponentWidgetState();
}

class _ListOfStringItemsComponentWidgetState
    extends State<ListOfStringItemsComponentWidget> {
  late ListOfStringItemsComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListOfStringItemsComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.carInfoLocalModel = CarInfoModelStruct.maybeFromMap(getJsonField(
          widget.jsonData,
          r'''$.info''',
        ));
        _model.carModelList = functions
            .fromJsonToModelList(getJsonField(
              widget.jsonData,
              r'''$.carModels''',
            ))
            .toList()
            .cast<CarModelStruct>();
        _model.carCategoriesList = functions
            .fromJsonToCategoriesList(getJsonField(
              widget.jsonData,
              r'''$.carCategories''',
            ))
            .toList()
            .cast<CarCategoriesStruct>();
        _model.fuelTypesList = functions
            .fromJsonToFuelTypeModelList(getJsonField(
              widget.jsonData,
              r'''$.fuelTypes''',
            ))
            .toList()
            .cast<FuelTypeModelStruct>();

        ///
        if (_model.carInfoLocalModel?.carModelId == 0) {
          // _model.selectedCarModel = _model.carModelList[0];
        } else {
          _model.selectedCarModel = _model.carModelList
              .where((e) => e.id == _model.carInfoLocalModel?.carModelId)
              .single;
        }

        // ///
        // if (_model.carInfoLocalModel?.carCategoryId == 0) {
        //   // _model.selectedCarCategories = _model.carCategoriesList[0];
        // } else {
        //   _model.selectedCarCategories = _model.carCategoriesList
        //       .where((e) => e.id == _model.carInfoLocalModel?.carCategoryId)
        //       .single;
        // }

        ///
        if (_model.carInfoLocalModel?.fuelTypeId == 0) {
          // _model.selectedFuelType = _model.fuelTypesList[0];
        } else {
          _model.selectedFuelType = _model.fuelTypesList
              .where((e) => e.id == _model.carInfoLocalModel?.fuelTypeId)
              .single;
        }
      });
      setState(() {
        _model.yearOfManufacturingString =
            _model.carInfoLocalModel?.yearOfManufacturing ?? '';
        _model.registeredUntil =
            _model.carInfoLocalModel?.registeredUntil ?? '';
      });
      setState(() {
        _model.textController1?.text =
            _model.carInfoLocalModel?.plateNumber ?? '';
      });
      setState(() {
        _model.textController2?.text =
            _model.carInfoLocalModel?.vinNumber ?? '';
      });
      setState(() {
        _model.textFieldCapacityController?.text =
            _model.carInfoLocalModel?.engineCapacity ?? '';
      });
      setState(() {
        _model.selectedStringCarModel = _model.selectedCarModel?.name ?? '';
        // _model.selectedStringCarCategory =
        //     _model.selectedCarCategories?.name ?? '';
        _model.selectedStringFuelType = _model.selectedFuelType?.name ?? '';
      });
      setState(() {});
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textFieldCapacityController ??= TextEditingController();
    _model.textFieldCapacityFocusNode ??= FocusNode();

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

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 340.0,
          decoration: BoxDecoration(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 55.0, 0.0, 0.0),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: FlutterFlowTheme.of(context).secondaryBackground,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    width: 60.0,
                                    height: 3.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF3D6398),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Container(
                                  width: 45.0,
                                  height: 3.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF3D6398),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.keyboard_backspace,
                              color: Color(0xFF3D6398),
                              size: 30.0,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '6xtulesf' /* Car Type */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF3D6398),
                                  ),
                            ),
                          ),
                          Container(
                            height: 40.0,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FlutterFlowDropDown<String>(
                                  controller:
                                      _model.dropDownValueController1 ??=
                                          FormFieldController<String>(null),
                                  options: _model.carModelList
                                      .map((e) => e.name)
                                      .toList(),
                                  onChanged: (val) {
                                    setState(() {
                                      _model.selectedCarModel = _model
                                          .carModelList
                                          .where((e) => e.name == val)
                                          .single;
                                      _model.dropDownValue1 = val;
                                    });
                                  },
                                  width: 270.0,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  hintText: _model.selectedStringCarModel,
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor: Color(0xFFE1E1E1),
                                  borderWidth: 1.0,
                                  borderRadius: 5.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // Column(
                      //   mainAxisSize: MainAxisSize.min,
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Padding(
                      //       padding: EdgeInsetsDirectional.fromSTEB(
                      //           0.0, 10.0, 0.0, 10.0),
                      //       child: Text(
                      //         FFLocalizations.of(context).getText(
                      //           '5r2w1sdp' /* Car Catedory */,
                      //         ),
                      //         style: FlutterFlowTheme.of(context)
                      //             .bodyMedium
                      //             .override(
                      //               fontFamily: 'Poppins',
                      //               color: Color(0xFF3D6398),
                      //             ),
                      //       ),
                      //     ),
                      //     Container(
                      //       height: 40.0,
                      //       decoration: BoxDecoration(),
                      //       child: Row(
                      //         mainAxisSize: MainAxisSize.max,
                      //         children: [
                      //           FlutterFlowDropDown<String>(
                      //             controller:
                      //                 _model.dropDownValueController2 ??=
                      //                     FormFieldController<String>(null),
                      //             options: _model.carCategoriesList
                      //                 .map((e) => e.name)
                      //                 .toList(),
                      //             onChanged: (val) {
                      //               setState(() {
                      //                 _model.selectedCarCategories = _model
                      //                     .carCategoriesList
                      //                     .where((e) => e.name == val)
                      //                     .single;
                      //                 _model.dropDownValue2 = val;
                      //               });
                      //             },
                      //             width: 270.0,
                      //             textStyle:
                      //                 FlutterFlowTheme.of(context).bodyMedium,
                      //             hintText: _model.selectedStringCarCategory,
                      //             icon: Icon(
                      //               Icons.keyboard_arrow_down_rounded,
                      //               color: FlutterFlowTheme.of(context)
                      //                   .secondaryText,
                      //               size: 24.0,
                      //             ),
                      //             fillColor: FlutterFlowTheme.of(context)
                      //                 .secondaryBackground,
                      //             elevation: 2.0,
                      //             borderColor: Color(0xFFE1E1E1),
                      //             borderWidth: 1.0,
                      //             borderRadius: 5.0,
                      //             margin: EdgeInsetsDirectional.fromSTEB(
                      //                 16.0, 4.0, 16.0, 4.0),
                      //             hidesUnderline: true,
                      //             isSearchable: false,
                      //             isMultiSelect: false,
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'fgn805t4' /* Year of Manufacturing */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF3D6398),
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Opacity(
                                    opacity: 0.8,
                                    child: FlutterFlowDropDown<String>(
                                      controller: _model
                                              .dropDownValueYearOfCreationController ??=
                                          FormFieldController<String>(null),
                                      options: generateDates()
                                          .map((e) => e)
                                          .toList(),
                                      onChanged: (val) => setState(() {
                                        _model.dropDownValueYearOfCreation =
                                            val;
                                        _model.yearOfManufacturingString =
                                            val ?? '2000';
                                      }),
                                      height: 40.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      hintText:
                                          _model.yearOfManufacturingString,
                                      icon: Icon(
                                        Icons.calendar_month,
                                        color: Color(0xFF092853),
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: Color(0xFFE1E1E1),
                                      borderWidth: 1.0,
                                      borderRadius: 5.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 4.0, 5.0, 4.0),
                                      hidesUnderline: true,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'qveofh35' /* Registered Until */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF3D6398),
                                  ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              // RegisterdUntil
                              final _datePicked2Date = await showDatePicker(
                                context: context,
                                initialDate: getCurrentTimestamp,
                                firstDate: DateTime(1995),
                                lastDate: DateTime(2050),
                                builder: (context, child) {
                                  return wrapInMaterialDatePickerTheme(
                                    context,
                                    child!,
                                    headerBackgroundColor:
                                        FlutterFlowTheme.of(context).white,
                                    headerForegroundColor:
                                        FlutterFlowTheme.of(context).info,
                                    headerTextStyle:
                                        FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 32.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                    pickerBackgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    pickerForegroundColor: Colors.black,
                                    selectedDateTimeBackgroundColor:
                                        Colors.white,
                                    selectedDateTimeForegroundColor:
                                        Colors.black,
                                    actionButtonForegroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryText,
                                    iconSize: 24.0,
                                  );
                                },
                              );

                              if (_datePicked2Date != null) {
                                safeSetState(() {
                                  _model.datePicked2 = DateTime(
                                    _datePicked2Date.year,
                                    _datePicked2Date.month,
                                    _datePicked2Date.day,
                                  );
                                });
                              }
                              setState(() {
                                _model.registeredUntil = valueOrDefault<String>(
                                  dateTimeFormat(
                                    'yMd',
                                    _model.datePicked2,
                                    locale: 'en',
                                  ),
                                  'dd/MM/yyyy',
                                );
                              });
                            },
                            child: Container(
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  color: Color(0xFFE1E1E1),
                                  width: 1.0,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Text(
                                      _model.registeredUntil,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Icon(
                                      Icons.calendar_month,
                                      color: Color(0xFF092853),
                                      size: 24.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'inti40rk' /* Plate Number */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF3D6398),
                                  ),
                            ),
                          ),
                          Container(
                            height: 40.0,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _model.textController1,
                                    focusNode: _model.textFieldFocusNode1,
                                    textInputAction: TextInputAction.next,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText:
                                          FFLocalizations.of(context).getText(
                                        'o2hm26dg' /*  */,
                                      ),
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Heebo Regular',
                                            color: Color(0xFF747474),
                                            useGoogleFonts: false,
                                          ),
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
                                          color: Color(0xFF3D6398),
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
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    keyboardType: TextInputType.number,
                                    validator: _model.textController1Validator
                                        .asValidator(context),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'py8x535l' /* VIN Number */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF3D6398),
                                  ),
                            ),
                          ),
                          Container(
                            height: 40.0,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _model.textController2,
                                    focusNode: _model.textFieldFocusNode2,
                                    textInputAction: TextInputAction.next,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText:
                                          FFLocalizations.of(context).getText(
                                        'ydf9otge' /*  */,
                                      ),
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Heebo Regular',
                                            color: Color(0xFF747474),
                                            useGoogleFonts: false,
                                          ),
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
                                          color: Color(0xFF3D6398),
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
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    keyboardType: TextInputType.text,
                                    validator: _model.textController2Validator
                                        .asValidator(context),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'g1uqeq5j' /* Engine Cpacity */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF3D6398),
                                  ),
                            ),
                          ),
                          Container(
                            height: 40.0,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller:
                                        _model.textFieldCapacityController,
                                    focusNode:
                                        _model.textFieldCapacityFocusNode,
                                    textInputAction: TextInputAction.next,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText:
                                          FFLocalizations.of(context).getText(
                                        '188vcdas' /*  */,
                                      ),
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Heebo Regular',
                                            color: Color(0xFF747474),
                                            useGoogleFonts: false,
                                          ),
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
                                          color: Color(0xFF3D6398),
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
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    keyboardType: TextInputType.number,
                                    validator: _model
                                        .textFieldCapacityControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'acbq9clz' /* Fule Type */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF3D6398),
                                  ),
                            ),
                          ),
                          Container(
                            height: 40.0,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowDropDown<String>(
                                  controller:
                                      _model.dropDownValueController3 ??=
                                          FormFieldController<String>(null),
                                  options: _model.fuelTypesList
                                      .map((e) => e.name)
                                      .toList(),
                                  onChanged: (val) {
                                    setState(() {
                                      _model.selectedFuelType = _model
                                          .fuelTypesList
                                          .where((e) => e.name == val)
                                          .single;
                                      _model.dropDownValue3 = val;
                                    });
                                  },
                                  width: 270.0,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  hintText: _model.selectedStringFuelType,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor: Color(0xFFE1E1E1),
                                  borderWidth: 1.0,
                                  borderRadius: 5.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 15.0, 0.0, 15.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Builder(
                              builder: (context) => FFButtonWidget(
                                onPressed: () async {
                                  String? value = _model.dropDownValue1 ??
                                      _model.selectedCarModel?.name;
                                  if(value==null){
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text(FFLocalizations.of(context)
                                              .getVariableText(
                                            enText: 'ALERT',
                                            arText: 'تنبيه',
                                          )),
                                          content: Text(
                                              FFLocalizations.of(context)
                                                  .getVariableText(
                                                enText: 'Select Car Type',
                                                arText: 'قم بأختيار نوع سيارة',
                                              )),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text(FFLocalizations.of(context)
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


                                  // if(_model
                                  //     .selectedCarCategories?.id==0){
                                  //   await showDialog(
                                  //     context: context,
                                  //     builder: (alertDialogContext) {
                                  //       return AlertDialog(
                                  //         title: Text(FFLocalizations.of(context)
                                  //             .getVariableText(
                                  //           enText: 'ALERT',
                                  //           arText: 'تنبيه',
                                  //         )),
                                  //         content: Text(
                                  //             FFLocalizations.of(context)
                                  //                 .getVariableText(
                                  //               enText: 'Select Car Category',
                                  //               arText: 'قم بأختيار فئة السيارة',
                                  //             )),
                                  //         actions: [
                                  //           TextButton(
                                  //             onPressed: () => Navigator.pop(
                                  //                 alertDialogContext),
                                  //             child: Text(FFLocalizations.of(context)
                                  //                 .getVariableText(
                                  //               enText: 'Ok',
                                  //               arText: 'حسنا',
                                  //             )),
                                  //           ),
                                  //         ],
                                  //       );
                                  //     },
                                  //   );
                                  //   return;
                                  // }


                                  if(_model
                                      .yearOfManufacturingString.isEmpty){
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text(FFLocalizations.of(context)
                                              .getVariableText(
                                            enText: 'ALERT',
                                            arText: 'تنبيه',
                                          )),
                                          content: Text(
                                              FFLocalizations.of(context)
                                                  .getVariableText(
                                                enText: 'Select Year Of Manufacturing',
                                                arText: 'قم بأختيار سنة الصنع',
                                              )),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text(FFLocalizations.of(context)
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

                                  if(_model
                                      .registeredUntil.isEmpty){
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text(FFLocalizations.of(context)
                                              .getVariableText(
                                            enText: 'ALERT',
                                            arText: 'تنبيه',
                                          )),
                                          content: Text(
                                              FFLocalizations.of(context)
                                                  .getVariableText(
                                                enText: 'Select Registered Until',
                                                arText: 'قم بأختيار مسجل لغاية',
                                              )),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text(FFLocalizations.of(context)
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



                                  if(_model.textController1.text.isEmpty){
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text(FFLocalizations.of(context)
                                              .getVariableText(
                                            enText: 'ALERT',
                                            arText: 'تنبيه',
                                          )),
                                          content: Text(
                                              FFLocalizations.of(context)
                                                  .getVariableText(
                                                enText: 'Add Plate Number',
                                                arText: 'قم بأضافة رقم المركبة',
                                              )),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text(FFLocalizations.of(context)
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


                                  if(_model.textController2.text.isEmpty){
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text(FFLocalizations.of(context)
                                              .getVariableText(
                                            enText: 'ALERT',
                                            arText: 'تنبيه',
                                          )),
                                          content: Text(
                                              FFLocalizations.of(context)
                                                  .getVariableText(
                                                enText: 'Add Vin Number',
                                                arText: 'قم بأضافة رقم الفن',
                                              )),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text(FFLocalizations.of(context)
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


                                  if(_model.textFieldCapacityController.text.isEmpty){
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text(FFLocalizations.of(context)
                                              .getVariableText(
                                            enText: 'ALERT',
                                            arText: 'تنبيه',
                                          )),
                                          content: Text(
                                              FFLocalizations.of(context)
                                                  .getVariableText(
                                                enText: 'Add Engine Capacity',
                                                arText: 'قم بأضافة سعة المحرك',
                                              )),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text(FFLocalizations.of(context)
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
                                  if((_model.selectedFuelType?.id??0) ==0){
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text(FFLocalizations.of(context)
                                              .getVariableText(
                                            enText: 'ALERT',
                                            arText: 'تنبيه',
                                          )),
                                          content: Text(
                                              FFLocalizations.of(context)
                                                  .getVariableText(
                                                enText: 'Add Fuel Type',
                                                arText: 'قم بأضافة نوع الوقود',
                                              )),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text(FFLocalizations.of(context)
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


                                  _model.apiResult4m8 =
                                      await StoreVehicleApiCall.call(
                                    token: FFAppState().userModel.token,
                                    carType: _model.dropDownValue1 ??
                                        _model.selectedCarModel?.name,
                                    carModelId:
                                        _model.selectedCarModel?.id?.toString(),
                                    // carCategoryId: _model
                                    //     .selectedCarCategories?.id
                                    //     ?.toString(),
                                    yearOfManufacturing:
                                        _model.yearOfManufacturingString,
                                    registeredUntil:
                                        functions.convertDateFormat(
                                            _model.registeredUntil),
                                    plateNumber: _model.textController1.text,
                                    vinNumber: _model.textController2.text,
                                    engineCapacity:
                                        _model.textFieldCapacityController.text,
                                    fuelTypeId:
                                        _model.selectedFuelType?.id?.toString(),
                                  );
                                  if ((_model.apiResult4m8?.succeeded ??
                                      true)) {
                                    context.pushNamed('ShopPage');
                                    Navigator.pop(context);
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: Modal06BasicInformationWidget(
                                            body: (_model
                                                    .apiResult4m8?.bodyText ??
                                                ''),
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(() {}));
                                  }

                                  setState(() {});
                                },
                                text: FFLocalizations.of(context).getText(
                                  'ndp3se3p' /* Save */,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).ahayundai,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
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
        ),
      ],
    );
  }

  // String extractManufacturingYearFromVIN(String vin) {
  //   // Check if the VIN is valid (you may want to implement additional validation)
  //   if (vin.length != 17) {
  //      return '';
  //   }
  //
  //   // Extract the 10th character from the VIN (position 9 in zero-based indexing)
  //   String yearCharacter = vin[9];
  //
  //   // Check if the character is a digit
  //   if (!RegExp(r'\d').hasMatch(yearCharacter)) {
  //     return '';
  //   }
  //
  //   // Convert the character to an integer
  //   int yearDigit = int.parse(yearCharacter);
  //
  //   // Determine the year based on the VIN convention
  //   // Note: This is a simplified example and may not cover all cases
  //   // You might want to consult the VIN standards for a more comprehensive implementation
  //   if (yearDigit >= 0 && yearDigit <= 9) {
  //     // For years 0-9, assume the year is 2010 + yearDigit
  //     return "20${yearDigit.toString().padLeft(2, '0')}";
  //   } else {
  //     // For years A-Y, assume the year is 1980 + (A=1, B=2, ..., Y=25)
  //     return (1980 + yearDigit - 1).toString();
  //   }
  // }

  List<String> generateDates() {
    List<String> yearList = [];
    // Get the current year
    int currentYear = DateTime.now().year;
    // Generate years from 1990 to the current year
    for (int year = 1990; year <= currentYear; year++) {
      // Add the year to the list as a string
      yearList.add(year.toString());
    }
    return yearList;
  }
}
