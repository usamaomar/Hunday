import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/ui_screens/components/scan_component_aleart/scan_component_aleart_widget.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'scanned_card_animation_component_model.dart';
export 'scanned_card_animation_component_model.dart';

class ScannedCardAnimationComponentWidget extends StatefulWidget {
  const ScannedCardAnimationComponentWidget({Key? key}) : super(key: key);

  @override
  _ScannedCardAnimationComponentWidgetState createState() =>
      _ScannedCardAnimationComponentWidgetState();
}

class _ScannedCardAnimationComponentWidgetState
    extends State<ScannedCardAnimationComponentWidget> {
  late ScannedCardAnimationComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScannedCardAnimationComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
    });

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
      padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
      child: Container(
        height: 450.0,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 50.0,
              decoration: BoxDecoration(
                color: Color(0xFF3D6398),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'fn1vr72f' /* Vehicle License */,
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'HeeboBold',
                      color: FlutterFlowTheme.of(context).white,
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                        child: ClipRRect(
                          child: Container(
                            width: double.infinity,
                            constraints: BoxConstraints(
                              maxWidth: double.infinity,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Lottie.asset(
                                'assets/lottie_animations/board2.json',
                                width: 370.0,
                                height: 250.0,
                                fit: BoxFit.fill,
                                animate: true,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Builder(
                  builder: (context) => FlutterFlowTimer(
                    initialTime: _model.timerMilliseconds,
                    getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                      value,
                      hours: false,
                      milliSecond: false,
                    ),
                    controller: _model.timerController,
                    updateStateInterval: Duration(milliseconds: 1000),
                    onChanged: (value, displayTime, shouldUpdate) {
                      _model.timerMilliseconds = value;
                      _model.timerValue = displayTime;
                      if (shouldUpdate) setState(() {});
                    },
                    onEnded: () async {
                      Navigator.pop(context);
                      await showAlignedDialog(
                        context: context,
                        isGlobal: true,
                        avoidOverflow: false,
                        targetAnchor: AlignmentDirectional(0.0, 0.0)
                            .resolve(Directionality.of(context)),
                        followerAnchor: AlignmentDirectional(0.0, 0.0)
                            .resolve(Directionality.of(context)),
                        builder: (dialogContext) {
                          return Material(
                            color: Colors.transparent,
                            child: Container(
                              height: 450.0,
                              child: ScanComponentAleartWidget(),
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    },
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Poppins',
                          color: Color(0x60FFFFFF),
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
