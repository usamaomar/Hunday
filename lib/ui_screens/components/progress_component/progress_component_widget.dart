import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'progress_component_model.dart';
export 'progress_component_model.dart';

class ProgressComponentWidget extends StatefulWidget {
  const ProgressComponentWidget({super.key});

  @override
  State<ProgressComponentWidget> createState() =>
      _ProgressComponentWidgetState();
}

class _ProgressComponentWidgetState extends State<ProgressComponentWidget>
    with TickerProviderStateMixin {
  late ProgressComponentModel _model;

  final animationsMap = {
    'progressBarOnPageLoadAnimation': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 500.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProgressComponentModel());

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
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: CircularPercentIndicator(
        percent: 0.5,
        radius: 25.0,
        lineWidth: 5.0,
        animation: true,
        animateFromLastPercent: true,
        progressColor: FlutterFlowTheme.of(context).info,
        backgroundColor: FlutterFlowTheme.of(context).accent4,
      ).animateOnPageLoad(animationsMap['progressBarOnPageLoadAnimation']!),
    );
  }
}
