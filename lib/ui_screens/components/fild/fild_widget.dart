import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'fild_model.dart';
export 'fild_model.dart';

class FildWidget extends StatefulWidget {
  const FildWidget({
    super.key,
    required this.titleahint,
    this.leadingIcon,
  });

  final String? titleahint;
  final Widget? leadingIcon;

  @override
  State<FildWidget> createState() => _FildWidgetState();
}

class _FildWidgetState extends State<FildWidget> {
  late FildModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FildModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.textController?.text = FFLocalizations.of(context).getText(
            '0maaa2t2' /*  */,
          );
        }));
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
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Color(0xE4FFFFFF),
              child: TextFormField(
                controller: _model.textController,
                focusNode: _model.textFieldFocusNode,
                autofocus: true,
                textInputAction: TextInputAction.next,
                obscureText: false,
                decoration: InputDecoration(
                  labelStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Heebo Regular',
                        useGoogleFonts: false,
                      ),
                  hintText: widget.titleahint,
                  hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Heebo Regular',
                        color: Color(0xFFAAAAAA),
                        fontSize: 14.0,
                        useGoogleFonts: false,
                      ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  prefixIcon: widget.leadingIcon,
                ),
                style: FlutterFlowTheme.of(context).titleSmall,
                validator: _model.textControllerValidator.asValidator(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
