import 'package:hyundai/ui_screens/components/select_image_or_take/select_image_or_take_model.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'chat_page_widget.dart' show ChatPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatPageModel extends FlutterFlowModel<ChatPageWidget> {
  ///  State fields for stateful widgets in this page.

  late   FocusNode? unfocusNode = FocusNode();
  List<Map<Object?, Object?>> mapValue = [];
  int? adminUnRead = 0;
  String? adminUnReadKey = '';
  // bool? hasBeenTriggered = false;
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
  FFUploadedFile(bytes: Uint8List.fromList([]));
  late SelectImageOrTakeModel newsBottomSheetComponentModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    newsBottomSheetComponentModel =
        createModel(context, () => SelectImageOrTakeModel());
  }

  @override
  void dispose() {
    unfocusNode?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
    newsBottomSheetComponentModel.dispose();
  }



  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
