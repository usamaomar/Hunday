import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/ui_screens/components/reguler_edit_text_values/reguler_edit_text_values_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test_drive_component_model.dart';
export 'test_drive_component_model.dart';

class TestDriveComponentWidget extends StatefulWidget {
  const TestDriveComponentWidget({Key? key}) : super(key: key);

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
      height: 500.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Stack(
        children: [
          Opacity(
            opacity: 0.3,
            child: Container(
              width: double.infinity,
              height: 500.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).white,
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 2.0,
                sigmaY: 2.0,
              ),
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
                            'smmv6dor' /* Test Drive */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'HeeboBold',
                                    color: Color(0xFF092853),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                        ),
                        Icon(
                          Icons.close_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                    color: Color(0xFF3D6398),
                  ),
                  wrapWithModel(
                    model: _model.regulerEditTextValuesModel1,
                    updateCallback: () => setState(() {}),
                    child: RegulerEditTextValuesWidget(
                      titleahint: FFLocalizations.of(context).getText(
                        'k71uebj4' /* Name */,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                    child: wrapWithModel(
                      model: _model.regulerEditTextValuesModel2,
                      updateCallback: () => setState(() {}),
                      child: RegulerEditTextValuesWidget(
                        titleahint: FFLocalizations.of(context).getText(
                          'wgndoaog' /* Name */,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
