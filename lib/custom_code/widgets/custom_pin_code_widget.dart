// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_verification_code/flutter_verification_code.dart';

class CustomPinCodeWidget extends StatefulWidget {
  const CustomPinCodeWidget({
    Key? key,
    this.width,
    this.height,
    this.onDialogMarkerSelected,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future<dynamic> Function()? onDialogMarkerSelected;
  @override
  _CustomPinCodeWidgetState createState() => _CustomPinCodeWidgetState();
}

class _CustomPinCodeWidgetState extends State<CustomPinCodeWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          VerificationCode(
            textStyle: TextStyle(fontSize: 20.0, color: Colors.red[900]),
            keyboardType: TextInputType.number,
            underlineColor: Colors
                .amber, // If this is null it will use primaryColor: Colors.red from Theme
            length: 4,
            cursorColor:
                Colors.blue, // If this is null it will default to the ambient
            // clearAll is NOT required, you can delete it
            // takes any widget, so you can implement your design
            onCompleted: (String value) {
              widget.onDialogMarkerSelected?.call();
            },
            onEditing: (bool value) {},
          )
        ]);
  }
}
