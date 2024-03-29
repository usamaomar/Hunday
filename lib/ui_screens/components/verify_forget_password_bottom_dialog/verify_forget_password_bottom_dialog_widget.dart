import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/ui_screens/components/modal06_basic_information/modal06_basic_information_widget.dart';
import '/ui_screens/components/reset_password_component/reset_password_component_widget.dart';
import '/backend/schema/structs/index.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'verify_forget_password_bottom_dialog_model.dart';
export 'verify_forget_password_bottom_dialog_model.dart';

class VerifyForgetPasswordBottomDialogWidget extends StatefulWidget {
  const VerifyForgetPasswordBottomDialogWidget({
    super.key,
    required this.phoneNumber,
  });

  final String? phoneNumber;

  @override
  State<VerifyForgetPasswordBottomDialogWidget> createState() =>
      _VerifyForgetPasswordBottomDialogWidgetState();
}

class _VerifyForgetPasswordBottomDialogWidgetState
    extends State<VerifyForgetPasswordBottomDialogWidget> {
  late VerifyForgetPasswordBottomDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => VerifyForgetPasswordBottomDialogModel());

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

    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: FlutterFlowTheme.of(context).secondaryBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: Container(
        height: 390.0,
        decoration: BoxDecoration(
          color: Color(0xFFC1D6EF),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 51.0, 15.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 1.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'x13100ln' /* Forget Password */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'HeeboBold',
                            color: Color(0xFF092853),
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'ae0t356p' /* Check your sms and enter 4 dig... */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Heebo Regular',
                          color: Color(0xFF092853),
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: false,
                        ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(100.0, 10.0, 100.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Builder(
                        builder: (context) => PinCodeTextField(
                          autoDisposeControllers: false,
                          appContext: context,
                          length: 4,
                          textStyle: FlutterFlowTheme.of(context).bodyLarge,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          enableActiveFill: true,
                          autoFocus: false,
                          enablePinAutofill: true,
                          errorTextSpace: 16.0,
                          showCursor: true,
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          obscureText: false,
                          keyboardType: TextInputType.number,
                          pinTheme: PinTheme(
                            fieldHeight: 34.0,
                            fieldWidth: 34.0,
                            borderWidth: 2.0,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5.0),
                              bottomRight: Radius.circular(5.0),
                              topLeft: Radius.circular(5.0),
                              topRight: Radius.circular(5.0),
                            ),
                            shape: PinCodeFieldShape.box,
                            activeColor: FlutterFlowTheme.of(context).white,
                            inactiveColor: FlutterFlowTheme.of(context).white,
                            selectedColor: FlutterFlowTheme.of(context).white,
                            activeFillColor: FlutterFlowTheme.of(context).white,
                            inactiveFillColor:
                                FlutterFlowTheme.of(context).white,
                            selectedFillColor:
                                FlutterFlowTheme.of(context).white,
                          ),
                          controller: _model.pinCodeController,
                          onChanged: (_) {},
                          onCompleted: (_) async {
                            _model.apiResultpqp =
                                await GetVerifiedCodeApiCall.call(
                              phone: widget.phoneNumber,
                              verifiedCode: _model.pinCodeController!.text,
                            );
                            if ((_model.apiResultpqp?.succeeded ?? true)) {
                              setState(() {
                                FFAppState().userModel =
                                    UserModelStruct.maybeFromMap(
                                        (_model.apiResultpqp?.jsonBody ?? ''))!;
                              });
                              Navigator.pop(context);
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
                                      body:
                                          (_model.apiResultpqp?.bodyText ?? ''),
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            }

                            showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Color(0x00FFFFFF),
                              barrierColor: Color(0x00FFFFFF),
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: Container(
                                    height: 400.0,
                                    child: ResetPasswordComponentWidget(),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));

                            setState(() {});
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: _model.pinCodeControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: 350.0,
                      height: 50.0,
                      child: custom_widgets.TextCounterCustomWidget(
                        width: 350.0,
                        height: 50.0,
                        recallText: FFLocalizations.of(context).getVariableText(
                          enText: 'Didn\'t receive the code ?',
                          arText: 'لم تتلق الرمز؟',
                        ),
                        onRecallClicked: () async {
                          _model.apiResultjcw = await GetMobileNumberCall.call(
                            phone: getJsonField(
                              FFAppState().reservedUserModel,
                              r'''$.phone''',
                            ).toString(),
                          );

                          setState(() {});
                        },
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
