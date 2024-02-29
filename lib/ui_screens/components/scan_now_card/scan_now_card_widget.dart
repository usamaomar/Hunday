import '../blur_card_animation_component/blur_card_animation_component_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/ui_screens/components/list_of_string_items_component/list_of_string_items_component_widget.dart';
import '/ui_screens/components/modal06_basic_information/modal06_basic_information_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'scan_now_card_model.dart';
export 'scan_now_card_model.dart';

class ScanNowCardWidget extends StatefulWidget {
  const ScanNowCardWidget({super.key});

  @override
  State<ScanNowCardWidget> createState() => _ScanNowCardWidgetState();
}

class _ScanNowCardWidgetState extends State<ScanNowCardWidget> {
  late ScanNowCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScanNowCardModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
      child: Container(
        height: 270.0,
        decoration: BoxDecoration(
          color: Color(0x81FFFFFF),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 30.0,
              sigmaY: 30.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                '2doxlyqt' /* Scan Now */,
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
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.close_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1.0,
                        color: Color(0xFF3D6398),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(30.0, 20.0, 30.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'f8ub7r14' /* Front Face */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'HeeboBold',
                              color: Color(0xFF4E4E4E),
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: false,
                            ),
                      ),
                      Stack(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        children: [
                          if (_model.isFrontFaceAdded == false)
                            FFButtonWidget(
                              onPressed: () async {
                                final selectedMedia = await selectMedia(
                                  multiImage: false,
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  setState(
                                      () => _model.isDataUploading1 = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];

                                  try {
                                    selectedUploadedFiles = selectedMedia
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                              height: m.dimensions?.height,
                                              width: m.dimensions?.width,
                                              blurHash: m.blurHash,
                                            ))
                                        .toList();
                                  } finally {
                                    _model.isDataUploading1 = false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                      selectedMedia.length) {
                                    setState(() {
                                      _model.uploadedLocalFile1 =
                                          selectedUploadedFiles.first;
                                    });
                                  } else {
                                    setState(() {});
                                    return;
                                  }
                                }

                                if (_model
                                        .uploadedLocalFile1.bytes?.isNotEmpty ??
                                    false) {
                                  setState(() {
                                    _model.frontFaceImage =
                                        _model.uploadedLocalFile1;
                                  });
                                  setState(() {
                                    _model.isFrontFaceAdded = true;
                                  });
                                }
                              },
                              text: FFLocalizations.of(context).getText(
                                '4mxuj11u' /* Scan */,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFF646464),
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
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          Container(
                            decoration: BoxDecoration(),
                            child: Visibility(
                              visible: _model.isFrontFaceAdded == true,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 10.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: SvgPicture.asset(
                                    'assets/images/Path_76223.svg',
                                    height: 20.0,
                                    fit: BoxFit.cover,
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
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(30.0, 20.0, 30.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          '6unw2udt' /* Back Face */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'HeeboBold',
                              color: Color(0xFF4E4E4E),
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: false,
                            ),
                      ),
                      Stack(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        children: [
                          if (_model.isBackImageAdedd == false)
                            FFButtonWidget(
                              onPressed: () async {
                                final selectedMedia = await selectMedia(
                                  multiImage: false,
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  setState(
                                      () => _model.isDataUploading2 = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];

                                  try {
                                    selectedUploadedFiles = selectedMedia
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                              height: m.dimensions?.height,
                                              width: m.dimensions?.width,
                                              blurHash: m.blurHash,
                                            ))
                                        .toList();
                                  } finally {
                                    _model.isDataUploading2 = false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                      selectedMedia.length) {
                                    setState(() {
                                      _model.uploadedLocalFile2 =
                                          selectedUploadedFiles.first;
                                    });
                                  } else {
                                    setState(() {});
                                    return;
                                  }
                                }
                                if (_model
                                        .uploadedLocalFile2.bytes?.isNotEmpty ??
                                    false) {
                                  setState(() {
                                    _model.backFaceImage =
                                        _model.uploadedLocalFile2;
                                  });
                                  setState(() {
                                    _model.isBackImageAdedd = true;
                                  });
                                }
                              },
                              text: FFLocalizations.of(context).getText(
                                '7gkzwtaa' /* Scan */,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFF646464),
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
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Visibility(
                                visible: _model.isBackImageAdedd == true,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: SvgPicture.asset(
                                    'assets/images/Path_76223.svg',
                                    height: 20.0,
                                    fit: BoxFit.cover,
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
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(30.0, 40.0, 30.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Builder(
                        builder: (context) => FFButtonWidget(
                          onPressed: () async {
                            var _shouldSetState = false;
                            if ((_model.isFrontFaceAdded == true) &&
                                (_model.isBackImageAdedd == true)) {
                              _model.apiResultixl1 =
                                  await LicenseScanApiCall.call(
                                firstImage: _model.frontFaceImage,
                                secondImage: _model.backFaceImage,
                                token: FFAppState().userModel.token,
                              );
                              _shouldSetState = true;
                              if ((_model.apiResultixl1?.succeeded ?? true)) {
                                if (getJsonField(
                                      (_model.apiResultixl1?.jsonBody ?? ''),
                                      r'''$.info.is_hyundai''',
                                    ) ==
                                    false) {
                                  await showDialog(
                                    barrierColor: Colors.transparent,
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        child: BlurCardAnimationComponentWidget(
                                            title: FFLocalizations.of(context)
                                                .getVariableText(
                                              enText:
                                                  'This Application Only Accepts HYUNDAI Cars',
                                              arText:
                                                  'يقبل هذا التطبيق سيارات HYUNDAI فقط',
                                            ),
                                            buttonText:
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                              enText: 'Ok',
                                              arText: 'حسنا',
                                            ),
                                            actionOk: () {
                                              Navigator.pop(context);
                                            }),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                  return;
                                }

                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Color(0x0E000000),
                                  barrierColor: Color(0x0E000000),
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: Container(
                                        height: double.infinity,
                                        child: ListOfStringItemsComponentWidget(
                                          jsonData:
                                              (_model.apiResultixl1?.jsonBody ??
                                                  ''),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: Modal06BasicInformationWidget(
                                        body: (_model.apiResultixl1?.bodyText ??
                                            ''),
                                      ),
                                    );
                                  },
                                ).then((value) => setState(() {}));
                              }

                              Navigator.pop(context);
                            } else {
                              if (_shouldSetState) setState(() {});
                              return;
                            }

                            if (_shouldSetState) setState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            '2ksh7kyf' /* Save */,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFF3D6398),
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
                            borderRadius: BorderRadius.circular(5.0),
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
    );
  }
}
