import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_list_component_model.dart';
export 'empty_list_component_model.dart';

class EmptyListComponentWidget extends StatefulWidget {

  final Color? color;


    const EmptyListComponentWidget({super.key,this.color});

  @override
  State<EmptyListComponentWidget> createState() =>
      _EmptyListComponentWidgetState();
}

class _EmptyListComponentWidgetState extends State<EmptyListComponentWidget> {
  late EmptyListComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyListComponentModel());

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
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              FFLocalizations.of(context).getText(
                'vgub0o34' /* No content to show */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Heebo Regular',
                    fontSize: 16.0,
                    color: widget.color ?? Colors.black87,
                    fontWeight: FontWeight.w200,
                    useGoogleFonts: false,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
