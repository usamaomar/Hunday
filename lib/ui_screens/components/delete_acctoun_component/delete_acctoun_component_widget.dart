import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'delete_acctoun_component_model.dart';
export 'delete_acctoun_component_model.dart';

class DeleteAcctounComponentWidget extends StatefulWidget {
  const DeleteAcctounComponentWidget({super.key});

  @override
  State<DeleteAcctounComponentWidget> createState() =>
      _DeleteAcctounComponentWidgetState();
}

class _DeleteAcctounComponentWidgetState
    extends State<DeleteAcctounComponentWidget> {
  late DeleteAcctounComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeleteAcctounComponentModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(30.0, 15.0, 30.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          var confirmDialogResponse = await showDialog<bool>(
                context: context,
                builder: (alertDialogContext) {
                  return AlertDialog(
                    title: Text(FFLocalizations.of(context).getVariableText(
                      enText: 'Alert',
                      arText: 'اتنبيه',
                    )),
                    content: Text(FFLocalizations.of(context).getVariableText(
                      enText: 'your account will be deleted within 48 hours',
                      arText: 'سيتم حذف حسابك خلال 48 ساعة',
                    )),
                    actions: [
                      TextButton(
                        onPressed: () =>
                            Navigator.pop(alertDialogContext, false),
                        child: Text(FFLocalizations.of(context).getVariableText(
                          enText: 'Cancel',
                          arText: 'الغاء',
                        )),
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.pop(alertDialogContext, true),
                        child: Text(FFLocalizations.of(context).getVariableText(
                          enText: 'Delete Account',
                          arText: 'حذف الحساب',
                        )),
                      ),
                    ],
                  );
                },
              ) ??
              false;
          if (confirmDialogResponse) {
            _model.apiResultzzx = await NewsApiCall.call(
              token: FFAppState().userModel.token,
            );
            if ((_model.apiResultzzx?.succeeded ?? true)) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    FFLocalizations.of(context).getVariableText(
                      enText: 'Success',
                      arText: 'عملية ناجحة',
                    ),
                    style: TextStyle(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                  ),
                  duration: Duration(milliseconds: 4000),
                  backgroundColor: FlutterFlowTheme.of(context).info,
                ),
              );
            }
          }

          setState(() {});
        },
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.delete_forever,
                    color: FlutterFlowTheme.of(context).alternate,
                    size: 24.0,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'p2kvejv5' /* Delete Account */,
                      ),
                      style: GoogleFonts.getFont(
                        'Poppins',
                        color: FlutterFlowTheme.of(context).alternate,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 0.5,
              decoration: BoxDecoration(
                color: Color(0xFF85BAF9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
