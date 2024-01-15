import 'package:hyundai/ui_screens/nav_home_pakage/empty_list_component/empty_list_component_widget.dart';

import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'time_component_list_model.dart';
export 'time_component_list_model.dart';

class TimeComponentListWidget extends StatefulWidget {
  const TimeComponentListWidget({
    Key? key,
    required this.list,
    // required this.serviceType,
  }) : super(key: key);

  final List<dynamic>? list;

  // final String? servicexType;

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
    return (widget.list?.isEmpty ?? true)
        ? Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
        width: 390.0,
        height: 450.0,
        color: Colors.white,
        child: const EmptyListComponentWidget())
        : Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
            width: 390.0,
            height: 450.0,
            color: Colors.white,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: widget.list?.length,
              itemBuilder: (context, locsListTimeIndex) {
                final locsListTimeItem = widget.list?[locsListTimeIndex];
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
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                              color: FlutterFlowTheme.of(context).secondaryText,
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
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 18.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ));
  }
}
