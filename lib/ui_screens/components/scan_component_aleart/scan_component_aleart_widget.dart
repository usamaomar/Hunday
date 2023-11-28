import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'scan_component_aleart_model.dart';
export 'scan_component_aleart_model.dart';

class ScanComponentAleartWidget extends StatefulWidget {
  const ScanComponentAleartWidget({Key? key}) : super(key: key);

  @override
  _ScanComponentAleartWidgetState createState() =>
      _ScanComponentAleartWidgetState();
}

class _ScanComponentAleartWidgetState extends State<ScanComponentAleartWidget> {
  late ScanComponentAleartModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScanComponentAleartModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).accent4,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'eutzet15' /* Forget Password */,
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'HeeboBold',
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.5, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          final selectedFiles = await selectFiles(
                            multiFile: true,
                          );
                          if (selectedFiles != null) {
                            setState(() => _model.isDataUploading = true);
                            var selectedUploadedFiles = <FFUploadedFile>[];

                            try {
                              selectedUploadedFiles = selectedFiles
                                  .map((m) => FFUploadedFile(
                                        name: m.storagePath.split('/').last,
                                        bytes: m.bytes,
                                      ))
                                  .toList();
                            } finally {
                              _model.isDataUploading = false;
                            }
                            if (selectedUploadedFiles.length ==
                                selectedFiles.length) {
                              setState(() {
                                _model.uploadedLocalFiles =
                                    selectedUploadedFiles;
                              });
                            } else {
                              setState(() {});
                              return;
                            }
                          }

                          _model.outLoads = await LicenseScanApiCall.call(
                            firstImage: _model.uploadedLocalFiles[0],
                            secondImage: _model.uploadedLocalFiles[1],
                          );
                          if ((_model.outLoads?.succeeded ?? true)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  (_model.outLoads?.bodyText ?? ''),
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                          }

                          setState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          '0qhubzil' /* Scan By Camra */,
                        ),
                        options: FFButtonOptions(
                          width: 115.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).accent4,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.of(context).ahayundai,
                                fontWeight: FontWeight.bold,
                              ),
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).ahayundai,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: FFLocalizations.of(context).getText(
                          'b0wr6uc1' /* Select from galary */,
                        ),
                        options: FFButtonOptions(
                          width: 115.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).ahayundai,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).ahayundai,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
