import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reset_password_component_model.dart';
export 'reset_password_component_model.dart';

class ResetPasswordComponentWidget extends StatefulWidget {
  const ResetPasswordComponentWidget({Key? key}) : super(key: key);

  @override
  _ResetPasswordComponentWidgetState createState() =>
      _ResetPasswordComponentWidgetState();
}

class _ResetPasswordComponentWidgetState
    extends State<ResetPasswordComponentWidget> {
  late ResetPasswordComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResetPasswordComponentModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();
    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
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
                  'nqo6qsgz' /* Forget Password */,
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
              padding: EdgeInsetsDirectional.fromSTEB(30.0, 20.0, 30.0, 0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: TextFormField(
                    controller: _model.textController1,
                    focusNode: _model.textFieldFocusNode1,
                    textInputAction: TextInputAction.next,
                    obscureText: !_model.passwordVisibility1,
                    decoration: InputDecoration(
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintText: FFLocalizations.of(context).getText(
                        'yq2npxjx' /* New Password */,
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
                      suffixIcon: InkWell(
                        onTap: () => setState(
                          () => _model.passwordVisibility1 =
                              !_model.passwordVisibility1,
                        ),
                        focusNode: FocusNode(skipTraversal: true),
                        child: Icon(
                          _model.passwordVisibility1
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: FlutterFlowTheme.of(context).lineColor,
                          size: 22.0,
                        ),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF092853),
                        ),
                    validator:
                        _model.textController1Validator.asValidator(context),
                  ),
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
                    controller: _model.textController2,
                    focusNode: _model.textFieldFocusNode2,
                    obscureText: !_model.passwordVisibility2,
                    decoration: InputDecoration(
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintText: FFLocalizations.of(context).getText(
                        'oqqu4z0b' /* Confirm New Password */,
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
                      suffixIcon: InkWell(
                        onTap: () => setState(
                          () => _model.passwordVisibility2 =
                              !_model.passwordVisibility2,
                        ),
                        focusNode: FocusNode(skipTraversal: true),
                        child: Icon(
                          _model.passwordVisibility2
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: FlutterFlowTheme.of(context).lineColor,
                          size: 22.0,
                        ),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF092853),
                        ),
                    validator:
                        _model.textController2Validator.asValidator(context),
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
                          var _shouldSetState = false;
                          _model.apiResetPassword =
                              await ChangePasswordApiCall.call(
                            password: _model.textController1.text,
                            passwordConfirmation: _model.textController2.text,
                            token: FFAppState().userModel.token,
                          );
                          _shouldSetState = true;
                          if ((_model.apiResetPassword?.succeeded ?? true)) {
                            setState(() {
                              FFAppState().userModel =
                                  UserModelStruct.fromSerializableMap(
                                      jsonDecode('{}'));
                              FFAppState().reservedUserModel = null;
                            });
                            Navigator.pop(context);
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text(FFLocalizations.of(context)
                                      .getVariableText(
                                    enText: 'Rest Password',
                                    arText: 'تعيين كلمة المرور',
                                  )),
                                  content: Text(FFLocalizations.of(context)
                                      .getVariableText(
                                    enText: 'Your password is reset , log in ',
                                    arText:
                                        'تم اعادة تعيين كلمة المرور قم بتسجيل الدخول ',
                                  )),
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
                                      (_model.apiResetPassword?.bodyText ??
                                          '')),
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
                            if (_shouldSetState) setState(() {});
                            return;
                          }

                          if (_shouldSetState) setState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          'hzhy9oyu' /* Save */,
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
