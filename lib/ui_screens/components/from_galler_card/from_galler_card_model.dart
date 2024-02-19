import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/ui_screens/components/list_of_string_items_component/list_of_string_items_component_widget.dart';
import '/ui_screens/components/modal06_basic_information/modal06_basic_information_widget.dart';
import 'dart:ui';
import 'from_galler_card_widget.dart' show FromGallerCardWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FromGallerCardModel extends FlutterFlowModel<FromGallerCardWidget> {
  ///  Local state fields for this component.

  FFUploadedFile? frontFaceImage;

  FFUploadedFile? backFaceImage;

  bool isFrontAdded = false;

  bool isBackAdded = false;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (licenseScanApi)] action in Button widget.
  ApiCallResponse? apiResultixl;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
