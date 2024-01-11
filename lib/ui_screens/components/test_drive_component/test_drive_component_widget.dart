import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test_drive_component_model.dart';
export 'test_drive_component_model.dart';

class TestDriveComponentWidget extends StatefulWidget {

  final int modelId;

    TestDriveComponentWidget({Key? key,required this.modelId}) : super(key: key);

  @override
  _TestDriveComponentWidgetState createState() =>
      _TestDriveComponentWidgetState();
}

class _TestDriveComponentWidgetState extends State<TestDriveComponentWidget> {
  late TestDriveComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestDriveComponentModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

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
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 15.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 0.0),
          child:  SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'smmv6dor' /* Test Drive */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                          color: FlutterFlowTheme.of(context).secondaryText,
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                  child: TextFormField(
                    controller: _model.textController1,
                    focusNode: _model.textFieldFocusNode1,
                    obscureText: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        'zy6luwtl' /* Name */,
                      ),
                      labelStyle:
                      FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFF81787A),
                      ),
                      hintStyle:
                      FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Heebo',
                        fontWeight: FontWeight.normal,
                        useGoogleFonts: false,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _model.nameIsFilled == false
                              ? FlutterFlowTheme.of(context).error
                              : FlutterFlowTheme.of(context).accent3,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _model.nameIsFilled == false
                              ? FlutterFlowTheme.of(context).error
                              : FlutterFlowTheme.of(context).accent3,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _model.nameIsFilled == false
                              ? FlutterFlowTheme.of(context).error
                              : Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _model.nameIsFilled == false
                              ? FlutterFlowTheme.of(context).error
                              : Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).white,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    validator:
                    _model.textController1Validator.asValidator(context),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                  child: TextFormField(
                    controller: _model.textController2,
                    focusNode: _model.textFieldFocusNode2,
                    obscureText: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        'j8gvjivm' /* Mobile */,
                      ),
                      labelStyle:
                      FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFF81787A),
                      ),
                      hintStyle:
                      FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Heebo',
                        fontWeight: FontWeight.normal,
                        useGoogleFonts: false,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _model.mobileIsFilled == false
                              ? FlutterFlowTheme.of(context).error
                              : FlutterFlowTheme.of(context).accent3,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _model.mobileIsFilled == false
                              ? FlutterFlowTheme.of(context).error
                              : FlutterFlowTheme.of(context).accent3,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _model.mobileIsFilled == false
                              ? FlutterFlowTheme.of(context).error
                              : Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _model.mobileIsFilled == false
                              ? FlutterFlowTheme.of(context).error
                              : Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      filled: true,
                      fillColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    validator:
                    _model.textController2Validator.asValidator(context),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                  child: TextFormField(
                    controller: _model.textController3,
                    focusNode: _model.textFieldFocusNode3,
                    textInputAction: TextInputAction.done,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        '2cld7qli' /* Notes */,
                      ),
                      labelStyle:
                      FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFF81787A),
                      ),
                      hintStyle:
                      FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Heebo',
                        fontWeight: FontWeight.normal,
                        useGoogleFonts: false,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _model.noteIsFilled == false
                              ? FlutterFlowTheme.of(context).error
                              : FlutterFlowTheme.of(context).accent3,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _model.noteIsFilled == false
                              ? FlutterFlowTheme.of(context).error
                              : FlutterFlowTheme.of(context).accent3,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _model.noteIsFilled == false
                              ? FlutterFlowTheme.of(context).error
                              : Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _model.noteIsFilled == false
                              ? FlutterFlowTheme.of(context).error
                              : Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      filled: true,
                      fillColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    textAlign: TextAlign.start,
                    maxLines: 4,
                    keyboardType: TextInputType.multiline,
                    validator:
                    _model.textController3Validator.asValidator(context),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Theme(
                      data: ThemeData(
                        checkboxTheme: CheckboxThemeData(
                          visualDensity: VisualDensity.standard,
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),

                          ),
                          side: BorderSide(
                            color: _model.youWillBeContaced == false
                                ? FlutterFlowTheme.of(context).error
                                : FlutterFlowTheme.of(context).secondaryText,
                            width: 1.0,
                          ),
                        ),
                        unselectedWidgetColor:
                        FlutterFlowTheme.of(context).secondaryText,
                      ),
                      child: Checkbox(
                        value: _model.checkboxValue ??= false,
                        onChanged: (newValue) async {
                          setState(() => _model.checkboxValue = newValue!);
                        },
                        activeColor: FlutterFlowTheme.of(context).primary,
                        checkColor: FlutterFlowTheme.of(context).info,
                      ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        '1s87izjp' /* You will be contacted */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 20.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (_model.textController1.text != null &&
                          _model.textController1.text != ''
                          ? true
                          : false) {
                        setState(() {
                          _model.nameIsFilled = true;
                        });
                      } else {
                        setState(() {
                          _model.nameIsFilled = false;
                        });
                      }

                      if (_model.textController2.text != null &&
                          _model.textController2.text != ''
                          ? true
                          : false) {
                        setState(() {
                          _model.mobileIsFilled = true;
                        });
                      } else {
                        setState(() {
                          _model.mobileIsFilled = false;
                        });
                      }

                      if (_model.textController3.text != null &&
                          _model.textController3.text != ''
                          ? true
                          : false) {
                        setState(() {
                          _model.noteIsFilled = true;
                        });
                      } else {
                        setState(() {
                          _model.noteIsFilled = false;
                        });
                      }


                      if(_model.checkboxValue ?? false){
                        setState(() {
                          _model.youWillBeContaced = true;
                        });
                      }else{
                        setState(() {
                          _model.youWillBeContaced = false;
                        });
                      }

                      if (_model.nameIsFilled &&
                          _model.mobileIsFilled &&
                          _model.noteIsFilled && _model.youWillBeContaced) {
                        _model.apiResultvrn = await TestDriveApiCall.call(
                          token: FFAppState().userModel.token,
                          date: dateTimeFormat(
                            'yyyy-MM-dd',
                            getCurrentTimestamp,
                            locale: 'en',
                          ),
                          time: '00:00',
                          note: 'note  : ${_model.textController3.text}\nmobile : ${_model.textController2.text}',
                          carModelId: widget.modelId,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              FFLocalizations.of(
                                  context)
                                  .getVariableText(
                                enText:
                                'Your request is sent',
                                arText:
                                'تم ارسال طلبك بنجاح',
                              ),
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).white,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:   FlutterFlowTheme.of(
                                context)
                                .secondary,
                          ),
                        );
                        Navigator.pop(context);
                        setState(() {});
                      }},
                    text: FFLocalizations.of(context).getText(
                      '4nqcrahs' /* Send */,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).ahayundai,
                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
