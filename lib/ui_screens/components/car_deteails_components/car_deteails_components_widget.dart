import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'car_deteails_components_model.dart';
export 'car_deteails_components_model.dart';

class CarDeteailsComponentsWidget extends StatefulWidget {
  const CarDeteailsComponentsWidget({
    Key? key,
    required this.carDetailsModel,
  }) : super(key: key);

  final dynamic carDetailsModel;

  @override
  _CarDeteailsComponentsWidgetState createState() =>
      _CarDeteailsComponentsWidgetState();
}

class _CarDeteailsComponentsWidgetState
    extends State<CarDeteailsComponentsWidget> {
  late CarDeteailsComponentsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarDeteailsComponentsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.listOfPerformance = await actions.carDetialsAction(
        getJsonField(
          widget.carDetailsModel,
          r'''$.performance''',
        ).toString().toString(),
        FFLocalizations.of(context).languageCode,
      );
      _model.listOfSafty = await actions.carDetialsAction(
        getJsonField(
          widget.carDetailsModel,
          r'''$.safty''',
        ).toString().toString(),
        FFLocalizations.of(context).languageCode,
      );
      _model.listOfInterior = await actions.carDetialsAction(
        getJsonField(
          widget.carDetailsModel,
          r'''$.interior''',
        ).toString().toString(),
        FFLocalizations.of(context).languageCode,
      );
      _model.listOfExterior = await actions.carDetialsAction(
        getJsonField(
          widget.carDetailsModel,
          r'''$.exterior''',
        ).toString().toString(),
        FFLocalizations.of(context).languageCode,
      );
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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(35.0, 0.0, 35.0, 0.0),
      child: Container(
        decoration: BoxDecoration(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF5584BC),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 15.0, 0.0, 15.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'hbpd88lb' /* Technical Presentation */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'HeeboBold',
                                    color: FlutterFlowTheme.of(context).white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFE3E3E3),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: Visibility(
                    visible: _model.listOfPerformance!.length > 0,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        setState(() {
                          FFAppState().listOfCatalogOpendBool = functions
                              .updateAtIndexAndClearOthers(
                                  FFAppState().listOfCatalogOpendBool.toList(),
                                  0)
                              .toList()
                              .cast<bool>();
                        });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Stack(
                            children: [
                              if (FFAppState().listOfCatalogOpendBool[0])
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 15.0, 0.0),
                                  child: Icon(
                                    Icons.do_not_disturb_on_rounded,
                                    color: Color(0xFF092853),
                                    size: 24.0,
                                  ),
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: Icon(
                                  Icons.add_circle_rounded,
                                  color: Color(0xFF092853),
                                  size: 24.0,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 15.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'khvo8lsz' /* Performance */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'HeeboBold',
                                    color: Color(0xFF092853),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (FFAppState().listOfCatalogOpendBool[0] == true)
                Builder(
                  builder: (context) {
                    final performances =
                        _model.listOfPerformance!.map((e) => e).toList();
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: performances.length,
                      itemBuilder: (context, performancesIndex) {
                        final performancesItem =
                            performances[performancesIndex];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: performancesIndex == 0
                                  ? Color(0xFFF9F9F9)
                                  : Color(0xFFF1F1F1),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 15.0, 15.0, 15.0),
                              child: Text(
                                performancesItem,
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Heebo Regular',
                                      color: Color(0xFF363636),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFE3E3E3),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: Visibility(
                    visible: _model.listOfSafty!.length > 0,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        setState(() {
                          FFAppState().listOfCatalogOpendBool = functions
                              .updateAtIndexAndClearOthers(
                                  FFAppState().listOfCatalogOpendBool.toList(),
                                  1)
                              .toList()
                              .cast<bool>();
                        });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Stack(
                            children: [
                              if (FFAppState().listOfCatalogOpendBool[1])
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 15.0, 0.0),
                                  child: Icon(
                                    Icons.do_not_disturb_on_rounded,
                                    color: Color(0xFF092853),
                                    size: 24.0,
                                  ),
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: Icon(
                                  Icons.add_circle_rounded,
                                  color: Color(0xFF092853),
                                  size: 24.0,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 15.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'lc6uwna8' /* Safety */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'HeeboBold',
                                    color: Color(0xFF092853),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (FFAppState().listOfCatalogOpendBool[1] == true)
                Builder(
                  builder: (context) {
                    final safty = _model.listOfSafty!.map((e) => e).toList();
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: safty.length,
                      itemBuilder: (context, saftyIndex) {
                        final saftyItem = safty[saftyIndex];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: saftyIndex == 0
                                  ? Color(0xFFF9F9F9)
                                  : Color(0xFFF1F1F1),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 15.0, 15.0, 15.0),
                              child: Text(
                                saftyItem,
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Heebo Regular',
                                      color: Color(0xFF363636),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFE3E3E3),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: Visibility(
                    visible: _model.listOfInterior!.length > 0,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        setState(() {
                          FFAppState().listOfCatalogOpendBool = functions
                              .updateAtIndexAndClearOthers(
                                  FFAppState().listOfCatalogOpendBool.toList(),
                                  2)
                              .toList()
                              .cast<bool>();
                        });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Stack(
                            children: [
                              if (FFAppState().listOfCatalogOpendBool[2])
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 15.0, 0.0),
                                  child: Icon(
                                    Icons.do_not_disturb_on_rounded,
                                    color: Color(0xFF092853),
                                    size: 24.0,
                                  ),
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: Icon(
                                  Icons.add_circle_rounded,
                                  color: Color(0xFF092853),
                                  size: 24.0,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 15.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'vhxcox48' /* Interior */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'HeeboBold',
                                    color: Color(0xFF092853),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (FFAppState().listOfCatalogOpendBool[2] == true)
                Builder(
                  builder: (context) {
                    final interior =
                        _model.listOfInterior!.map((e) => e).toList();
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: interior.length,
                      itemBuilder: (context, interiorIndex) {
                        final interiorItem = interior[interiorIndex];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: interiorIndex == 0
                                  ? Color(0xFFF9F9F9)
                                  : Color(0xFFF1F1F1),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 15.0, 15.0, 15.0),
                              child: Text(
                                interiorItem,
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Heebo Regular',
                                      color: Color(0xFF363636),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFE3E3E3),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: Visibility(
                    visible: _model.listOfExterior!.length > 0,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        setState(() {
                          FFAppState().listOfCatalogOpendBool = functions
                              .updateAtIndexAndClearOthers(
                                  FFAppState().listOfCatalogOpendBool.toList(),
                                  3)
                              .toList()
                              .cast<bool>();
                        });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Stack(
                            children: [
                              if (FFAppState().listOfCatalogOpendBool[3])
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 15.0, 0.0),
                                  child: Icon(
                                    Icons.do_not_disturb_on_rounded,
                                    color: Color(0xFF092853),
                                    size: 24.0,
                                  ),
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: Icon(
                                  Icons.add_circle_rounded,
                                  color: Color(0xFF092853),
                                  size: 24.0,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 15.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'ekqa9og1' /* Exterior */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'HeeboBold',
                                    color: Color(0xFF092853),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (FFAppState().listOfCatalogOpendBool[3] == true)
                Builder(
                  builder: (context) {
                    final performances =
                        _model.listOfExterior!.map((e) => e).toList();
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: performances.length,
                      itemBuilder: (context, performancesIndex) {
                        final performancesItem =
                            performances[performancesIndex];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: performancesIndex == 0
                                  ? Color(0xFFF9F9F9)
                                  : Color(0xFFF1F1F1),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 15.0, 15.0, 15.0),
                              child: Text(
                                performancesItem,
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Heebo Regular',
                                      color: Color(0xFF363636),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
