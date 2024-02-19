import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui_screens/nav_pakege/cart_bottom_sheet/cart_bottom_sheet_widget.dart';
import 'cart_page_widget.dart' show CartPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartPageModel extends FlutterFlowModel<CartPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for CartBottomSheet component.
  late CartBottomSheetModel cartBottomSheetModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    cartBottomSheetModel = createModel(context, () => CartBottomSheetModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    cartBottomSheetModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
