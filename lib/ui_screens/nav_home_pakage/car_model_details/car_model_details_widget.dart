import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui_screens/components/bottom_nav_bar_component/bottom_nav_bar_component_widget.dart';
import '/ui_screens/components/hynday_app_bar/hynday_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'car_model_details_model.dart';
export 'car_model_details_model.dart';

class CarModelDetailsWidget extends StatefulWidget {
  const CarModelDetailsWidget({
    Key? key,
    required this.itemIndex,
  }) : super(key: key);

  final int? itemIndex;

  @override
  _CarModelDetailsWidgetState createState() => _CarModelDetailsWidgetState();
}

class _CarModelDetailsWidgetState extends State<CarModelDetailsWidget>
    with TickerProviderStateMixin {
  late CarModelDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.linear,
          delay: 100.ms,
          duration: 500.ms,
          begin: Offset(0.0, 800.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1530.ms,
          begin: Offset(400.0, 0.0),
          end: Offset(100.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarModelDetailsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 33.0, 0.0, 0.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/Group_70639@2x.png',
              ).image,
            ),
          ),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.00, 1.00),
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: 600.0,
                    ),
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 5.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 70.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFC1D6EF),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Flexible(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'assets/images/the-new-sonata-dn8-2023-quater-view@2x.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ).animateOnPageLoad(
                                animationsMap['rowOnPageLoadAnimation']!),
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 5.0, 5.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xFFC1D6EF),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 5.0, 0.0),
                                child: ListView(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    0,
                                    0,
                                    60.0,
                                  ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation']!),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.hyndayAppBarModel,
                          updateCallback: () => setState(() {}),
                          child: HyndayAppBarWidget(
                            appBarTitle:
                                FFLocalizations.of(context).getVariableText(
                              enText: 'Car model',
                              arText: 'موديلات السيارات',
                            ),
                            isMyProfileOpend: false,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.bottomNavBarComponentModel,
                          updateCallback: () => setState(() {}),
                          child: BottomNavBarComponentWidget(),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
