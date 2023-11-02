import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui_screens/components/verify_forget_password_bottom_dialog/verify_forget_password_bottom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'forget_password_component_model.dart';
export 'forget_password_component_model.dart';

class ForgetPasswordComponentWidget extends StatefulWidget {
  const ForgetPasswordComponentWidget({Key? key}) : super(key: key);

  @override
  _ForgetPasswordComponentWidgetState createState() =>
      _ForgetPasswordComponentWidgetState();
}

class _ForgetPasswordComponentWidgetState
    extends State<ForgetPasswordComponentWidget> {
  late ForgetPasswordComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ForgetPasswordComponentModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
          color: Color(0xFFC1D6EF),
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
                  '50yxbv27' /* Forget Password */,
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'HeeboBold',
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(57.0, 15.0, 57.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  '621mrpxx' /* You will receive a code on you... */,
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Heebo Regular',
                  color: Color(0xFF092853),
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(30.0, 20.0, 30.0, 0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintText: FFLocalizations.of(context).getText(
                        'utqibc5w' /* Phone Number */,
                      ),
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFF81787A),
                                fontSize: 14.0,
                              ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      filled: true,
                      fillColor: Color(0x000FFFFF),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF092853),
                        ),
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    validator:
                        _model.textControllerValidator.asValidator(context),
                  ),
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
                          EdgeInsetsDirectional.fromSTEB(80.0, 0.0, 80.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          _model.apiResultrqt = await GetMobileNumberCall.call(
                            phone: _model.textController.text,
                          );
                          if ((_model.apiResultrqt?.succeeded ?? true)) {
                            Navigator.pop(context);
                            showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              barrierColor: Color(0x00FFFFFF),
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: Container(
                                    height: 500.0,
                                    child:
                                        VerifyForgetPasswordBottomDialogWidget(
                                      phoneNumber: _model.textController.text,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text(FFLocalizations.of(context)
                                      .getVariableText(
                                    enText: 'Error',
                                    arText: 'مشكلة خادم',
                                  )),
                                  content: Text(
                                      (_model.apiResultrqt?.bodyText ?? '')),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
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
                          }

                          setState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          '902lootp' /* Send */,
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
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
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
