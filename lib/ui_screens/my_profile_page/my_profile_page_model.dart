import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui_screens/app_bar_packages/my_orders_and_appointments_component/my_orders_and_appointments_component_widget.dart';
import '/ui_screens/components/hynday_app_bar/hynday_app_bar_widget.dart';
import '/ui_screens/components/logout_dialog/logout_dialog_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'my_profile_page_widget.dart' show MyProfilePageWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyProfilePageModel extends FlutterFlowModel<MyProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for HyndayAppBar component.
  late HyndayAppBarModel hyndayAppBarModel;
  // Model for MyOrdersAndAppointmentsComponent component.
  late MyOrdersAndAppointmentsComponentModel
      myOrdersAndAppointmentsComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    hyndayAppBarModel = createModel(context, () => HyndayAppBarModel());
    myOrdersAndAppointmentsComponentModel =
        createModel(context, () => MyOrdersAndAppointmentsComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    hyndayAppBarModel.dispose();
    myOrdersAndAppointmentsComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
