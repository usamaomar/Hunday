import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dash_board_input_fieald_model.dart';
export 'dash_board_input_fieald_model.dart';

class DashBoardInputFiealdWidget extends StatefulWidget {
  const DashBoardInputFiealdWidget({
    super.key,
    required this.title,
    this.textFieald,
  });

  final String? title;
  final String? textFieald;

  @override
  State<DashBoardInputFiealdWidget> createState() =>
      _DashBoardInputFiealdWidgetState();
}

class _DashBoardInputFiealdWidgetState
    extends State<DashBoardInputFiealdWidget> {
  late DashBoardInputFiealdModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashBoardInputFiealdModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title!,
          style: FlutterFlowTheme.of(context).titleSmall.override(
                fontFamily: 'HeeboBold',
                color: Color(0xFF3D6398),
                useGoogleFonts: false,
              ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
            child: TextFormField(
              controller: _model.textController,
              focusNode: _model.textFieldFocusNode,
              textInputAction: TextInputAction.next,
              obscureText: false,
              decoration: InputDecoration(
                isDense: true,
                labelText: widget.textFieald,
                hintStyle: FlutterFlowTheme.of(context).bodyLarge,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF81787A),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF3D6398),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              style: FlutterFlowTheme.of(context).bodyLarge,
              validator: _model.textControllerValidator.asValidator(context),
            ),
          ),
        ),
      ],
    );
  }
}
