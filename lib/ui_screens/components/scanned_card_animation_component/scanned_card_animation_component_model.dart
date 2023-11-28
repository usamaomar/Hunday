import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/ui_screens/components/scan_component_aleart/scan_component_aleart_widget.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'scanned_card_animation_component_widget.dart'
    show ScannedCardAnimationComponentWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ScannedCardAnimationComponentModel
    extends FlutterFlowModel<ScannedCardAnimationComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Timer widget.
  int timerMilliseconds = 6000;
  String timerValue = StopWatchTimer.getDisplayTime(
    6000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    timerController.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
