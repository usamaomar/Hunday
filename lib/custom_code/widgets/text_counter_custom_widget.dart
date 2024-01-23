// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';

class TextCounterCustomWidget extends StatefulWidget {
  const TextCounterCustomWidget(
      {Key? key,
      this.width,
      this.height,
      this.recallText,
      this.onRecallClicked})
      : super(key: key);

  final double? width;
  final double? height;
  final String? recallText;
  final Future<dynamic> Function()? onRecallClicked;

  @override
  _TextCounterCustomWidgetState createState() =>
      _TextCounterCustomWidgetState();
}

class _TextCounterCustomWidgetState extends State<TextCounterCustomWidget> {
  late Timer _timer;
  bool showCounter = true;
  int minutes = 3;
  int seconds = 0;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (minutes == 0 && seconds == 0) {
        // When the countdown reaches 00:00, toggle to "ReCallCode"
        setState(() {
          showCounter = false;
          timer.cancel();
        });
      } else {
        setState(() {
          if (seconds == 0) {
            minutes--;
            seconds = 59;
          } else {
            seconds--;
          }
        });
      }
    });
  }

  void toggleCounter() {
    setState(() {
      if (!showCounter) {
        // If "ReCallCode" is shown, start the countdown again
        minutes = 3;
        seconds = 0;
        showCounter = true;
        widget.onRecallClicked?.call();
        startCountdown();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleCounter,
      child: Container(
        child: Center(
          child: Text(
            showCounter
                ? '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}'
                : '${widget.recallText}',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'HeeboBold',
                  color: Color(0xFF092853),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  useGoogleFonts: false,
                ),
          ),
        ),
      ),
    );
  }
}
