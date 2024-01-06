import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'time_component_list_model.dart';
export 'time_component_list_model.dart';

class TimeComponentListWidget extends StatefulWidget {
  const TimeComponentListWidget({
    Key? key,
    required this.date,
    required this.serviceType,
  }) : super(key: key);

  final String? date;
  final String? serviceType;

  @override
  _TimeComponentListWidgetState createState() =>
      _TimeComponentListWidgetState();
}

class _TimeComponentListWidgetState extends State<TimeComponentListWidget> {
  late TimeComponentListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimeComponentListModel());

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
      width: 390.0,
      height: 450.0,
      decoration: BoxDecoration(),
      child: FutureBuilder<ApiCallResponse>(
        future: CheckAvailableTimeCall.call(
          token: FFAppState().userModel.token,
          serviceType: widget.serviceType,
          date: widget.date,
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitDualRing(
                  color: Color(0xFF092853),
                  size: 50.0,
                ),
              ),
            );
          }
          final listViewCheckAvailableTimeResponse = snapshot.data!;
          return Builder(
            builder: (context) {
              final locsListTime = getJsonField(
                listViewCheckAvailableTimeResponse.jsonBody,
                r'''$.availableTime''',
              ).toList();
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: locsListTime.length,
                itemBuilder: (context, locsListTimeIndex) {
                  final locsListTimeItem = locsListTime[locsListTimeIndex];
                  return Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        setState(() {
                          FFAppState().selectedTimeFromHundai = getJsonField(
                            locsListTimeItem,
                            r'''$.AvalibleDate''',
                          ).toString();
                        });
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5.0,
                              color: Color(0x3416202A),
                              offset: Offset(0.0, 2.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12.0),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.timer_sharp,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    getJsonField(
                                      locsListTimeItem,
                                      r'''$.AvalibleDate''',
                                    ).toString(),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 18.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
