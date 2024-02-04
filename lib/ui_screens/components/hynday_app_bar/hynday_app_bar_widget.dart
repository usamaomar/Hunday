import 'package:flutter/cupertino.dart';

import '../../../backend/api_requests/api_calls.dart';
import '../../../backend/api_requests/api_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'hynday_app_bar_model.dart';
export 'hynday_app_bar_model.dart';
import 'package:badges/badges.dart' as badges;

class HyndayAppBarWidget extends StatefulWidget {
  const HyndayAppBarWidget({
    super.key,
    required this.appBarTitle,
    this.isMyProfileOpend,
    this.isIconsHidden,
  });

  final String? appBarTitle;
  final bool? isMyProfileOpend;
  final bool? isIconsHidden;

  @override
  State<HyndayAppBarWidget> createState() => _HyndayAppBarWidgetState();
}

class _HyndayAppBarWidgetState extends State<HyndayAppBarWidget> {
  late HyndayAppBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HyndayAppBarModel());
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
      child: ClipRRect(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                elevation: 15.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      30.0, 0.0, 30.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 5.0, 0.0, 0.0),
                        child: (widget.isIconsHidden ?? true)
                            ? InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (widget.isMyProfileOpend != true) {
                                    context.pushNamed(
                                      'MyProfilePage',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey:
                                            const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  }
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: SvgPicture.asset(
                                    'assets/images/Group_70676.svg',
                                    width: 40.0,
                                    height: 40.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              )
                            : Container(
                                width: 40,
                                height: 40,
                              ),
                      ),
                      Visibility(
                        visible: widget.isIconsHidden ?? true,
                        child: InkWell(
                          onTap: () {
                            showGeneralDialog(
                              context: context,
                              barrierDismissible: true,
                              transitionDuration:
                                  const Duration(milliseconds: 500),
                              barrierLabel:
                                  MaterialLocalizations.of(context).dialogLabel,
                              barrierColor: Colors.black.withOpacity(0),
                              pageBuilder: (context, _, __) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Card(
                                        child: ListView(
                                          primary: false,
                                          shrinkWrap: true,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      15, 20, 15, 20),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getVariableText(
                                                      enText: 'Notifications',
                                                      arText: 'الاشعارات',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'HeeboBold',
                                                          color: const Color(
                                                              0xFF092853),
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      context.safePop();
                                                    },
                                                    child: const Icon(
                                                      Icons.close_outlined,
                                                      color: Color(0xFF3D6398),
                                                      size: 24.0,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 200,
                                              margin: const EdgeInsets.fromLTRB(
                                                  20, 0, 20, 30),
                                              height: 1,
                                              color: Color(0xFF3D6398),
                                            ),
                                            FutureBuilder<ApiCallResponse>(
                                              future:
                                                  MyNotificationsApiCall.call(
                                                token: FFAppState()
                                                    .userModel
                                                    .token,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child: SpinKitDualRing(
                                                        color:
                                                            Color(0xFF092853),
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final listViewMyNotificationsApiResponse =
                                                    snapshot.data!;
                                                return Builder(
                                                  builder: (context) {
                                                    final linst = getJsonField(
                                                      listViewMyNotificationsApiResponse
                                                          .jsonBody,
                                                      r'''$.notifications''',
                                                    ).toList();
                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          linst.length > 4
                                                              ? 3
                                                              : linst.length,
                                                      itemBuilder: (context,
                                                          linstIndex) {
                                                        final linstItem =
                                                            linst[linstIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      30.0,
                                                                      0.0,
                                                                      30.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .notifications_sharp,
                                                                color: Color(
                                                                    0xFF3D6398),
                                                                size: 24.0,
                                                              ),
                                                              Flexible(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        getJsonField(
                                                                          linstItem,
                                                                          r'''$.title''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'HeeboBold',
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            10.0),
                                                                        child:
                                                                            Text(
                                                                          getJsonField(
                                                                            linstItem,
                                                                            r'''$.body''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Heebo Regular',
                                                                                fontWeight: FontWeight.normal,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                        child:
                                                                            Text(
                                                                          getJsonField(
                                                                            linstItem,
                                                                            r'''$.sent_at''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Heebo Regular',
                                                                                color: Color(0xFF3D6398),
                                                                                fontSize: 13.0,
                                                                                fontWeight: FontWeight.w300,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Opacity(
                                                                        opacity:
                                                                            0.2,
                                                                        child:
                                                                            Divider(
                                                                          thickness:
                                                                              1.0,
                                                                          color:
                                                                              Color(0xFF3D6398),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                            InkWell(
                                              onTap: () {
                                                FFAppState().localNotificationLost.clear();
                                                context.pushNamed(
                                                    'notificationPage');
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 20, 0, 20),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                        enText: 'See All',
                                                        arText: 'مشاهدة الكل',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'HeeboBold',
                                                            color: const Color(
                                                                0xFF1E4E93),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                              transitionBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return SlideTransition(
                                  position: CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.easeOut,
                                  ).drive(Tween<Offset>(
                                    begin: const Offset(0, -1.0),
                                    end: Offset.zero,
                                  )),
                                  child: child,
                                );
                              },
                            );
                          },
                          child: badges.Badge(
                            badgeStyle:
                                badges.BadgeStyle(padding: EdgeInsets.all(5)),
                            badgeAnimation: badges.BadgeAnimation.scale(),
                            badgeContent: Text(
                              '${FFAppState().localNotificationLost.length}',
                              style: TextStyle(color: Colors.white),
                            ),
                            child: Icon(
                              Icons.notifications_sharp,
                              color: Color(0xFF092853),
                              size: 30.0,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: SvgPicture.asset(
                                'assets/images/Group_70674.svg',
                                width: 80.0,
                                height: 20.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(30.0, 10.0, 30.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.safePop();
                      },
                      child: const Icon(
                        Icons.keyboard_backspace,
                        color: Color(0xFF092853),
                        size: 40.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          10.0, 0.0, 10.0, 0.0),
                      child: Text(
                        widget.appBarTitle!,
                        style: const TextStyle(
                          fontFamily: 'HeeboBold',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
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
    );
  }
}
