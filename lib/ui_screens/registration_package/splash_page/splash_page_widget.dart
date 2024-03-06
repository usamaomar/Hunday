import 'package:firebase_messaging/firebase_messaging.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'splash_page_model.dart';
export 'splash_page_model.dart';

class SplashPageWidget extends StatefulWidget {
  const SplashPageWidget({
    super.key,
    this.deepLinkId,
  });

  final String? deepLinkId;

  @override
  State<SplashPageWidget> createState() => _SplashPageWidgetState();
}

class _SplashPageWidgetState extends State<SplashPageWidget> {
  late SplashPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {

    // FirebaseMessaging.instance.onTokenRefresh.listen((fbToken) {
    //   FFAppState().FCM = fbToken ?? 'null';
    // }).onError((handleError){
    //   print('');
    // });
    //
    // FirebaseMessaging.instance.getToken().then((fbToken) {
    //   FFAppState().FCM = fbToken ?? 'null';
    // }).catchError((onError){
    //   print('');
    // });
    super.initState();
    // SchedulerBinding.instance.addPostFrameCallback((_) async {
    //   if(widget.deepLinkId!=null) {
    //     print("_SplashPageWidgetState");
    //     context.pushReplacementNamed(
    //       'HomeScreen',
    //       queryParameters: {
    //         'deepLinkId': serializeParam(
    //           widget.deepLinkId,
    //           ParamType.String,
    //         ),
    //       }.withoutNulls,
    //     );
    //   }
    // });
    _model = createModel(context, () => SplashPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.deepLinkId == null) {
        _model.timerController.onStartTimer();
      }
      if (FFAppState().currentLanguge != null &&
          FFAppState().currentLanguge != '') {
        setAppLanguage(context, FFAppState().currentLanguge);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Lottie.network(
                          'https://lottie.host/b4e379f4-beb9-4ed4-9686-87f8e18dd09a/YmcSTeqvAH.json',
                          fit: BoxFit.fill,
                          animate: true,
                          repeat: false),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Opacity(
                opacity: 0.0,
                child: FlutterFlowTimer(
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
                    _model.timerController.onStopTimer();
                    print('timer stopped');
                    if (FFAppState().isGust) {
                      context.pushReplacementNamed('HomeScreen');
                    } else if (FFAppState().userModel.token.isNotEmpty) {
                      context.pushReplacementNamed('HomeScreen');
                    } else {
                      context.pushReplacementNamed('startPage');
                    }
                  },
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).headlineSmall,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
