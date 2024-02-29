import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui_screens/components/hynday_app_bar/hynday_app_bar_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'car_model_page_model.dart';
export 'car_model_page_model.dart';

class CarModelPageWidget extends StatefulWidget {
  const CarModelPageWidget({super.key});

  @override
  State<CarModelPageWidget> createState() => _CarModelPageWidgetState();
}

class _CarModelPageWidgetState extends State<CarModelPageWidget> {
  late CarModelPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarModelPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().listOfCarsModelAppState.isEmpty) {
        setState(() {
          _model.listOfCarModels =
              FFAppState().listOfCarsModelAppState.toList().cast<dynamic>();
        });
      }
      _model.apiResultzn4 = await CarModelsApiCall.call(
        token: FFAppState().userModel.token,
      );
      if ((_model.apiResultzn4?.succeeded ?? true)) {
        setState(() {
          _model.listOfCarModels = CarModelsApiCall.carModelList(
            (_model.apiResultzn4?.jsonBody ?? ''),
          )!
              .toList()
              .cast<dynamic>();
        });
      }
    });

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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/Group_72977.png',
                ).image,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                wrapWithModel(
                  model: _model.hyndayAppBarModel,
                  updateCallback: () => setState(() {}),
                  child: HyndayAppBarWidget(
                    appBarTitle: FFLocalizations.of(context).getVariableText(
                      enText: 'Car model',
                      arText: 'طراز السيارة',
                    ),
                    isMyProfileOpend: false,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30.0, 10.0, 30.0, 5.0),
                          child: Builder(
                            builder: (context) {
                              final gridOfCarModelsItem =
                                  _model.listOfCarModels.map((e) => e).toList();
                              return GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                  childAspectRatio: 0.85,
                                ),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: gridOfCarModelsItem.length,
                                itemBuilder:
                                    (context, gridOfCarModelsItemIndex) {
                                  final gridOfCarModelsItemItem =
                                      gridOfCarModelsItem[
                                          gridOfCarModelsItemIndex];
                                  return Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                              sigmaX: 5.0,
                                              sigmaY: 5.0,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'CarModelDetails',
                                              queryParameters: {
                                                'carJsonItem': serializeParam(
                                                  getJsonField(
                                                    gridOfCarModelsItemItem,
                                                    r'''$''',
                                                  ),
                                                  ParamType.JSON,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            );
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0x74FFFEFE),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 10.0,
                                                    color: Color(0x80FFFEFE),
                                                    offset: Offset(0.0, 2.0),
                                                    spreadRadius: 0.0,
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      getJsonField(
                                                        gridOfCarModelsItemItem,
                                                        r'''$.name''',
                                                      ).toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                        fontFamily: 'HeeboBold',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16.0,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: AspectRatio(
                                                        aspectRatio: 3.0,
                                                        child: Image.network(
                                                          getJsonField(
                                                            gridOfCarModelsItemItem,
                                                            r'''$.full_image''',
                                                          ).toString(),
                                                          fit: BoxFit.contain,
                                                          errorBuilder: (context,
                                                                  error,
                                                                  stackTrace) =>
                                                              Image.asset(
                                                            'assets/images/error_image.png',
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
