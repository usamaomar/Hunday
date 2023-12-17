import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui_screens/components/hynday_app_bar/hynday_app_bar_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'cart_summary_page_widget.dart' show CartSummaryPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartSummaryPageModel extends FlutterFlowModel<CartSummaryPageWidget> {
  ///  Local state fields for this page.

  CartItemModelStruct? cartObject;
  void updateCartObjectStruct(Function(CartItemModelStruct) updateFn) =>
      updateFn(cartObject ??= CartItemModelStruct());

  bool addingCouponeIsSuccess = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getMyCartApi)] action in CartSummaryPage widget.
  ApiCallResponse? apiResult3z0;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (addCouponApi)] action in Button widget.
  ApiCallResponse? apiResult5gw;
  // Stores action output result for [Backend Call - API (getMyCartApi)] action in Button widget.
  ApiCallResponse? apiResult3z0cc;
  // Stores action output result for [Backend Call - API (removeCouponApi)] action in Text widget.
  ApiCallResponse? apiResultw5l;
  // Stores action output result for [Backend Call - API (getMyCartApi)] action in Text widget.
  ApiCallResponse? apiResult3z0vcvcv;
  // Model for HyndayAppBar component.
  late HyndayAppBarModel hyndayAppBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    hyndayAppBarModel = createModel(context, () => HyndayAppBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    hyndayAppBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
