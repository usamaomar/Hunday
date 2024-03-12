import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../../../backend/api_requests/api_calls.dart';
import '../modal06_basic_information/modal06_basic_information_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'uploade_photo_component_model.dart';
export 'uploade_photo_component_model.dart';

class UploadePhotoComponentWidget extends StatefulWidget {

  final FFUploadedFile ffUploadedFile;
  final File? fileImage;

  UploadePhotoComponentWidget({super.key,required this.ffUploadedFile,required this.fileImage});

  @override
  State<UploadePhotoComponentWidget> createState() =>
      _UploadePhotoComponentWidgetState();
}

class _UploadePhotoComponentWidgetState
    extends State<UploadePhotoComponentWidget> {
  late UploadePhotoComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UploadePhotoComponentModel());

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
    return Stack(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 60.0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 350.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(4.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 20.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 200.0,
                                  height: 150.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFDBE2E7),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.file(
                                         widget.fileImage ?? File('path'),
                                      ).image,
                                    ),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Container(
                                          width: 220.0,
                                          height: 170.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: Container()
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 44.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    _model.apiResultixl =
                                    await UploadFileApiCall.call(
                                      file: widget.ffUploadedFile,
                                      token: FFAppState().userModel.token,
                                    );
                                    if ((_model.apiResultixl?.succeeded ?? true)) {
                                      Navigator.pop(context,getJsonField(
                                        (_model.apiResultixl
                                            ?.jsonBody ??
                                            ''),
                                        r'''$''',
                                      ));
                                    }else{
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            insetPadding:
                                            EdgeInsets.zero,
                                            backgroundColor:
                                            Colors.transparent,
                                            alignment:
                                            const AlignmentDirectional(
                                                0.0, 0.0)
                                                .resolve(
                                                Directionality.of(
                                                    context)),
                                            child: Modal06BasicInformationWidget(
                                              body: (_model
                                                  .apiResultixl
                                                  ?.bodyText ??
                                                  ''),
                                            ),
                                          );
                                        },
                                      ).then((value)  {
                                        setState(() {});
                                        return;
                                      });
                                    }
                                    context.pop();
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'qrsoamh0' /* Save Changes */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 150.0,
                                    height: 50.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    elevation: 2.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
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
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Icon(Icons.close,
                    size: 25, color: Colors.black),
                onTap: () {
                  context.pop();
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
