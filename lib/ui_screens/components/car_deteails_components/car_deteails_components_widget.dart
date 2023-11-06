import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
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
        'ar',
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

    return Container(
      decoration: BoxDecoration(),
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 0.0, 15.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'hbpd88lb' /* Technical Presentation */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
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
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                    child: Icon(
                      Icons.do_not_disturb_on_rounded,
                      color: Color(0xFF092853),
                      size: 24.0,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'khvo8lsz' /* Performance */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                  final performancesItem = performances[performancesIndex];
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: performancesIndex == 0
                            ? Color(0xFFF9F9F9)
                            : Color(0xFFF1F1F1),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 15.0, 15.0, 15.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'dlppqu44' /* Performance */,
                              ),
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
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
