import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui_screens/components/hynday_app_bar/hynday_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'car_model_details_pdf_viewr_model.dart';
export 'car_model_details_pdf_viewr_model.dart';

class CarModelDetailsPdfViewrWidget extends StatefulWidget {
  const CarModelDetailsPdfViewrWidget({
    super.key,
    required this.pdfLink,
  });

  final String? pdfLink;

  @override
  State<CarModelDetailsPdfViewrWidget> createState() =>
      _CarModelDetailsPdfViewrWidgetState();
}

class _CarModelDetailsPdfViewrWidgetState
    extends State<CarModelDetailsPdfViewrWidget> {
  late CarModelDetailsPdfViewrModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarModelDetailsPdfViewrModel());

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
      backgroundColor: FlutterFlowTheme.of(context).white,
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            wrapWithModel(
              model: _model.hyndayAppBarModel,
              updateCallback: () => setState(() {}),
              child: HyndayAppBarWidget(
                appBarTitle: '   ',
                isMyProfileOpend: false,
              ),
            ),
            Expanded(
              child: FlutterFlowPdfViewer(
                networkPath: widget.pdfLink!,
                height: 300.0,
                horizontalScroll: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
