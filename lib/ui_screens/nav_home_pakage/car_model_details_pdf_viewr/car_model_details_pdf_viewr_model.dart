import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui_screens/components/hynday_app_bar/hynday_app_bar_widget.dart';
import 'car_model_details_pdf_viewr_widget.dart'
    show CarModelDetailsPdfViewrWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CarModelDetailsPdfViewrModel
    extends FlutterFlowModel<CarModelDetailsPdfViewrWidget> {
  ///  Local state fields for this page.

  List<dynamic> listOfCarsModel = [];
  void addToListOfCarsModel(dynamic item) => listOfCarsModel.add(item);
  void removeFromListOfCarsModel(dynamic item) => listOfCarsModel.remove(item);
  void removeAtIndexFromListOfCarsModel(int index) =>
      listOfCarsModel.removeAt(index);
  void insertAtIndexInListOfCarsModel(int index, dynamic item) =>
      listOfCarsModel.insert(index, item);
  void updateListOfCarsModelAtIndex(int index, Function(dynamic) updateFn) =>
      listOfCarsModel[index] = updateFn(listOfCarsModel[index]);

  dynamic detailsJsonObject;

  ///  State fields for stateful widgets in this page.

  // Model for HyndayAppBar component.
  late HyndayAppBarModel hyndayAppBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    hyndayAppBarModel = createModel(context, () => HyndayAppBarModel());
  }

  void dispose() {
    hyndayAppBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
